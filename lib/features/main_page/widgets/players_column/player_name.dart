import 'package:flureboard/features/main_page/providers/teams.dart';
import 'package:flureboard/features/main_page/providers/window_id.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PlayerName extends ConsumerWidget {
  const PlayerName({
    required this.playerIndex,
    required this.teamIndex,
    super.key,
  });

  final int playerIndex;
  final int teamIndex;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var team = ref.watch(teamsProvider)[0];
    var window = ref.watch(windowIdProvider);

    if (window == 0) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 3),
        child: TextFormField(
          initialValue: ref.read(teamsProvider)[0].players[playerIndex].name,
          decoration: const InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.zero),
            ),
          ),
          onChanged: (value) => ref.read(teamsProvider.notifier).setPlayer(
                teamIndex: 0,
                playerIndex: playerIndex,
                name: value,
              ),
        ),
      );
    } else {
      return Text(team.players[playerIndex].name.toString());
    }
  }
}
