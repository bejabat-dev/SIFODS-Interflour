// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vehiclespod.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getSearchHash() => r'e1ac9c0cb41e35d2e45563085b974c551d790670';

/// See also [getSearch].
@ProviderFor(getSearch)
final getSearchProvider = AutoDisposeFutureProvider<List<LogModel>>.internal(
  getSearch,
  name: r'getSearchProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$getSearchHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef GetSearchRef = AutoDisposeFutureProviderRef<List<LogModel>>;
String _$getLogsHash() => r'ad80eb571e8ed3dc8b2b737fafdbd24f87515731';

/// See also [getLogs].
@ProviderFor(getLogs)
final getLogsProvider = AutoDisposeFutureProvider<List<LogModel>>.internal(
  getLogs,
  name: r'getLogsProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$getLogsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef GetLogsRef = AutoDisposeFutureProviderRef<List<LogModel>>;
String _$getTruckHash() => r'260dce5a604d6132a3495bb624cc2afb3821f8f3';

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

/// See also [getTruck].
@ProviderFor(getTruck)
const getTruckProvider = GetTruckFamily();

/// See also [getTruck].
class GetTruckFamily extends Family<AsyncValue<AddTruck>> {
  /// See also [getTruck].
  const GetTruckFamily();

  /// See also [getTruck].
  GetTruckProvider call(
    int id,
  ) {
    return GetTruckProvider(
      id,
    );
  }

  @override
  GetTruckProvider getProviderOverride(
    covariant GetTruckProvider provider,
  ) {
    return call(
      provider.id,
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
  String? get name => r'getTruckProvider';
}

/// See also [getTruck].
class GetTruckProvider extends AutoDisposeFutureProvider<AddTruck> {
  /// See also [getTruck].
  GetTruckProvider(
    int id,
  ) : this._internal(
          (ref) => getTruck(
            ref as GetTruckRef,
            id,
          ),
          from: getTruckProvider,
          name: r'getTruckProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getTruckHash,
          dependencies: GetTruckFamily._dependencies,
          allTransitiveDependencies: GetTruckFamily._allTransitiveDependencies,
          id: id,
        );

  GetTruckProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
  }) : super.internal();

  final int id;

  @override
  Override overrideWith(
    FutureOr<AddTruck> Function(GetTruckRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetTruckProvider._internal(
        (ref) => create(ref as GetTruckRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        id: id,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<AddTruck> createElement() {
    return _GetTruckProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetTruckProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin GetTruckRef on AutoDisposeFutureProviderRef<AddTruck> {
  /// The parameter `id` of this provider.
  int get id;
}

class _GetTruckProviderElement
    extends AutoDisposeFutureProviderElement<AddTruck> with GetTruckRef {
  _GetTruckProviderElement(super.provider);

  @override
  int get id => (origin as GetTruckProvider).id;
}

String _$getContainerHash() => r'b17dc6fa9676d1cb695de0e620d3476a64ca9ab3';

/// See also [getContainer].
@ProviderFor(getContainer)
const getContainerProvider = GetContainerFamily();

/// See also [getContainer].
class GetContainerFamily extends Family<AsyncValue<AddContainer>> {
  /// See also [getContainer].
  const GetContainerFamily();

  /// See also [getContainer].
  GetContainerProvider call(
    int id,
  ) {
    return GetContainerProvider(
      id,
    );
  }

  @override
  GetContainerProvider getProviderOverride(
    covariant GetContainerProvider provider,
  ) {
    return call(
      provider.id,
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
  String? get name => r'getContainerProvider';
}

/// See also [getContainer].
class GetContainerProvider extends AutoDisposeFutureProvider<AddContainer> {
  /// See also [getContainer].
  GetContainerProvider(
    int id,
  ) : this._internal(
          (ref) => getContainer(
            ref as GetContainerRef,
            id,
          ),
          from: getContainerProvider,
          name: r'getContainerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getContainerHash,
          dependencies: GetContainerFamily._dependencies,
          allTransitiveDependencies:
              GetContainerFamily._allTransitiveDependencies,
          id: id,
        );

  GetContainerProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
  }) : super.internal();

  final int id;

  @override
  Override overrideWith(
    FutureOr<AddContainer> Function(GetContainerRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetContainerProvider._internal(
        (ref) => create(ref as GetContainerRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        id: id,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<AddContainer> createElement() {
    return _GetContainerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetContainerProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin GetContainerRef on AutoDisposeFutureProviderRef<AddContainer> {
  /// The parameter `id` of this provider.
  int get id;
}

class _GetContainerProviderElement
    extends AutoDisposeFutureProviderElement<AddContainer>
    with GetContainerRef {
  _GetContainerProviderElement(super.provider);

  @override
  int get id => (origin as GetContainerProvider).id;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
