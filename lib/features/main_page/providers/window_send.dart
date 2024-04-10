import 'dart:convert';

import 'package:desktop_multi_window/desktop_multi_window.dart';
import 'package:flureboard/features/main_page/providers/period.dart';
import 'package:flureboard/features/main_page/providers/timer.dart';
import 'package:flureboard/features/main_page/providers/window_id.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'window_send.g.dart';

void _send<T>(String method, T args) async {
  try {
    final subWindowIds = await DesktopMultiWindow.getAllSubWindowIds();
    for (final windowId in subWindowIds) {
      DesktopMultiWindow.invokeMethod(
        windowId,
        method,
        args,
      );
    }
  } on Exception {
    debugPrint("send string error");
  }
}

@riverpod
void windowSendTeam(
  WindowSendTeamRef ref, {
  required int teamIndex,
  String? teamName,
  String? country,
  int? score,
  int? timeouts,
  int? falls,
}) {
  final window = ref.watch(windowIdProvider);
  if (window != 0) {
    return;
  }

  Map<String, dynamic> json = {
    "teamIndex": teamIndex,
  };

  (teamName != null) ? json["name"] = teamName : {};
  (country != null) ? json["country"] = country : {};
  (score != null) ? json["score"] = score : {};
  (timeouts != null) ? json["timeouts"] = timeouts : {};
  (falls != null) ? json["falls"] = falls : {};

  _send<String>("windowSendTeam", jsonEncode(json));
}

@riverpod
void windowSendPlayer(
  WindowSendPlayerRef ref, {
  required int teamIndex,
  required int playerIndex,
  String? number,
  String? playerName,
  int? falls,
  int? score,
}) {
  final window = ref.watch(windowIdProvider);
  if (window != 0) {
    return;
  }

  Map<String, dynamic> json = {
    "teamIndex": teamIndex,
    "playerIndex": playerIndex,
  };

  (number != null) ? json["number"] = number : {};
  (playerName != null) ? json["name"] = playerName : {};
  (falls != null) ? json["falls"] = falls : {};
  (score != null) ? json["score"] = score : {};

  _send<String>("windowSendPlayer", jsonEncode(json));
}

@riverpod
void windowSendPeriod(WindowSendPeriodRef ref) async {
  final window = ref.watch(windowIdProvider);
  if (window != 0) {
    return;
  }

  final period = ref.watch(periodProvider);
  _send<int>("windowSendPeriod", period);
}

@riverpod
void windowSendTimer(WindowSendTimerRef ref) async {
  final window = ref.watch(windowIdProvider);
  if (window != 0) {
    return;
  }

  final timer = ref.watch(timerProvider);
  if (timer.isPeriod) {
    _send<int>(
      "windowSendPeriodTime",
      timer.periodTime,
    );
  } else {
    _send<int>(
      "windowSendTimeoutTime",
      timer.timeoutTime,
    );
  }
}

@riverpod
void windowSendTimerState(WindowSendTimerStateRef ref) {
  final window = ref.watch(windowIdProvider);
  if (window != 0) {
    return;
  }

  ref.listen(
    timerProvider.select((value) => value.isPeriod),
    (previous, next) {
      if (previous != next) {
        _send<bool>("windowSendTimerPeriod", next);
      }
    },
  );
}
