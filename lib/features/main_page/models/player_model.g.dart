// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'player_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PlayerModel _$PlayerModelFromJson(Map<String, dynamic> json) => PlayerModel(
      number: json['number'] as String,
      name: json['name'] as String,
      falls: json['falls'] as int,
      score: json['score'] as int,
    );

Map<String, dynamic> _$PlayerModelToJson(PlayerModel instance) =>
    <String, dynamic>{
      'number': instance.number,
      'name': instance.name,
      'falls': instance.falls,
      'score': instance.score,
    };
