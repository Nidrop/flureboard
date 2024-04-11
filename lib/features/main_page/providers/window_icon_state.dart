import 'package:desktop_multi_window/desktop_multi_window.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'window_icon_state.g.dart';

enum WindowIconButtonEnum {
  closed,
  windowed,
  fullscreen,
}

@riverpod
class SubWindowState extends _$SubWindowState {
  @override
  WindowIconButtonEnum build() {
    return WindowIconButtonEnum.closed;
  }

  setButtonState(WindowIconButtonEnum newState) {
    try {
      DesktopMultiWindow.getAllSubWindowIds().then(
        (subWindowIds) {
          for (final windowId in subWindowIds) {
            final wcontroller = WindowController.fromWindowId(windowId);
            switch (newState) {
              case WindowIconButtonEnum.closed:
                wcontroller.setFullscreen(false).then(
                      (value) => wcontroller.hide(),
                    );
                break;
              case WindowIconButtonEnum.windowed:
                wcontroller.setFullscreen(false).then(
                      (value) => wcontroller.isHidden().then(
                            (value) =>
                                (value == true) ? wcontroller.show() : {},
                          ),
                    );
                break;
              case WindowIconButtonEnum.fullscreen:
                wcontroller.setFullscreen(true);
                break;
            }
          }
        },
      );
    } catch (e) {
      debugPrint("get sub windows error");
    }
    state = newState;
  }
}
