import 'dart:convert';

import 'package:desktop_multi_window/desktop_multi_window.dart';
import 'package:flureboard/features/main_page/providers/teams.dart';
import 'package:flutter/services.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'window_id.g.dart';

@riverpod
class WindowId extends _$WindowId {
  @override
  int build() {
    //TODO is that correct?
    DesktopMultiWindow.setMethodHandler(_handleMethodCallback);
    ref.onDispose(() {
      if (state == 0) {
        DesktopMultiWindow.setMethodHandler(null);
      }
    });
    return 0;
  }

  void setId(int id) {
    state = id;
  }

  Future<void> _handleMethodCallback(MethodCall call, int fromWindowId) async {
    switch (call.method) {
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
      default:
    }
  }
}
