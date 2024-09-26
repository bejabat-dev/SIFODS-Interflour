// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model_vehicle.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ModelVehicleImpl _$$ModelVehicleImplFromJson(Map<String, dynamic> json) =>
    _$ModelVehicleImpl(
      id: (json['id'] as num?)?.toInt(),
      id_user: (json['id_user'] as num).toInt(),
      nopol: json['nopol'] as String?,
      box0: json['box0'] as bool?,
      box1: json['box1'] as bool?,
      box2: json['box2'] as bool?,
      box3: json['box3'] as bool?,
      box4: json['box4'] as bool?,
      box5: json['box5'] as bool?,
      box6: json['box6'] as bool?,
      box7: json['box7'] as bool?,
      box8: json['box8'] as bool?,
      status: json['status'] as String?,
    );

Map<String, dynamic> _$$ModelVehicleImplToJson(_$ModelVehicleImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'id_user': instance.id_user,
      'nopol': instance.nopol,
      'box0': instance.box0,
      'box1': instance.box1,
      'box2': instance.box2,
      'box3': instance.box3,
      'box4': instance.box4,
      'box5': instance.box5,
      'box6': instance.box6,
      'box7': instance.box7,
      'box8': instance.box8,
      'status': instance.status,
    };
