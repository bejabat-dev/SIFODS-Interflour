import 'package:freezed_annotation/freezed_annotation.dart';

part 'model_update.g.dart';
part 'model_update.freezed.dart';

@freezed
class ModelUpdate with _$ModelUpdate {
  const factory ModelUpdate({
    required int id_user,
    required int id_vehicle,
    required String? nomor,
    required bool? box0,
    required bool? box1,
    required bool? box2,
    required bool? box3,
    required String? box4,
    required String? box5,
    required String? box6,
    required String? box7,
    
  }) = _ModelUpdate;

  factory ModelUpdate.fromJson(Map<String, dynamic> json) =>
      _$ModelUpdateFromJson(json);
}
