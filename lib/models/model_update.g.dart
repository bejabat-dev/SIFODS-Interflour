// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model_update.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ModelUpdateImpl _$$ModelUpdateImplFromJson(Map<String, dynamic> json) =>
    _$ModelUpdateImpl(
      id_user: (json['id_user'] as num).toInt(),
      id_vehicle: (json['id_vehicle'] as num).toInt(),
      nomor: json['nomor'] as String?,
      box0: json['box0'] as bool?,
      box1: json['box1'] as bool?,
      box2: json['box2'] as bool?,
      box3: json['box3'] as bool?,
      box4: json['box4'] as String?,
      box5: json['box5'] as String?,
      box6: json['box6'] as String?,
      box7: json['box7'] as String?,
    );

Map<String, dynamic> _$$ModelUpdateImplToJson(_$ModelUpdateImpl instance) =>
    <String, dynamic>{
      'id_user': instance.id_user,
      'id_vehicle': instance.id_vehicle,
      'nomor': instance.nomor,
      'box0': instance.box0,
      'box1': instance.box1,
      'box2': instance.box2,
      'box3': instance.box3,
      'box4': instance.box4,
      'box5': instance.box5,
      'box6': instance.box6,
      'box7': instance.box7,
    };
