import 'package:flureboard/features/main_page/models/player_model.dart';
import 'package:flureboard/features/main_page/models/team_model.dart';
import 'package:flureboard/features/main_page/providers/board_settings.dart';
import 'package:flureboard/features/main_page/providers/window_send.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'teams.g.dart';

@riverpod
class Teams extends _$Teams {
  @override
  List<TeamModel> build() {
    const int teamCount = 2;
    const int playerCount = 10;

    return List.generate(
      teamCount,
      (index) => TeamModel(
        name: "",
        country: "",
        score: 0,
        timeouts: 0,
        falls: 0,
        players: List.generate(
          playerCount,
          (index) => PlayerModel(
            number: "  ",
            name: "",
            falls: 0,
            score: 0,
          ),
        ),
      ),
      growable: false,
    );
  }

  void setTeam({
    required int teamIndex,
    String? name,
    String? country,
    int? score,
    int? timeouts,
    int? falls,
  }) {
    var team = state[teamIndex];
    state = List.generate(
      state.length,
      (i) {
        if (i == teamIndex) {
          return TeamModel(
            name: name ?? team.name,
            country: country ?? team.country,
            score: score ?? team.score,
            timeouts: timeouts ?? team.timeouts,
            falls: falls ?? team.falls,
            players: team.players,
          );
        }
        return state[i];
      },
      growable: false,
    );

    //TODO find alternative way
    ref.read(
      windowSendTeamProvider(
        teamIndex: teamIndex,
        teamName: name,
        country: country,
        score: score,
        timeouts: timeouts,
        falls: falls,
      ),
    );
  }

  void incTeamScore({
    required int teamIndex,
    required int number,
  }) {
    setTeam(
      teamIndex: teamIndex,
      score: state[teamIndex].score + number,
    );
  }

  void incTeamTimeouts({
    required int teamIndex,
    required int number,
  }) {
    setTeam(
      teamIndex: teamIndex,
      timeouts: state[teamIndex].timeouts + number,
    );
  }

  void incTeamFalls({
    required int teamIndex,
    required int number,
  }) {
    setTeam(
      teamIndex: teamIndex,
      falls: state[teamIndex].falls + number,
    );
  }

  void setPlayer({
    required int teamIndex,
    required int playerIndex,
    String? number,
    String? name,
    int? falls,
    int? score,
  }) {
    var oldPlayer = state[teamIndex].players[playerIndex];
    var newPlayer = PlayerModel(
      number: number ?? oldPlayer.number,
      name: name ?? oldPlayer.name,
      falls: falls ?? oldPlayer.falls,
      score: score ?? oldPlayer.score,
    );
    // state[teamIndex].players[playerIndex] = newPlayer;
    var team = state[teamIndex];
    var players = List.generate(state[teamIndex].players.length, (i) {
      if (i == playerIndex) {
        return newPlayer;
      }
      return team.players[i];
    });

    state = List.generate(
      state.length,
      (i) {
        if (i == teamIndex) {
          return TeamModel(
            name: state[i].name,
            country: state[i].country,
            score: state[i].score,
            timeouts: state[i].timeouts,
            falls: state[i].falls,
            players: players,
          );
        }
        return state[i];
      },
      growable: false,
    );
  }

  void incPlayerScore({
    required int teamIndex,
    required int playerIndex,
    required int number,
  }) {
    setPlayer(
      teamIndex: teamIndex,
      playerIndex: playerIndex,
      score: state[teamIndex].players[playerIndex].score + number,
    );
  }

  void incPlayerFalls({
    required int teamIndex,
    required int playerIndex,
    required int number,
  }) {
    setPlayer(
      teamIndex: teamIndex,
      playerIndex: playerIndex,
      falls: state[teamIndex].players[playerIndex].falls + number,
    );
  }

  // //TODO do one state update
  // void calculateTeamScore() {
  //   for (final team in state) {
  //     int sum = 0;
  //     for (final player in team.players) {
  //       sum += player.score;
  //     }
  //   }
  // }
}

@riverpod
int teamScore(TeamScoreRef ref, int teamIndex) {
  final hasPlayers = ref.watch(boardSettingsProvider).playersEnabled;
  final team = ref.watch(teamsProvider)[teamIndex];
  if (hasPlayers) {
    int sum = 0;
    for (final player in team.players) {
      sum += player.score;
    }
    return sum;
  } else {
    return team.score;
  }
}
