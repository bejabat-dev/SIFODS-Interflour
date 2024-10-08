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
      box0:
          const IntToBoolConverter().fromJson((json['box0'] as num?)?.toInt()),
      box1:
          const IntToBoolConverter().fromJson((json['box1'] as num?)?.toInt()),
      box2:
          const IntToBoolConverter().fromJson((json['box2'] as num?)?.toInt()),
      box3:
          const IntToBoolConverter().fromJson((json['box3'] as num?)?.toInt()),
      box4:
          const IntToBoolConverter().fromJson((json['box4'] as num?)?.toInt()),
      box5:
          const IntToBoolConverter().fromJson((json['box5'] as num?)?.toInt()),
      box6:
          const IntToBoolConverter().fromJson((json['box6'] as num?)?.toInt()),
      box7:
          const IntToBoolConverter().fromJson((json['box7'] as num?)?.toInt()),
      box8:
          const IntToBoolConverter().fromJson((json['box8'] as num?)?.toInt()),
      status: json['status'] as String?,
    );

Map<String, dynamic> _$$ModelVehicleImplToJson(_$ModelVehicleImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'id_user': instance.id_user,
      'nopol': instance.nopol,
      'box0': const IntToBoolConverter().toJson(instance.box0),
      'box1': const IntToBoolConverter().toJson(instance.box1),
      'box2': const IntToBoolConverter().toJson(instance.box2),
      'box3': const IntToBoolConverter().toJson(instance.box3),
      'box4': const IntToBoolConverter().toJson(instance.box4),
      'box5': const IntToBoolConverter().toJson(instance.box5),
      'box6': const IntToBoolConverter().toJson(instance.box6),
      'box7': const IntToBoolConverter().toJson(instance.box7),
      'box8': const IntToBoolConverter().toJson(instance.box8),
      'status': instance.status,
    };
