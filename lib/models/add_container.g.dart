// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_container.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AddContainerImpl _$$AddContainerImplFromJson(Map<String, dynamic> json) =>
    _$AddContainerImpl(
      id_user: (json['id_user'] as num).toInt(),
      nomor: json['nomor'] as String,
      nama: json['nama'] as String,
      seal: json['seal'] as String,
    );

Map<String, dynamic> _$$AddContainerImplToJson(_$AddContainerImpl instance) =>
    <String, dynamic>{
      'id_user': instance.id_user,
      'nomor': instance.nomor,
      'nama': instance.nama,
      'seal': instance.seal,
    };
