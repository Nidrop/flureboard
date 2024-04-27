import 'dart:ui';

import 'package:flureboard/features/main_page/providers/teams.dart';
import 'package:flureboard/features/main_page/providers/window_id.dart';
import 'package:flureboard/features/main_page/widgets/flure_button.dart';
import 'package:flureboard/features/style/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PlayerScore extends ConsumerWidget {
  const PlayerScore({
    super.key,
    required this.teamIndex,
    required this.playerIndex,
  });

  final int teamIndex;
  final int playerIndex;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var team = ref.watch(teamsProvider)[teamIndex];
    var window = ref.watch(windowIdProvider);

    return ConstrainedBox(
      constraints: const BoxConstraints(
        maxHeight: AppTheme.maxFontHeightConstraint,
      ),
      child: FittedBox(
        child: window == 0
            ? FlureButton(
                onPressed: () =>
                    ref.read(teamsProvider.notifier).incPlayerScore(
                          teamIndex: teamIndex,
                          playerIndex: playerIndex,
                          number: 1,
                        ),
                onSecondaryTap: () =>
                    ref.read(teamsProvider.notifier).incPlayerScore(
                          teamIndex: teamIndex,
                          playerIndex: playerIndex,
                          number: -1,
                        ),
                child: Text(team.players[playerIndex].score.toString()),
              )
            : Text(
                team.players[playerIndex].score.toString(),
                style: AppTheme.playerScoreTextStyle,
              ),
      ),
    );
  }
}
