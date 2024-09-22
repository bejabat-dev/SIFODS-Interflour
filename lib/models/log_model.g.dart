// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'log_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LogModelImpl _$$LogModelImplFromJson(Map<String, dynamic> json) =>
    _$LogModelImpl(
      id_user: (json['id_user'] as num).toInt(),
      type: json['type'] as String,
      type_id: (json['type_id'] as num).toInt(),
      value: json['value'] as String,
      tanggal: json['tanggal'] as String,
    );

Map<String, dynamic> _$$LogModelImplToJson(_$LogModelImpl instance) =>
    <String, dynamic>{
      'id_user': instance.id_user,
      'type': instance.type,
      'type_id': instance.type_id,
      'value': instance.value,
      'tanggal': instance.tanggal,
    };
