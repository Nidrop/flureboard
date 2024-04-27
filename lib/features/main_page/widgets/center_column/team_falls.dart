import 'package:flureboard/features/language/current_language.dart';
import 'package:flureboard/features/main_page/providers/board_settings.dart';
import 'package:flureboard/features/main_page/providers/teams.dart';
import 'package:flureboard/features/main_page/providers/window_id.dart';
import 'package:flureboard/features/main_page/widgets/flure_button.dart';
import 'package:flureboard/features/style/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TeamFalls extends ConsumerWidget {
  const TeamFalls({
    super.key,
    required this.teamIndex,
  });

  final int teamIndex;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final window = ref.watch(windowIdProvider);
    final lang = ref.watch(currentLanguageProvider);
    final team = ref.watch(teamsProvider)[teamIndex];
    final hasTeamFalls = ref.watch(boardSettingsProvider).teamFallsEnabled;

    return (hasTeamFalls)
        ? Container(
            padding: const EdgeInsets.symmetric(horizontal: 1, vertical: 5),
            alignment:
                (teamIndex == 0) ? Alignment.bottomLeft : Alignment.bottomRight,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(lang.teamFalls),
                const SizedBox(
                  height: 3,
                ),
                (window == 0)
                    ? FlureButton(
                        onPressed: () =>
                            ref.read(teamsProvider.notifier).incTeamFalls(
                                  teamIndex: teamIndex,
                                  number: 1,
                                ),
                        onSecondaryTap: () =>
                            ref.read(teamsProvider.notifier).incTeamFalls(
                                  teamIndex: teamIndex,
                                  number: -1,
                                ),
                        child: Text(team.falls.toString()),
                      )
                    : Text(
                        team.falls.toString(),
                        style: AppTheme.centerNumbersTextStyle,
                      ),
              ],
            ),
          )
        : const SizedBox();
  }
}
