import 'package:desktop_multi_window/desktop_multi_window.dart';
import 'package:flureboard/features/language/current_language.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

enum WindowIconButtonState {
  open,
  toggleFullscreen,
}

class WindowIconButton extends ConsumerStatefulWidget {
  const WindowIconButton({super.key});

  @override
  ConsumerState<WindowIconButton> createState() => _WindowIconButtonState();
}

class _WindowIconButtonState extends ConsumerState<WindowIconButton> {
  WindowIconButtonState state = WindowIconButtonState.open;

  void onPressed() {}

  @override
  Widget build(BuildContext context) {
    final lang = ref.watch(currentLanguageProvider);

    return (state == WindowIconButtonState.open)
        ? IconButton(
            onPressed: () {
              DesktopMultiWindow.createWindow('Scoreboard').then((window) {
                window
                  ..setFrame(const Offset(0, 0) & const Size(1280, 720))
                  ..center()
                  ..setTitle('Flureboard Scoreboard')
                  ..showTitleBar(true)
                  ..show();
              });

              setState(() {
                state = WindowIconButtonState.toggleFullscreen;
              });
            },
            tooltip: lang.scoreboard,
            icon: const Icon(Icons.add_box),
          )
        : IconButton(
            onPressed: () {},
            tooltip: lang.fullscreen,
            icon: const Icon(Icons.fullscreen),
          );
  }
}
