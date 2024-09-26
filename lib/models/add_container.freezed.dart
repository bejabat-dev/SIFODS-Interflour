// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'add_container.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AddContainer _$AddContainerFromJson(Map<String, dynamic> json) {
  return _AddContainer.fromJson(json);
}

/// @nodoc
mixin _$AddContainer {
  int get id_user => throw _privateConstructorUsedError;
  String get nomor => throw _privateConstructorUsedError;
  String get nama => throw _privateConstructorUsedError;
  String get seal => throw _privateConstructorUsedError;

  /// Serializes this AddContainer to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AddContainer
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AddContainerCopyWith<AddContainer> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddContainerCopyWith<$Res> {
  factory $AddContainerCopyWith(
          AddContainer value, $Res Function(AddContainer) then) =
      _$AddContainerCopyWithImpl<$Res, AddContainer>;
  @useResult
  $Res call({int id_user, String nomor, String nama, String seal});
}

/// @nodoc
class _$AddContainerCopyWithImpl<$Res, $Val extends AddContainer>
    implements $AddContainerCopyWith<$Res> {
  _$AddContainerCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AddContainer
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id_user = null,
    Object? nomor = null,
    Object? nama = null,
    Object? seal = null,
  }) {
    return _then(_value.copyWith(
      id_user: null == id_user
          ? _value.id_user
          : id_user // ignore: cast_nullable_to_non_nullable
              as int,
      nomor: null == nomor
          ? _value.nomor
          : nomor // ignore: cast_nullable_to_non_nullable
              as String,
      nama: null == nama
          ? _value.nama
          : nama // ignore: cast_nullable_to_non_nullable
              as String,
      seal: null == seal
          ? _value.seal
          : seal // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AddContainerImplCopyWith<$Res>
    implements $AddContainerCopyWith<$Res> {
  factory _$$AddContainerImplCopyWith(
          _$AddContainerImpl value, $Res Function(_$AddContainerImpl) then) =
      __$$AddContainerImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id_user, String nomor, String nama, String seal});
}

/// @nodoc
class __$$AddContainerImplCopyWithImpl<$Res>
    extends _$AddContainerCopyWithImpl<$Res, _$AddContainerImpl>
    implements _$$AddContainerImplCopyWith<$Res> {
  __$$AddContainerImplCopyWithImpl(
      _$AddContainerImpl _value, $Res Function(_$AddContainerImpl) _then)
      : super(_value, _then);

  /// Create a copy of AddContainer
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id_user = null,
    Object? nomor = null,
    Object? nama = null,
    Object? seal = null,
  }) {
    return _then(_$AddContainerImpl(
      id_user: null == id_user
          ? _value.id_user
          : id_user // ignore: cast_nullable_to_non_nullable
              as int,
      nomor: null == nomor
          ? _value.nomor
          : nomor // ignore: cast_nullable_to_non_nullable
              as String,
      nama: null == nama
          ? _value.nama
          : nama // ignore: cast_nullable_to_non_nullable
              as String,
      seal: null == seal
          ? _value.seal
          : seal // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AddContainerImpl implements _AddContainer {
  const _$AddContainerImpl(
      {required this.id_user,
      required this.nomor,
      required this.nama,
      required this.seal});

  factory _$AddContainerImpl.fromJson(Map<String, dynamic> json) =>
      _$$AddContainerImplFromJson(json);

  @override
  final int id_user;
  @override
  final String nomor;
  @override
  final String nama;
  @override
  final String seal;

  @override
  String toString() {
    return 'AddContainer(id_user: $id_user, nomor: $nomor, nama: $nama, seal: $seal)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddContainerImpl &&
            (identical(other.id_user, id_user) || other.id_user == id_user) &&
            (identical(other.nomor, nomor) || other.nomor == nomor) &&
            (identical(other.nama, nama) || other.nama == nama) &&
            (identical(other.seal, seal) || other.seal == seal));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id_user, nomor, nama, seal);

  /// Create a copy of AddContainer
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AddContainerImplCopyWith<_$AddContainerImpl> get copyWith =>
      __$$AddContainerImplCopyWithImpl<_$AddContainerImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AddContainerImplToJson(
      this,
    );
  }
}

abstract class _AddContainer implements AddContainer {
  const factory _AddContainer(
      {required final int id_user,
      required final String nomor,
      required final String nama,
      required final String seal}) = _$AddContainerImpl;

  factory _AddContainer.fromJson(Map<String, dynamic> json) =
      _$AddContainerImpl.fromJson;

  @override
  int get id_user;
  @override
  String get nomor;
  @override
  String get nama;
  @override
  String get seal;

  /// Create a copy of AddContainer
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AddContainerImplCopyWith<_$AddContainerImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
