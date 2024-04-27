import 'package:flureboard/features/language/current_language.dart';
import 'package:flureboard/features/main_page/models/timer_model.dart';
import 'package:flureboard/features/main_page/providers/timer.dart';
import 'package:flureboard/features/main_page/providers/window_id.dart';
import 'package:flureboard/features/main_page/widgets/flure_button.dart';
import 'package:flureboard/features/style/app_theme.dart';
import 'package:flureboard/features/timer_dialog/timer_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TimerZone extends ConsumerWidget {
  const TimerZone({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final windowId = ref.watch(windowIdProvider);
    final lang = ref.watch(currentLanguageProvider);
    final timer = ref.watch(timerProvider);

    return (windowId == 0)
        ? Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //TODO modification n localization
                  FlureButton(
                    onPressed: () => ref
                        .read(timerProvider.notifier)
                        .setPeriodTime(10 * 60 * 1000),
                    child: Text('10 мин'),
                  ),
                  FlureButton(
                    onPressed: () => ref
                        .read(timerProvider.notifier)
                        .setPeriodTime(12 * 60 * 1000),
                    child: Text('12 мин'),
                  ),
                  FlureButton(
                    onPressed: () => ref
                        .read(timerProvider.notifier)
                        .setPeriodTime(15 * 60 * 1000),
                    child: Text('15 мин'),
                  ),
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              const TimerButton(),
              const SizedBox(
                height: 5,
              ),
              FlureButton(
                onPressed: () =>
                    ref.read(timerProvider.notifier).togglePeriodTimer(),
                child: Text((timer.isPaused) ? lang.start : lang.pause),
              ),
              const SizedBox(height: 10),
              const TimeoutButton(),
            ],
          )
        : const TimersWithoutButtons();
  }
}

class TimersWithoutButtons extends ConsumerWidget {
  const TimersWithoutButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final lang = ref.watch(currentLanguageProvider);
    final timer = ref.watch(timerProvider);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          TimerModel.timeToString(timer.periodTime),
          style: AppTheme.timerTextStyle,
        ),
        const SizedBox(
          height: 5,
        ),
        (timer.isPeriod == false)
            ? Column(
                children: [
                  Text(lang.timeout),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    TimerModel.timeToString(timer.timeoutTime),
                    style: AppTheme.timeoutTextStyle,
                  ),
                ],
              )
            : const SizedBox(),
      ],
    );
  }
}

class TimeoutButton extends ConsumerWidget {
  const TimeoutButton({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final lang = ref.watch(currentLanguageProvider);
    final timer = ref.watch(timerProvider);

    return OutlinedButton(
      onPressed: () => ref.read(timerProvider.notifier).toggleTimeout(),
      child: Text(
        (timer.isPeriod)
            ? lang.timeout
            : TimerModel.timeToString(timer.timeoutTime),
        style: AppTheme.timeoutTextStyle,
      ),
    );
  }
}

class TimerButton extends ConsumerWidget {
  const TimerButton({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final timer = ref.watch(timerProvider);

    return FlureButton(
      backgroundColor: AppTheme.secondaryColor,
      onPressed: () {
        if (timer.isPaused) {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return TimerDialog(
                time: timer.periodTime,
                onAccept: (changedTime) {
                  ref.read(timerProvider.notifier).setPeriodTime(changedTime);
                },
              );
            },
          );
        }
      },
      child: Text(
        TimerModel.timeToString(timer.periodTime),
        style: AppTheme.timerEditTextStyle,
      ),
    );
  }
}
