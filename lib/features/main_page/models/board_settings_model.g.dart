// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'board_settings_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BoardSettingsModel _$BoardSettingsModelFromJson(Map<String, dynamic> json) =>
    BoardSettingsModel(
      playerFallsEnabled: json['playerFallsEnabled'] as bool,
      teamFallsEnabled: json['teamFallsEnabled'] as bool,
      teamTimeoutsEnabled: json['teamTimeoutsEnabled'] as bool,
      playersEnabled: json['playersEnabled'] as bool,
    );

Map<String, dynamic> _$BoardSettingsModelToJson(BoardSettingsModel instance) =>
    <String, dynamic>{
      'playersEnabled': instance.playersEnabled,
      'playerFallsEnabled': instance.playerFallsEnabled,
      'teamFallsEnabled': instance.teamFallsEnabled,
      'teamTimeoutsEnabled': instance.teamTimeoutsEnabled,
    };
