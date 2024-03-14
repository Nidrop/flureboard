import 'package:json_annotation/json_annotation.dart';

part 'player_model.g.dart';

@JsonSerializable()
class PlayerModel {
  String number;
  String name;
  int falls;
  int score;

  PlayerModel({
    required this.number,
    required this.name,
    required this.falls,
    required this.score,
  });

  factory PlayerModel.fromJson(Map<String, dynamic> json) =>
      _$PlayerModelFromJson(json);

  Map<String, dynamic> toJson() => _$PlayerModelToJson(this);
}
