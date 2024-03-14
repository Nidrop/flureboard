import 'package:flureboard/features/main_page/models/player_model.dart';
import 'package:flureboard/features/main_page/models/team_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'left_team.g.dart';

@riverpod
class LeftTeam extends _$LeftTeam {
  @override
  TeamModel build() {
    var res = TeamModel(
      name: "",
      country: "",
      score: 0,
      timeouts: 0,
      falls: 0,
      playerCount: 10,
    );
    res.players = List.generate(
      res.playerCount,
      (index) => PlayerModel(
        number: "",
        name: "",
        falls: 0,
        score: 0,
      ),
    );

    return res;
  }
}
