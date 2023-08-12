import 'dart:async';

import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../models/pub_model.dart';
import '../repositories/pub_repository.dart';

part 'provider.g.dart';

@riverpod
Future<List<Package>> fetchPackages(
  FetchPackagesRef ref, {
  required int page,
  String search = '',
}) async {
  assert(page > 0, 'page offset starts at 1');
  final cancelToken = ref.cancelToken();

  if (search.isEmpty) {
    return ref
        .watch(pubRepositoryProvider)
        .getPackages(page: page, cancelToken: cancelToken);
  }

  // Debouncing searches by delaying the request.
  // If the search was cancelled during this delay, the network request will
  // not be performed.
  await Future<void>.delayed(const Duration(milliseconds: 250));
  if (cancelToken.isCancelled) {
    throw Exception('cancelled');
  }

  final searchedPackages = await ref
      .watch(pubRepositoryProvider)
      .searchPackages(page: page, search: search, cancelToken: cancelToken);

  return Future.wait([
    for (final package in searchedPackages)
      ref.watch(
        FetchPackageDetailsProvider(packageName: package.package).future,
      ),
  ]);
}

extension CancelTokenX on Ref {
  CancelToken cancelToken() {
    final cancelToken = CancelToken();
    onDispose(cancelToken.cancel);
    return cancelToken;
  }
}

@riverpod
Future<Package> fetchPackageDetails(
  FetchPackageDetailsRef ref, {
  required String packageName,
}) async {
  final cancelToken = ref.cancelToken();

  return ref
      .watch(pubRepositoryProvider)
      .getPackageDetails(packageName: packageName, cancelToken: cancelToken);
}

@riverpod
Future<List<String>> likedPackages(LikedPackagesRef ref) async {
  final cancelToken = ref.cancelToken();

  return ref
      .watch(pubRepositoryProvider)
      .getLikedPackages(cancelToken: cancelToken);
}

@riverpod
PubRepository pubRepository(PubRepositoryRef ref) => PubRepository();

/// A provider that fetches the likes count, popularity score and pub points
/// for a given package.
///
/// It also exposes utilities to like/unlike a package, assuming the user
/// is logged-in.
@riverpod
class PackageMetrics extends _$PackageMetrics {
  @override
  Future<PackageMetricsScore> build({required String packageName}) async {
    final metrics = await ref
        .watch(pubRepositoryProvider)
        .getPackageMetrics(packageName: packageName);

    // Automatically refresh the package metrics page every 5 seconds
    final timer = Timer(const Duration(seconds: 5), () => ref.invalidateSelf());
    // If the request was refreshed before the 5 second timer completes,
    // cancel the timer.
    ref.onDispose(timer.cancel);

    return metrics;
  }

  Future<void> like() async {
    await ref.read(pubRepositoryProvider).like(packageName: packageName);

    /// Since the like count as change, we refresh the package metrics.
    /// We could alternatively do something like:
    // state = AsyncData(
    //   state.value!.copyWith(likeCount: state.value!.likeCount + 1),
    // );
    ref.invalidateSelf();

    // Since we liked a package, the list of liked packages should also be updated.
    // An alternative could be:
    // - convert likedPackages to a class
    // - add a like/unlike methods that updates the list of liked packages
    // - call ref.read(likedPackagesProvider).like(packageName);
    ref.invalidate(likedPackagesProvider);
  }

  Future<void> unlike() async {
    await ref.read(pubRepositoryProvider).unlike(packageName: packageName);

    ref.invalidateSelf();
    ref.invalidate(likedPackagesProvider);
  }
}
