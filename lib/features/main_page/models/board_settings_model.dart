import 'package:json_annotation/json_annotation.dart';

part 'board_settings_model.g.dart';

@JsonSerializable()
class BoardSettingsModel {
  final bool playersEnabled;
  final bool playerFallsEnabled;
  final bool teamFallsEnabled;
  final bool teamTimeoutsEnabled;

  BoardSettingsModel({
    required this.playerFallsEnabled,
    required this.teamFallsEnabled,
    required this.teamTimeoutsEnabled,
    required this.playersEnabled,
  });

  factory BoardSettingsModel.fromJson(Map<String, dynamic> json) =>
      _$BoardSettingsModelFromJson(json);

  Map<String, dynamic> toJson() => _$BoardSettingsModelToJson(this);
}
