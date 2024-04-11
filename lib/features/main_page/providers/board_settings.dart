import 'package:flureboard/features/main_page/models/board_settings_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'board_settings.g.dart';

@riverpod
class BoardSettings extends _$BoardSettings {
  @override
  BoardSettingsModel build() {
    return BoardSettingsModel(
      playersEnabled: true,
      teamFallsEnabled: true,
      teamTimeoutsEnabled: true,
      playerFallsEnabled: true,
    );
  }

  //for connection
  void newBoardSettings(BoardSettingsModel s) {
    state = s;
  }

  void setBoardSettings({
    bool? playersEnabled,
    bool? playerFallsEnabled,
    bool? teamFallsEnabled,
    bool? teamtimeoutsEnabled,
  }) {
    if (playersEnabled == false) {
      playerFallsEnabled = playersEnabled;
    }
    if (playerFallsEnabled == true) {
      playersEnabled = true;
    }
    state = BoardSettingsModel(
      playersEnabled: playersEnabled ?? state.playersEnabled,
      playerFallsEnabled: playerFallsEnabled ?? state.playerFallsEnabled,
      teamFallsEnabled: teamFallsEnabled ?? state.teamFallsEnabled,
      teamTimeoutsEnabled: teamtimeoutsEnabled ?? state.teamTimeoutsEnabled,
    );
  }
}
