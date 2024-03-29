import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../models/pub_model.dart';

const userToken = '';

class PubRepository {
  PubRepository() {
    _configureDio();
  }

  static const _scheme = 'https';
  static const _host = 'pub.dartlang.org';
  final dio = Dio();

  Future<List<Package>> getPackages({
    required int page,
    CancelToken? cancelToken,
  }) async {
    final uri = Uri(
      scheme: _scheme,
      host: _host,
      path: 'api/packages',
      queryParameters: <String, String>{'page': '$page'},
    );

    final response = await dio.getUri<Map<String, Object?>>(
      uri,
      cancelToken: cancelToken,
    );

    final packagesResponse = PubPackagesResponse.fromJson(response.data!);
    return packagesResponse.packages;
  }

  Future<List<SearchPackage>> searchPackages({
    required int page,
    required String search,
    CancelToken? cancelToken,
  }) async {
    final uri = Uri(
      scheme: _scheme,
      host: _host,
      path: 'api/search',
      queryParameters: <String, String>{'page': '$page', 'q': search},
    );
    // Returns {packages: [{ package: string }]}
    final response = await dio.getUri<Map<String, Object?>>(
      uri,
      cancelToken: cancelToken,
    );

    final packagesResponse = PubSearchResponse.fromJson(response.data!);
    return packagesResponse.packages;
  }

  Future<Package> getPackageDetails({
    required String packageName,
    CancelToken? cancelToken,
  }) async {
    final uri = Uri(
      scheme: _scheme,
      host: _host,
      path: 'api/packages/$packageName',
    );

    final response = await dio.getUri<Map<String, Object?>>(
      uri,
      cancelToken: cancelToken,
    );

    final packageResponse = Package.fromJson(response.data!);
    return packageResponse;
  }

  Future<PackageMetricsScore> getPackageMetrics({
    required String packageName,
    CancelToken? cancelToken,
  }) async {
    final uri = Uri(
      scheme: _scheme,
      host: _host,
      path: 'api/packages/$packageName/metrics',
    );

    final responseFuture = dio.getUri<Map<String, Object?>>(
      uri,
      cancelToken: cancelToken,
    );

    final likesUri = Uri(
      scheme: _scheme,
      host: _host,
      path: 'api/packages/$packageName/likes',
    );

    /// Although the metrics request does include the likes count, it seems that
    /// the server caches the response for a long period of time.
    /// For the same of "http polling" showcase, we're separately fetching the likes
    /// count
    final likesResponsFuture = dio.getUri<Map<String, Object?>>(
      likesUri,
      cancelToken: cancelToken,
    );

    final metricsResponse =
        PackageMetricsResponse.fromJson((await responseFuture).data!);
    return metricsResponse.score.copyWith(
      likeCount: (await likesResponsFuture).data!['likes']! as int,
    );
  }

  Future<void> like({
    required String packageName,
    CancelToken? cancelToken,
  }) async {
    final uri = Uri(
      scheme: _scheme,
      host: _host,
      path: 'api/account/likes/$packageName',
    );

    await dio.putUri<void>(
      uri,
      cancelToken: cancelToken,
      options: Options(
        headers: <String, String>{'authorization': userToken},
      ),
    );
  }

  Future<void> unlike({
    required String packageName,
    CancelToken? cancelToken,
  }) async {
    final uri = Uri(
      scheme: _scheme,
      host: _host,
      path: 'api/account/likes/$packageName',
    );

    await dio.deleteUri<void>(
      uri,
      cancelToken: cancelToken,
      options: Options(headers: <String, String>{'authorization': userToken}),
    );
  }

  Future<List<String>> getLikedPackages({CancelToken? cancelToken}) async {
    final uri = Uri(
      scheme: _scheme,
      host: _host,
      path: 'api/account/likes',
    );

    final response = await dio.getUri<Map<String, Object?>>(
      uri,
      cancelToken: cancelToken,
      options: Options(
        headers: <String, String>{'authorization': userToken},
      ),
    );

    final packageResponse = LikedPackagesResponse.fromJson(response.data!);
    return packageResponse.likedPackages.map((e) => e.package).toList();
  }

  void _configureDio() {
    if (kIsWeb) {
      dio.interceptors.add(PubProxyInterceptor());
    }
  }
}

// A custom interceptor that proxies requests to a cors-proxy server
// in order to workaround the CORS issue on web platform.
class PubProxyInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    super.onRequest(
      options.copyWith(
        path: 'https://api.codetabs.com/v1/proxy/?quest=${options.path}',
      ),
      handler,
    );
  }
}
