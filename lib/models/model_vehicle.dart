import 'package:freezed_annotation/freezed_annotation.dart';

part 'model_vehicle.g.dart';
part 'model_vehicle.freezed.dart';

class IntToBoolConverter implements JsonConverter<bool?, int?> {
  const IntToBoolConverter();

  @override
  bool? fromJson(int? json) {
    return json == null ? null : json == 1;
  }

  @override
  int? toJson(bool? object) {
    return object == null ? null : (object ? 1 : 0);
  }
}

@freezed
class ModelVehicle with _$ModelVehicle {
  const factory ModelVehicle({
    required int? id,
    required int id_user,
    required String? nopol,
    @IntToBoolConverter() required bool? box0,
    @IntToBoolConverter() required bool? box1,
    @IntToBoolConverter() required bool? box2,
    @IntToBoolConverter() required bool? box3,
    @IntToBoolConverter() required bool? box4,
    @IntToBoolConverter() required bool? box5,
    @IntToBoolConverter() required bool? box6,
    @IntToBoolConverter() required bool? box7,
    @IntToBoolConverter() required bool? box8,
    required String? status,
  }) = _ModelVehicle;

  factory ModelVehicle.fromJson(Map<String, dynamic> json) =>
      _$ModelVehicleFromJson(json);
}
