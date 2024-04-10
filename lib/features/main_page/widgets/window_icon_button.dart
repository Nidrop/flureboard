import 'package:desktop_multi_window/desktop_multi_window.dart';
import 'package:flureboard/features/language/current_language.dart';
import 'package:flureboard/features/main_page/providers/window_icon_state.dart';
import 'package:flureboard/features/main_page/providers/window_send.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class WindowIconButton extends ConsumerWidget {
  const WindowIconButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(windowIconStateProvider);
    final lang = ref.watch(currentLanguageProvider);
    //init for communication
    ref.watch(windowSendPeriodProvider);
    ref.watch(windowSendTimerProvider);
    ref.watch(windowSendTimerStateProvider);

    return (state == WindowIconButtonEnum.closed)
        ? IconButton(
            onPressed: () {
              DesktopMultiWindow.createWindow('Scoreboard').then((window) {
                window
                  ..setFrame(const Offset(0, 0) & const Size(1280, 720))
                  ..center()
                  ..setTitle('Flureboard Scoreboard')
                  ..showTitleBar(true)
                  ..setPreventClose(true)
                  ..show();
              });

              ref
                  .read(windowIconStateProvider.notifier)
                  .setButtonState(WindowIconButtonEnum.windowed);
            },
            tooltip: lang.scoreboard,
            icon: const Icon(Icons.add_box),
          )
        : Row(
            children: [
              IconButton(
                onPressed: () {
                  try {
                    DesktopMultiWindow.getAllSubWindowIds().then(
                      (subWindowIds) {
                        for (final windowId in subWindowIds) {
                          WindowController.fromWindowId(windowId).setFullscreen(
                            (state == WindowIconButtonEnum.windowed)
                                ? true
                                : false,
                          );
                        }
                      },
                    );
                  } on Exception {
                    debugPrint("get sub windows error");
                  }
                  ref.read(windowIconStateProvider.notifier).setButtonState(
                      (state == WindowIconButtonEnum.windowed)
                          ? WindowIconButtonEnum.fullscreen
                          : WindowIconButtonEnum.windowed);
                },
                tooltip: lang.fullscreen,
                icon: (state == WindowIconButtonEnum.windowed)
                    ? const Icon(Icons.fullscreen)
                    : const Icon(Icons.fullscreen_exit),
              ),
              IconButton(
                onPressed: () {
                  try {
                    DesktopMultiWindow.getAllSubWindowIds().then(
                      (subWindowIds) {
                        for (final windowId in subWindowIds) {
                          WindowController.fromWindowId(windowId)
                              .setPreventClose(false)
                              .then((value) {
                            WindowController.fromWindowId(windowId).close();
                          });
                        }
                      },
                    );
                  } on Exception {
                    debugPrint("get sub windows error");
                  }
                  ref
                      .read(windowIconStateProvider.notifier)
                      .setButtonState(WindowIconButtonEnum.closed);
                },
                tooltip: lang.close,
                icon: const Icon(Icons.close),
              ),
            ],
          );
  }
}
