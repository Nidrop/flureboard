import 'package:flureboard/features/language/current_language.dart';
import 'package:flureboard/features/main_page/widgets/flure_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wheel_chooser/wheel_chooser.dart';

class TimerDialog extends ConsumerStatefulWidget {
  final int time;
  final void Function(int) onAccept;

  const TimerDialog({super.key, required this.time, required this.onAccept});

  @override
  ConsumerState<TimerDialog> createState() => _TimerDialogState();
}

class _TimerDialogState extends ConsumerState<TimerDialog> {
  final double height = 280;
  final double width = 380;
  late final double wheelHeight = height / 1.5;

  int resTime = 0;
  int firstDigitOfMinute = 0;
  int secondDigitOfMinute = 0;
  int firstDigitOfSecond = 0;
  int secondDigitOfSecond = 0;
  int digitOfMillisecond = 0;

  late List<FixedExtentScrollController> _wheelControllers;

  @override
  void initState() {
    super.initState();

    resTime = widget.time;
    digitOfMillisecond = resTime % 1000 ~/ 100;
    resTime = resTime ~/ 1000;
    int second = resTime % 60;
    firstDigitOfSecond = second % 10;
    secondDigitOfSecond = second ~/ 10;
    resTime = resTime ~/ 60;
    int minute = resTime % 100;
    firstDigitOfMinute = minute % 10;
    secondDigitOfMinute = minute ~/ 10;

    _wheelControllers = [
      FixedExtentScrollController(initialItem: secondDigitOfMinute),
      FixedExtentScrollController(initialItem: firstDigitOfMinute),
      FixedExtentScrollController(initialItem: secondDigitOfSecond),
      FixedExtentScrollController(initialItem: firstDigitOfSecond),
      FixedExtentScrollController(initialItem: digitOfMillisecond),
    ];
  }

  @override
  void dispose() {
    for (var wc in _wheelControllers) {
      wc.dispose();
    }

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final lang = ref.watch(currentLanguageProvider);

    final Color borderColor = Theme.of(context).colorScheme.onPrimaryContainer;

    return Dialog(
      child: Container(
        height: height,
        width: width,
        margin: const EdgeInsets.all(12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              flex: 1,
              child: Center(
                child: Text(
                  lang.timer,
                  style: const TextStyle(fontSize: 20),
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: borderColor,
                        ),
                      ),
                      child: WheelChooser.integer(
                        listHeight: wheelHeight,
                        onValueChanged: (v) => secondDigitOfMinute = v,
                        maxValue: 9,
                        minValue: 0,
                        controller: _wheelControllers[0],
                      ),
                    ),
                  ),
                  const SizedBox(width: 4),
                  Expanded(
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: borderColor,
                        ),
                      ),
                      child: WheelChooser.integer(
                        listHeight: wheelHeight,
                        onValueChanged: (v) => firstDigitOfMinute = v,
                        maxValue: 9,
                        minValue: 0,
                        controller: _wheelControllers[1],
                      ),
                    ),
                  ),
                  Flexible(
                    child: Text(
                      ":",
                      style: TextStyle(fontSize: height / 6),
                    ),
                  ),
                  Expanded(
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        border: Border.all(color: borderColor),
                      ),
                      child: WheelChooser.integer(
                        listHeight: wheelHeight,
                        onValueChanged: (v) => secondDigitOfSecond = v,
                        maxValue: 5,
                        minValue: 0,
                        controller: _wheelControllers[2],
                      ),
                    ),
                  ),
                  const SizedBox(width: 4),
                  Expanded(
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        border: Border.all(color: borderColor),
                      ),
                      child: WheelChooser.integer(
                        listHeight: wheelHeight,
                        onValueChanged: (v) => firstDigitOfSecond = v,
                        maxValue: 9,
                        minValue: 0,
                        controller: _wheelControllers[3],
                      ),
                    ),
                  ),
                  Flexible(
                    child: Text(
                      ".",
                      style: TextStyle(fontSize: height / 6),
                    ),
                  ),
                  Expanded(
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: borderColor,
                        ),
                      ),
                      child: WheelChooser.integer(
                        listHeight: wheelHeight,
                        onValueChanged: (v) => digitOfMillisecond = v,
                        maxValue: 9,
                        minValue: 0,
                        controller: _wheelControllers[4],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Flexible(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  TextButton(
                    // backgroundColor: Theme.of(context).colorScheme.secondary,
                    // backgroundColor: AppTheme.secondaryColor,
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text(lang.cancel),
                  ),
                  TextButton(
                    // backgroundColor: Theme.of(context).colorScheme.secondary,
                    // backgroundColor: AppTheme.secondaryColor,
                    onPressed: () {
                      for (var w in _wheelControllers) {
                        w.animateTo(
                          0,
                          duration: const Duration(milliseconds: 200),
                          curve: Curves.linear,
                        );
                      }
                    },
                    child: Text(lang.reset),
                  ),
                  FlureButton(
                    onPressed: () {
                      int mil = digitOfMillisecond * 100;
                      int sec = secondDigitOfSecond * 10 + firstDigitOfSecond;
                      int min = secondDigitOfMinute * 10 + firstDigitOfMinute;
                      resTime = mil + sec * 1000 + min * 60 * 1000;
                      widget.onAccept(resTime);
                      Navigator.of(context).pop();
                    },
                    child: Text(lang.accept),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
