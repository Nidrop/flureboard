import 'package:flureboard/features/language/current_language.dart';
import 'package:flureboard/features/main_page/providers/board_settings.dart';
import 'package:flureboard/features/main_page/providers/teams.dart';
import 'package:flureboard/features/main_page/widgets/flure_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SettingsDialog extends ConsumerWidget {
  const SettingsDialog({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final lang = ref.watch(currentLanguageProvider);
    final settings = ref.watch(boardSettingsProvider);
    final playerCount =
        ref.watch(teamsProvider.select((value) => value.first.players.length));

    return Dialog(
      child: Container(
        height: 320,
        width: 200,
        margin: const EdgeInsets.all(12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Center(
              child: Text(
                lang.settings,
                style: const TextStyle(fontSize: 20),
              ),
            ),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(lang.players),
                    Switch(
                      value: settings.playersEnabled,
                      onChanged: (v) => ref
                          .read(boardSettingsProvider.notifier)
                          .setBoardSettings(playersEnabled: v),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(lang.playerCount),
                    Column(
                      children: [
                        TextButton(
                          onPressed: () => ref
                              .read(teamsProvider.notifier)
                              .incPlayerCount(1),
                          child: const Text('+'),
                        ),
                        Text(playerCount.toString()),
                        TextButton(
                          onPressed: () => ref
                              .read(teamsProvider.notifier)
                              .incPlayerCount(-1),
                          child: const Text('-'),
                        ),
                      ],
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(lang.playerFalls1),
                    Switch(
                      value: settings.playerFallsEnabled,
                      onChanged: (v) => ref
                          .read(boardSettingsProvider.notifier)
                          .setBoardSettings(playerFallsEnabled: v),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(lang.teamFalls1),
                    Switch(
                      value: settings.teamFallsEnabled,
                      onChanged: (v) => ref
                          .read(boardSettingsProvider.notifier)
                          .setBoardSettings(teamFallsEnabled: v),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(lang.teamTimeouts1),
                    Switch(
                      value: settings.teamTimeoutsEnabled,
                      onChanged: (v) => ref
                          .read(boardSettingsProvider.notifier)
                          .setBoardSettings(teamtimeoutsEnabled: v),
                    ),
                  ],
                ),
              ],
            ),
            FlureButton(
              onPressed: () => Navigator.pop(context),
              child: Text(lang.close),
            ),
          ],
        ),
      ),
    );
  }
}
