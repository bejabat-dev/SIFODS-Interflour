import 'package:freezed_annotation/freezed_annotation.dart';

part 'add_truck.freezed.dart';
part 'add_truck.g.dart';

@freezed
class AddTruck with _$AddTruck {
  const factory AddTruck({
    required int? id,
    required int id_user,
    required String nopol,
    required String nama,
    required String ekspedisi,
    required String supir,
    required String jenis,
    required String telp,
    required String volume,
    required int jumlah,
    required String status,
    required DateTime? created,
  }) = _AddTruck;

  factory AddTruck.fromJson(Map<String, dynamic> json) =>
      _$AddTruckFromJson(json);
}
