import 'package:flureboard/features/language/current_language.dart';
import 'package:flureboard/features/main_page/widgets/flure_button.dart';
import 'package:flureboard/features/style/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wheel_chooser/wheel_chooser.dart';

class PlayerNumberDialog extends ConsumerStatefulWidget {
  const PlayerNumberDialog({
    super.key,
    required this.name,
    required this.onAccept,
  });

  final String name;
  final void Function(String) onAccept;

  @override
  ConsumerState<PlayerNumberDialog> createState() => _PlayerNumberDialogState();
}

class _PlayerNumberDialogState extends ConsumerState<PlayerNumberDialog> {
  final double height = 280;
  final double width = 150;
  late final double wheelHeight = height / 1.5;

  final List<String> dataList = [
    " ",
    "0",
    "1",
    "2",
    "3",
    "4",
    "5",
    "6",
    "7",
    "8",
    "9",
  ];

  String firstChar = " ";
  String secondChar = " ";
  String res = "";

  @override
  void initState() {
    super.initState();

    res = widget.name;
    firstChar = res[0];
    secondChar = res[1];
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
                  lang.playerNumber,
                  style: const TextStyle(fontSize: 20),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                DecoratedBox(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: borderColor,
                    ),
                  ),
                  child: WheelChooser(
                    listHeight: wheelHeight,
                    listWidth: 60,
                    onValueChanged: (v) => firstChar = v,
                    datas: dataList,
                    startPosition: dataList.indexOf(firstChar),
                  ),
                ),
                const SizedBox(width: 8),
                DecoratedBox(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: borderColor,
                    ),
                  ),
                  child: WheelChooser(
                    listHeight: wheelHeight,
                    listWidth: 60,
                    onValueChanged: (v) => secondChar = v,
                    datas: dataList,
                    startPosition: dataList.indexOf(secondChar),
                  ),
                ),
              ],
            ),
            Flexible(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                  FlureButton(
                    onPressed: () {
                      res = firstChar + secondChar;
                      widget.onAccept(res);
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
