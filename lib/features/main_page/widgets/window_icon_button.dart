import 'package:flureboard/features/language/current_language.dart';
import 'package:flureboard/features/main_page/providers/window_icon_state.dart';
import 'package:flureboard/features/main_page/providers/window_send.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class WindowIconButton extends ConsumerWidget {
  const WindowIconButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(subWindowStateProvider);
    final lang = ref.watch(currentLanguageProvider);
    //init for communication
    ref.watch(windowSendPeriodProvider);
    ref.watch(windowSendTimerProvider);
    ref.watch(windowSendTimerStateProvider);
    ref.watch(windowSendBoardSettingsProvider);

    return (state == WindowIconButtonEnum.closed)
        ? IconButton(
            onPressed: () {
              ref
                  .read(subWindowStateProvider.notifier)
                  .setButtonState(WindowIconButtonEnum.windowed);
            },
            tooltip: lang.scoreboard,
            icon: const Icon(Icons.add_box),
          )
        : Row(
            children: [
              IconButton(
                onPressed: () {
                  ref.read(subWindowStateProvider.notifier).setButtonState(
                        (state == WindowIconButtonEnum.windowed)
                            ? WindowIconButtonEnum.fullscreen
                            : WindowIconButtonEnum.windowed,
                      );
                },
                tooltip: lang.fullscreen,
                icon: (state == WindowIconButtonEnum.windowed)
                    ? const Icon(Icons.fullscreen)
                    : const Icon(Icons.fullscreen_exit),
              ),
              IconButton(
                onPressed: () {
                  ref
                      .read(subWindowStateProvider.notifier)
                      .setButtonState(WindowIconButtonEnum.closed);
                },
                tooltip: lang.close,
                icon: const Icon(Icons.close),
              ),
            ],
          );
  }
}
