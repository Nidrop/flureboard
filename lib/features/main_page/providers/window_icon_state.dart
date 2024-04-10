import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'window_icon_state.g.dart';

enum WindowIconButtonEnum {
  closed,
  windowed,
  fullscreen,
}

@riverpod
class WindowIconState extends _$WindowIconState {
  @override
  WindowIconButtonEnum build() {
    return WindowIconButtonEnum.closed;
  }

  setButtonState(WindowIconButtonEnum newState) {
    state = newState;
  }
}
