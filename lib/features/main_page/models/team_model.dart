import 'package:flureboard/features/main_page/models/player_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'team_model.g.dart';

@JsonSerializable(explicitToJson: true)
class TeamModel {
  final String name;
  final String country;
  final int score;
  final int timeouts;
  final int falls;
  final List<PlayerModel> players;

  TeamModel({
    required this.name,
    required this.country,
    required this.score,
    required this.timeouts,
    required this.falls,
    required this.players,
  });

  factory TeamModel.fromJson(Map<String, dynamic> json) =>
      _$TeamModelFromJson(json);

  Map<String, dynamic> toJson() => _$TeamModelToJson(this);
}
