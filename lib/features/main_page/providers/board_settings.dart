import 'package:flureboard/features/main_page/models/board_settings_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'board_settings.g.dart';

@riverpod
class BoardSettings extends _$BoardSettings {
  @override
  BoardSettingsModel build() {
    return BoardSettingsModel(playersEnabled: true);
  }

  setBoardSettings(BoardSettingsModel s) {
    state = BoardSettingsModel(
      playersEnabled: s.playersEnabled,
    );
  }
}
