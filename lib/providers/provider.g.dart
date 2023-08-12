// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$fetchPackagesHash() => r'3637226080ea667823875a135a6c4cf002cb0329';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

typedef FetchPackagesRef = AutoDisposeFutureProviderRef<List<Package>>;

/// See also [fetchPackages].
@ProviderFor(fetchPackages)
const fetchPackagesProvider = FetchPackagesFamily();

/// See also [fetchPackages].
class FetchPackagesFamily extends Family<AsyncValue<List<Package>>> {
  /// See also [fetchPackages].
  const FetchPackagesFamily();

  /// See also [fetchPackages].
  FetchPackagesProvider call({
    required int page,
    String search = '',
  }) {
    return FetchPackagesProvider(
      page: page,
      search: search,
    );
  }

  @override
  FetchPackagesProvider getProviderOverride(
    covariant FetchPackagesProvider provider,
  ) {
    return call(
      page: provider.page,
      search: provider.search,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'fetchPackagesProvider';
}

/// See also [fetchPackages].
class FetchPackagesProvider extends AutoDisposeFutureProvider<List<Package>> {
  /// See also [fetchPackages].
  FetchPackagesProvider({
    required this.page,
    this.search = '',
  }) : super.internal(
          (ref) => fetchPackages(
            ref,
            page: page,
            search: search,
          ),
          from: fetchPackagesProvider,
          name: r'fetchPackagesProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$fetchPackagesHash,
          dependencies: FetchPackagesFamily._dependencies,
          allTransitiveDependencies:
              FetchPackagesFamily._allTransitiveDependencies,
        );

  final int page;
  final String search;

  @override
  bool operator ==(Object other) {
    return other is FetchPackagesProvider &&
        other.page == page &&
        other.search == search;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, page.hashCode);
    hash = _SystemHash.combine(hash, search.hashCode);

    return _SystemHash.finish(hash);
  }
}

String _$fetchPackageDetailsHash() =>
    r'e65ba332cb8397cc5a1aca6e656233dff698391a';
typedef FetchPackageDetailsRef = AutoDisposeFutureProviderRef<Package>;

/// See also [fetchPackageDetails].
@ProviderFor(fetchPackageDetails)
const fetchPackageDetailsProvider = FetchPackageDetailsFamily();

/// See also [fetchPackageDetails].
class FetchPackageDetailsFamily extends Family<AsyncValue<Package>> {
  /// See also [fetchPackageDetails].
  const FetchPackageDetailsFamily();

  /// See also [fetchPackageDetails].
  FetchPackageDetailsProvider call({
    required String packageName,
  }) {
    return FetchPackageDetailsProvider(
      packageName: packageName,
    );
  }

