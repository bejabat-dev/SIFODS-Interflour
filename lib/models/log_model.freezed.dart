// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'log_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

LogModel _$LogModelFromJson(Map<String, dynamic> json) {
  return _LogModel.fromJson(json);
}

/// @nodoc
mixin _$LogModel {
  int get id_user => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  int get type_id => throw _privateConstructorUsedError;
  String get value => throw _privateConstructorUsedError;
  String get tanggal => throw _privateConstructorUsedError;

  /// Serializes this LogModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of LogModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LogModelCopyWith<LogModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LogModelCopyWith<$Res> {
  factory $LogModelCopyWith(LogModel value, $Res Function(LogModel) then) =
      _$LogModelCopyWithImpl<$Res, LogModel>;
  @useResult
  $Res call(
      {int id_user, String type, int type_id, String value, String tanggal});
}

/// @nodoc
class _$LogModelCopyWithImpl<$Res, $Val extends LogModel>
    implements $LogModelCopyWith<$Res> {
  _$LogModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LogModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id_user = null,
    Object? type = null,
    Object? type_id = null,
    Object? value = null,
    Object? tanggal = null,
  }) {
    return _then(_value.copyWith(
      id_user: null == id_user
          ? _value.id_user
          : id_user // ignore: cast_nullable_to_non_nullable
              as int,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      type_id: null == type_id
          ? _value.type_id
          : type_id // ignore: cast_nullable_to_non_nullable
              as int,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
      tanggal: null == tanggal
          ? _value.tanggal
          : tanggal // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LogModelImplCopyWith<$Res>
    implements $LogModelCopyWith<$Res> {
  factory _$$LogModelImplCopyWith(
          _$LogModelImpl value, $Res Function(_$LogModelImpl) then) =
      __$$LogModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id_user, String type, int type_id, String value, String tanggal});
}

/// @nodoc
class __$$LogModelImplCopyWithImpl<$Res>
    extends _$LogModelCopyWithImpl<$Res, _$LogModelImpl>
    implements _$$LogModelImplCopyWith<$Res> {
  __$$LogModelImplCopyWithImpl(
      _$LogModelImpl _value, $Res Function(_$LogModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of LogModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id_user = null,
    Object? type = null,
    Object? type_id = null,
    Object? value = null,
    Object? tanggal = null,
  }) {
    return _then(_$LogModelImpl(
      id_user: null == id_user
          ? _value.id_user
          : id_user // ignore: cast_nullable_to_non_nullable
              as int,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      type_id: null == type_id
          ? _value.type_id
          : type_id // ignore: cast_nullable_to_non_nullable
              as int,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
      tanggal: null == tanggal
          ? _value.tanggal
          : tanggal // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LogModelImpl implements _LogModel {
  const _$LogModelImpl(
      {required this.id_user,
      required this.type,
      required this.type_id,
      required this.value,
      required this.tanggal});

  factory _$LogModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$LogModelImplFromJson(json);

  @override
  final int id_user;
  @override
  final String type;
  @override
  final int type_id;
  @override
  final String value;
  @override
  final String tanggal;

  @override
  String toString() {
    return 'LogModel(id_user: $id_user, type: $type, type_id: $type_id, value: $value, tanggal: $tanggal)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LogModelImpl &&
            (identical(other.id_user, id_user) || other.id_user == id_user) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.type_id, type_id) || other.type_id == type_id) &&
            (identical(other.value, value) || other.value == value) &&
            (identical(other.tanggal, tanggal) || other.tanggal == tanggal));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id_user, type, type_id, value, tanggal);

  /// Create a copy of LogModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LogModelImplCopyWith<_$LogModelImpl> get copyWith =>
      __$$LogModelImplCopyWithImpl<_$LogModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LogModelImplToJson(
      this,
    );
  }
}

abstract class _LogModel implements LogModel {
  const factory _LogModel(
      {required final int id_user,
      required final String type,
      required final int type_id,
      required final String value,
      required final String tanggal}) = _$LogModelImpl;

  factory _LogModel.fromJson(Map<String, dynamic> json) =
      _$LogModelImpl.fromJson;

  @override
  int get id_user;
  @override
  String get type;
  @override
  int get type_id;
  @override
  String get value;
  @override
  String get tanggal;

  /// Create a copy of LogModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LogModelImplCopyWith<_$LogModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
