import 'package:flureboard/features/main_page/providers/teams.dart';
import 'package:flureboard/features/main_page/providers/window_id.dart';
import 'package:flureboard/features/main_page/widgets/flure_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PlayerNumber extends ConsumerWidget {
  const PlayerNumber({
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

    return FittedBox(
      child: window == 0
          ? FlureButton(
              onPressed: () => (),
              // backgroundColor: Theme.of(context).colorScheme.secondary,
              backgroundColor: Colors.blueGrey,
              child: Text(team.players[playerIndex].number),
            )
          : Text(team.players[playerIndex].number),
    );
  }
}
