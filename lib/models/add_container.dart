

import 'package:freezed_annotation/freezed_annotation.dart';

part 'add_container.g.dart';
part 'add_container.freezed.dart';

@freezed
class AddContainer with _$AddContainer {
  const factory AddContainer({
  required int id_user,
  required String nomor,
  required String nama,
  required String seal,
  }) = _AddContainer;

  factory AddContainer.fromJson(Map<String, dynamic> json) =>
      _$AddContainerFromJson(json);
}
