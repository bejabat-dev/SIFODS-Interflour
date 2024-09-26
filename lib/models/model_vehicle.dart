import 'package:freezed_annotation/freezed_annotation.dart';

part 'model_vehicle.g.dart';
part 'model_vehicle.freezed.dart';

@freezed
class ModelVehicle with _$ModelVehicle {
  const factory ModelVehicle({
    required int id_user,
    required String? nopol,
    required bool? box0,
    required bool? box1,
    required bool? box2,
    required bool? box3,
    required bool? box4,
    required bool? box5,
    required bool? box6,
    required bool? box7,
    required bool? box8,
    required String? status,
  }) = _ModelVehicle;

  factory ModelVehicle.fromJson(Map<String, dynamic> json) =>
      _$ModelVehicleFromJson(json);
}
