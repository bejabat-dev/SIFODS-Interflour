
import 'package:freezed_annotation/freezed_annotation.dart';

part 'model_container.g.dart';
part 'model_container.freezed.dart';

@freezed
class ModelContainer with _$ModelContainer {
  const factory ModelContainer({
    required int id_user,
    required String nomor,
    required bool box0,
    required bool box1,
    required bool box2,
    required bool box3,
    required bool box4,
    required bool box5,
    required bool box6,
    required bool box7,
    required bool box8,
    required bool eks0,
    required bool eks1,
    required bool eks2,
    required bool eks3,
    required bool eks4,
    required bool eks5,
    required bool eks6,
    required String catatan,
    required String? status,
  }) = _ModelContainer;

  factory ModelContainer.fromJson(Map<String, dynamic> json) =>
      _$ModelContainerFromJson(json);
}
