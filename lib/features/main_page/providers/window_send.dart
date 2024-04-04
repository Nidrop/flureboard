import 'dart:convert';

import 'package:desktop_multi_window/desktop_multi_window.dart';
import 'package:flureboard/features/main_page/providers/window_id.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'window_send.g.dart';

@riverpod
void windowSendTeam(
  WindowSendTeamRef ref, {
  required int teamIndex,
  String? teamName,
  String? country,
  int? score,
  int? timeouts,
  int? falls,
}) async {
  final window = ref.watch(windowIdProvider);
  if (window != 0) {
    return;
  }

  final t = jsonEncode({
    "teamIndex": teamIndex,
    "name": teamName,
    "country": country,
    "score": score,
    "timeouts": timeouts,
    "falls": falls,
  });
  try {
    final subWindowIds = await DesktopMultiWindow.getAllSubWindowIds();
    for (final windowId in subWindowIds) {
      DesktopMultiWindow.invokeMethod(
        windowId,
        "windowSendTeam",
        t,
      );
    }
  } on Exception {
    debugPrint("windowSendTeam error");
  }
}
