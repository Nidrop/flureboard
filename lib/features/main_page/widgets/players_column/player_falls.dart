import 'package:flureboard/features/main_page/providers/teams.dart';
import 'package:flureboard/features/main_page/providers/window_id.dart';
import 'package:flureboard/features/main_page/widgets/flure_button.dart';
import 'package:flureboard/features/style/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PlayerFalls extends ConsumerWidget {
  const PlayerFalls({
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
                    ref.read(teamsProvider.notifier).incPlayerFalls(
                          teamIndex: teamIndex,
                          playerIndex: playerIndex,
                          number: 1,
                        ),
                onSecondaryTap: () =>
                    ref.read(teamsProvider.notifier).incPlayerFalls(
                          teamIndex: teamIndex,
                          playerIndex: playerIndex,
                          number: -1,
                        ),
                child: Text(team.players[playerIndex].falls.toString()),
              )
            : Text(
                team.players[playerIndex].falls.toString(),
                style: AppTheme.playerFallsTextStyle,
              ),
      ),
    );
  }
}
