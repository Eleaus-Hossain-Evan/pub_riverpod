// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'parcel_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$parcelRepoHash() => r'9f6095deb24514dce749f068f8df0353750059e0';

/// See also [parcelRepo].
@ProviderFor(parcelRepo)
final parcelRepoProvider = AutoDisposeProvider<ParcelRepo>.internal(
  parcelRepo,
  name: r'parcelRepoProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$parcelRepoHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef ParcelRepoRef = AutoDisposeProviderRef<ParcelRepo>;
String _$fetchCategorizedParcelHash() =>
    r'26c44c5df0c59f89181bb9356ff8c40407605d0b';

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

typedef FetchCategorizedParcelRef
    = AutoDisposeFutureProviderRef<List<ParcelModel>>;

/// See also [fetchCategorizedParcel].
@ProviderFor(fetchCategorizedParcel)
const fetchCategorizedParcelProvider = FetchCategorizedParcelFamily();

/// See also [fetchCategorizedParcel].
class FetchCategorizedParcelFamily
    extends Family<AsyncValue<List<ParcelModel>>> {
  /// See also [fetchCategorizedParcel].
  const FetchCategorizedParcelFamily();

  /// See also [fetchCategorizedParcel].
  FetchCategorizedParcelProvider call({
    ParcelListType type = ParcelListType.all,
    int page = 1,
    int limit = 10,
  }) {
    return FetchCategorizedParcelProvider(
      type: type,
      page: page,
      limit: limit,
    );
  }

  @override
  FetchCategorizedParcelProvider getProviderOverride(
    covariant FetchCategorizedParcelProvider provider,
  ) {
    return call(
      type: provider.type,
      page: provider.page,
      limit: provider.limit,
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
  String? get name => r'fetchCategorizedParcelProvider';
}

/// See also [fetchCategorizedParcel].
class FetchCategorizedParcelProvider
    extends AutoDisposeFutureProvider<List<ParcelModel>> {
  /// See also [fetchCategorizedParcel].
  FetchCategorizedParcelProvider({
    this.type = ParcelListType.all,
    this.page = 1,
    this.limit = 10,
  }) : super.internal(
          (ref) => fetchCategorizedParcel(
            ref,
            type: type,
            page: page,
            limit: limit,
          ),
          from: fetchCategorizedParcelProvider,
          name: r'fetchCategorizedParcelProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$fetchCategorizedParcelHash,
          dependencies: FetchCategorizedParcelFamily._dependencies,
          allTransitiveDependencies:
              FetchCategorizedParcelFamily._allTransitiveDependencies,
        );

  final ParcelListType type;
  final int page;
  final int limit;

  @override
  bool operator ==(Object other) {
    return other is FetchCategorizedParcelProvider &&
        other.type == type &&
        other.page == page &&
        other.limit == limit;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, type.hashCode);
    hash = _SystemHash.combine(hash, page.hashCode);
    hash = _SystemHash.combine(hash, limit.hashCode);

    return _SystemHash.finish(hash);
  }
}

String _$fetchAllParcelHash() => r'58d9a67cbde240d7efe7cf6ecca66c461102032f';

abstract class _$FetchAllParcel
    extends BuildlessAutoDisposeAsyncNotifier<FetchAllParcelResponse> {
  late final ParcelListType type;
  late final int page;
  late final int limit;

  Future<FetchAllParcelResponse> build({
    ParcelListType type = ParcelListType.all,
    int page = 1,
    int limit = 10,
  });
}

/// See also [FetchAllParcel].
@ProviderFor(FetchAllParcel)
const fetchAllParcelProvider = FetchAllParcelFamily();

/// See also [FetchAllParcel].
class FetchAllParcelFamily extends Family<AsyncValue<FetchAllParcelResponse>> {
  /// See also [FetchAllParcel].
  const FetchAllParcelFamily();

  /// See also [FetchAllParcel].
  FetchAllParcelProvider call({
    ParcelListType type = ParcelListType.all,
    int page = 1,
    int limit = 10,
  }) {
    return FetchAllParcelProvider(
      type: type,
      page: page,
      limit: limit,
    );
  }

  @override
  FetchAllParcelProvider getProviderOverride(
    covariant FetchAllParcelProvider provider,
  ) {
    return call(
      type: provider.type,
      page: provider.page,
      limit: provider.limit,
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
  String? get name => r'fetchAllParcelProvider';
}

/// See also [FetchAllParcel].
class FetchAllParcelProvider extends AutoDisposeAsyncNotifierProviderImpl<
    FetchAllParcel, FetchAllParcelResponse> {
  /// See also [FetchAllParcel].
  FetchAllParcelProvider({
    this.type = ParcelListType.all,
    this.page = 1,
    this.limit = 10,
  }) : super.internal(
          () => FetchAllParcel()
            ..type = type
            ..page = page
            ..limit = limit,
          from: fetchAllParcelProvider,
          name: r'fetchAllParcelProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$fetchAllParcelHash,
          dependencies: FetchAllParcelFamily._dependencies,
          allTransitiveDependencies:
              FetchAllParcelFamily._allTransitiveDependencies,
        );

  final ParcelListType type;
  final int page;
  final int limit;

  @override
  bool operator ==(Object other) {
    return other is FetchAllParcelProvider &&
        other.type == type &&
        other.page == page &&
        other.limit == limit;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, type.hashCode);
    hash = _SystemHash.combine(hash, page.hashCode);
    hash = _SystemHash.combine(hash, limit.hashCode);

    return _SystemHash.finish(hash);
  }

  @override
  Future<FetchAllParcelResponse> runNotifierBuild(
    covariant FetchAllParcel notifier,
  ) {
    return notifier.build(
      type: type,
      page: page,
      limit: limit,
    );
  }
}
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
