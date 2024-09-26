// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserImpl _$$UserImplFromJson(Map<String, dynamic> json) => _$UserImpl(
      id: (json['id'] as num?)?.toInt(),
      nama: json['nama'] as String?,
      email: json['email'] as String,
      jabatan: json['jabatan'] as String?,
      password: json['password'] as String?,
      nomor_hp: json['nomor_hp'] as String?,
      photo: json['photo'] as String?,
    );

Map<String, dynamic> _$$UserImplToJson(_$UserImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nama': instance.nama,
      'email': instance.email,
      'jabatan': instance.jabatan,
      'password': instance.password,
      'nomor_hp': instance.nomor_hp,
      'photo': instance.photo,
    };
