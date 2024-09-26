// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_truck.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AddTruckImpl _$$AddTruckImplFromJson(Map<String, dynamic> json) =>
    _$AddTruckImpl(
      id: (json['id'] as num?)?.toInt(),
      id_user: (json['id_user'] as num).toInt(),
      nopol: json['nopol'] as String?,
      nama: json['nama'] as String?,
      ekspedisi: json['ekspedisi'] as String?,
      supir: json['supir'] as String?,
      jenis: json['jenis'] as String?,
      telp: json['telp'] as String?,
      volume: json['volume'] as String?,
      jumlah: (json['jumlah'] as num?)?.toInt(),
      status: json['status'] as String?,
      created: json['created'] == null
          ? null
          : DateTime.parse(json['created'] as String),
    );

Map<String, dynamic> _$$AddTruckImplToJson(_$AddTruckImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'id_user': instance.id_user,
      'nopol': instance.nopol,
      'nama': instance.nama,
      'ekspedisi': instance.ekspedisi,
      'supir': instance.supir,
      'jenis': instance.jenis,
      'telp': instance.telp,
      'volume': instance.volume,
      'jumlah': instance.jumlah,
      'status': instance.status,
      'created': instance.created?.toIso8601String(),
    };
