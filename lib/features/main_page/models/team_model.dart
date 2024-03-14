import 'package:flureboard/features/main_page/models/player_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'team_model.g.dart';

@JsonSerializable(explicitToJson: true)
class TeamModel {
  String name;
  String country;
  int score;
  int timeouts;
  int falls;
  int playerCount;
  List<PlayerModel> players = [];

  TeamModel({
    required this.name,
    required this.country,
    required this.score,
    required this.timeouts,
    required this.falls,
    required this.playerCount,
  }) {
    // players = List.generate(playerCount, (index) => );
  }

  factory TeamModel.fromJson(Map<String, dynamic> json) =>
      _$TeamModelFromJson(json);

  Map<String, dynamic> toJson() => _$TeamModelToJson(this);
}
