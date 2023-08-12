import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pubspec_parse/pubspec_parse.dart';

part 'pub_model.g.dart';
part 'pub_model.freezed.dart';

@freezed
class PackageMetricsScore with _$PackageMetricsScore {
  factory PackageMetricsScore({
    required int grantedPoints,
    required int maxPoints,
    required int likeCount,
    required double popularityScore,
    required List<String> tags,
  }) = _PackageMetricsScore;

  factory PackageMetricsScore.fromJson(Map<String, Object?> json) =>
      _$PackageMetricsScoreFromJson(json);
}

@freezed
class PackageMetricsResponse with _$PackageMetricsResponse {
  factory PackageMetricsResponse({
    required PackageMetricsScore score,
  }) = _PackageMetricsResponse;

  factory PackageMetricsResponse.fromJson(Map<String, Object?> json) =>
      _$PackageMetricsResponseFromJson(json);
}

@freezed
class PackageDetails with _$PackageDetails {
  factory PackageDetails({
    required String version,
    required Pubspec pubspec,
  }) = _PackageDetails;

  factory PackageDetails.fromJson(Map<String, Object?> json) =>
      _$PackageDetailsFromJson(json);
}

@freezed
class Package with _$Package {
  factory Package({
    required String name,
    required PackageDetails latest,
  }) = _Package;

  factory Package.fromJson(Map<String, Object?> json) =>
      _$PackageFromJson(json);
}

@freezed
class LikedPackage with _$LikedPackage {
  factory LikedPackage({required String package, required bool liked}) =
      _LikedPackage;

  factory LikedPackage.fromJson(Map<String, Object?> json) =>
      _$LikedPackageFromJson(json);
}

@freezed
class LikedPackagesResponse with _$LikedPackagesResponse {
  factory LikedPackagesResponse({required List<LikedPackage> likedPackages}) =
      _LikesPackagesResponse;

  factory LikedPackagesResponse.fromJson(Map<String, Object?> json) =>
      _$LikedPackagesResponseFromJson(json);
}

@freezed
class PubPackagesResponse with _$PubPackagesResponse {
  factory PubPackagesResponse({
    required List<Package> packages,
  }) = _PubPackagesResponse;

  factory PubPackagesResponse.fromJson(Map<String, Object?> json) =>
      _$PubPackagesResponseFromJson(json);
}

@freezed
class SearchPackage with _$SearchPackage {
  factory SearchPackage({required String package}) = _SearchPackage;

  factory SearchPackage.fromJson(Map<String, Object?> json) =>
      _$SearchPackageFromJson(json);
}

@freezed
class PubSearchResponse with _$PubSearchResponse {
  factory PubSearchResponse({
    required List<SearchPackage> packages,
  }) = _PubSearchResponse;

  factory PubSearchResponse.fromJson(Map<String, Object?> json) =>
      _$PubSearchResponseFromJson(json);
}
