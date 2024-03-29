import 'package:flureboard/features/language/current_language.dart';
import 'package:flureboard/features/language/languages.dart';
import 'package:flureboard/features/main_page/models/timer_model.dart';
import 'package:flureboard/features/main_page/providers/timer.dart';
import 'package:flureboard/features/main_page/widgets/flure_button.dart';
import 'package:flureboard/features/timer_dialog/timer_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TimerZone extends ConsumerWidget {
  const TimerZone({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final lang = ref.watch(currentLanguageProvider);
    final timer = ref.watch(timerProvider);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FlureButton(
              onPressed: () {},
              child: Text('10'),
            ),
            FlureButton(
              onPressed: () {},
              child: Text('12'),
            ),
            FlureButton(
              onPressed: () {},
              child: Text('15'),
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
          onPressed: () => ref.read(timerProvider.notifier).togglePeriodTimer(),
          child: Text((timer.isPaused) ? lang.start : lang.pause),
        ),
        const SizedBox(height: 10),
        const TimeoutButton(),
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
        style: const TextStyle(
          color: Colors.yellow,
          fontSize: 25,
          fontWeight: FontWeight.bold,
          fontFeatures: [
            FontFeature.tabularFigures(),
          ],
        ),
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
      backgroundColor: Colors.blueGrey,
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
        style: const TextStyle(
          fontSize: 32,
          fontWeight: FontWeight.bold,
          fontFeatures: [
            FontFeature.tabularFigures(),
          ],
        ),
      ),
    );
  }
}
