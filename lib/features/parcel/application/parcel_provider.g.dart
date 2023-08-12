// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'parcel_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$fetchAllParcelHash() => r'51e02f2bb213ff4ee8b07303cbb7d81b7ba74235';

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

typedef FetchAllParcelRef
    = AutoDisposeFutureProviderRef<FetchAllParcelResponse>;

/// See also [fetchAllParcel].
@ProviderFor(fetchAllParcel)
const fetchAllParcelProvider = FetchAllParcelFamily();

/// See also [fetchAllParcel].
class FetchAllParcelFamily extends Family<AsyncValue<FetchAllParcelResponse>> {
  /// See also [fetchAllParcel].
  const FetchAllParcelFamily();

  /// See also [fetchAllParcel].
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

/// See also [fetchAllParcel].
class FetchAllParcelProvider
    extends AutoDisposeFutureProvider<FetchAllParcelResponse> {
  /// See also [fetchAllParcel].
  FetchAllParcelProvider({
    this.type = ParcelListType.all,
    this.page = 1,
    this.limit = 10,
  }) : super.internal(
          (ref) => fetchAllParcel(
            ref,
            type: type,
            page: page,
            limit: limit,
          ),
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
}

String _$fetchCategorizedParcelHash() =>
    r'26c44c5df0c59f89181bb9356ff8c40407605d0b';
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
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
