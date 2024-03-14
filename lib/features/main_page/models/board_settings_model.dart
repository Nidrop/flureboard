import 'package:json_annotation/json_annotation.dart';

part 'board_settings_model.g.dart';

@JsonSerializable()
class BoardSettingsModel {
  bool playersEnabled;

  BoardSettingsModel({
    required this.playersEnabled,
  });

  factory BoardSettingsModel.fromJson(Map<String, dynamic> json) =>
      _$BoardSettingsModelFromJson(json);

  Map<String, dynamic> toJson() => _$BoardSettingsModelToJson(this);
}
