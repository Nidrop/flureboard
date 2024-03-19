// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'team_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TeamModel _$TeamModelFromJson(Map<String, dynamic> json) => TeamModel(
      name: json['name'] as String,
      country: json['country'] as String,
      score: json['score'] as int,
      timeouts: json['timeouts'] as int,
      falls: json['falls'] as int,
      players: (json['players'] as List<dynamic>)
          .map((e) => PlayerModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$TeamModelToJson(TeamModel instance) => <String, dynamic>{
      'name': instance.name,
      'country': instance.country,
      'score': instance.score,
      'timeouts': instance.timeouts,
      'falls': instance.falls,
      'players': instance.players.map((e) => e.toJson()).toList(),
    };