  @override
  FetchPackageDetailsProvider getProviderOverride(
    covariant FetchPackageDetailsProvider provider,
  ) {
    return call(
      packageName: provider.packageName,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'fetchPackageDetailsProvider';
}

/// See also [fetchPackageDetails].
class FetchPackageDetailsProvider extends AutoDisposeFutureProvider<Package> {
  /// See also [fetchPackageDetails].
  FetchPackageDetailsProvider({
    required this.packageName,
  }) : super.internal(
          (ref) => fetchPackageDetails(
            ref,
            packageName: packageName,
          ),
          from: fetchPackageDetailsProvider,
          name: r'fetchPackageDetailsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$fetchPackageDetailsHash,
          dependencies: FetchPackageDetailsFamily._dependencies,
          allTransitiveDependencies:
              FetchPackageDetailsFamily._allTransitiveDependencies,
        );

  final String packageName;

  @override
  bool operator ==(Object other) {
    return other is FetchPackageDetailsProvider &&
        other.packageName == packageName;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, packageName.hashCode);

    return _SystemHash.finish(hash);
  }
}

String _$likedPackagesHash() => r'304a4def167e245812638cba776e8d5eb66d8844';

/// See also [likedPackages].
@ProviderFor(likedPackages)
final likedPackagesProvider = AutoDisposeFutureProvider<List<String>>.internal(
  likedPackages,
  name: r'likedPackagesProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$likedPackagesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef LikedPackagesRef = AutoDisposeFutureProviderRef<List<String>>;
String _$pubRepositoryHash() => r'1f4dbfa0911f6467067fab244677acbcb8c7ad4e';

/// See also [pubRepository].
@ProviderFor(pubRepository)
final pubRepositoryProvider = AutoDisposeProvider<dynamic>.internal(
  pubRepository,
  name: r'pubRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$pubRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef PubRepositoryRef = AutoDisposeProviderRef<dynamic>;
String _$packageMetricsHash() => r'67cd25e50357e6e970d432c1d255085a23b856ac';

abstract class _$PackageMetrics
    extends BuildlessAutoDisposeAsyncNotifier<PackageMetricsScore> {
  late final String packageName;

  Future<PackageMetricsScore> build({
    required String packageName,
  });
}

/// A provider that fetches the likes count, popularity score and pub points
/// for a given package.
///
/// It also exposes utilities to like/unlike a package, assuming the user
/// is logged-in.
///
/// Copied from [PackageMetrics].
@ProviderFor(PackageMetrics)
const packageMetricsProvider = PackageMetricsFamily();

/// A provider that fetches the likes count, popularity score and pub points
/// for a given package.
///
/// It also exposes utilities to like/unlike a package, assuming the user
/// is logged-in.
///
/// Copied from [PackageMetrics].
class PackageMetricsFamily extends Family<AsyncValue<PackageMetricsScore>> {
  /// A provider that fetches the likes count, popularity score and pub points
  /// for a given package.
  ///
  /// It also exposes utilities to like/unlike a package, assuming the user
  /// is logged-in.
  ///
  /// Copied from [PackageMetrics].
  const PackageMetricsFamily();

  /// A provider that fetches the likes count, popularity score and pub points
  /// for a given package.
  ///
  /// It also exposes utilities to like/unlike a package, assuming the user
  /// is logged-in.
  ///
  /// Copied from [PackageMetrics].
  PackageMetricsProvider call({
    required String packageName,
  }) {
    return PackageMetricsProvider(
      packageName: packageName,
    );
  }

  @override
  PackageMetricsProvider getProviderOverride(
    covariant PackageMetricsProvider provider,
  ) {
    return call(
      packageName: provider.packageName,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'packageMetricsProvider';
}

/// A provider that fetches the likes count, popularity score and pub points
/// for a given package.
///
/// It also exposes utilities to like/unlike a package, assuming the user
/// is logged-in.
///
/// Copied from [PackageMetrics].
class PackageMetricsProvider extends AutoDisposeAsyncNotifierProviderImpl<
    PackageMetrics, PackageMetricsScore> {
  /// A provider that fetches the likes count, popularity score and pub points
  /// for a given package.
  ///
  /// It also exposes utilities to like/unlike a package, assuming the user
  /// is logged-in.
  ///
  /// Copied from [PackageMetrics].
  PackageMetricsProvider({
    required this.packageName,
  }) : super.internal(
          () => PackageMetrics()..packageName = packageName,
          from: packageMetricsProvider,
          name: r'packageMetricsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$packageMetricsHash,
          dependencies: PackageMetricsFamily._dependencies,
          allTransitiveDependencies:
              PackageMetricsFamily._allTransitiveDependencies,
        );

  final String packageName;

  @override
  bool operator ==(Object other) {
    return other is PackageMetricsProvider && other.packageName == packageName;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, packageName.hashCode);

    return _SystemHash.finish(hash);
  }

  @override
  Future<PackageMetricsScore> runNotifierBuild(
    covariant PackageMetrics notifier,
  ) {
    return notifier.build(
      packageName: packageName,
    );
  }
}
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
