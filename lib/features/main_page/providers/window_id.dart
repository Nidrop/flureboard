import 'dart:convert';

import 'package:desktop_multi_window/desktop_multi_window.dart';
import 'package:flureboard/features/main_page/models/board_settings_model.dart';
import 'package:flureboard/features/main_page/providers/board_settings.dart';
import 'package:flureboard/features/main_page/providers/period.dart';
import 'package:flureboard/features/main_page/providers/teams.dart';
import 'package:flureboard/features/main_page/providers/timer.dart';
import 'package:flutter/services.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'window_id.g.dart';

@riverpod
class WindowId extends _$WindowId {
  @override
  int build() {
    // DesktopMultiWindow.setMethodHandler(_handleMethodCallback);
    ref.onDispose(() {
      DesktopMultiWindow.setMethodHandler(null);
    });
    return 0;
  }

  void setId(int id) {
    if (id != 0) {
      DesktopMultiWindow.setMethodHandler(_handleMethodCallback);
    }
    state = id;
  }

  Future<void> _handleMethodCallback(MethodCall call, int fromWindowId) async {
    switch (call.method) {
      case "windowSendPeriodTime":
        ref.read(timerProvider.notifier).setPeriodTime(call.arguments as int);
        break;
      case "windowSendTimeoutTime":
        ref.read(timerProvider.notifier).setTimeoutTime(call.arguments as int);
        break;
      case "windowSendTimerPeriod":
        ref.read(timerProvider.notifier).setPeriod(call.arguments as bool);
        break;
      case "windowSendTeam":
        final Map<String, dynamic> json = jsonDecode(call.arguments);
        ref.read(teamsProvider.notifier).setTeam(
              teamIndex: json["teamIndex"],
              name: json["name"],
              country: json["country"],
              score: json["score"],
              timeouts: json["timeouts"],
              falls: json["falls"],
            );
        break;
      case "windowSendPlayer":
        final Map<String, dynamic> json = jsonDecode(call.arguments);
        ref.read(teamsProvider.notifier).setPlayer(
              teamIndex: json["teamIndex"],
              playerIndex: json["playerIndex"],
              number: json["number"],
              name: json["name"],
              falls: json["falls"],
              score: json["score"],
            );
        break;
      case "windowSendPeriod":
        ref.read(periodProvider.notifier).set(call.arguments as int);
        break;
      case "windowSendBoardSettings":
        ref.read(boardSettingsProvider.notifier).newBoardSettings(
              BoardSettingsModel.fromJson(jsonDecode(call.arguments as String)),
            );
        break;
      default:
    }
  }
}
