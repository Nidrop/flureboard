import 'package:flureboard/features/language/current_language.dart';
import 'package:flureboard/features/language/languages.dart';
import 'package:flureboard/features/main_page/providers/teams.dart';
import 'package:flureboard/features/main_page/widgets/players_column/player_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PlayersColumn extends ConsumerWidget {
  const PlayersColumn({
    super.key,
    required this.teamIndex,
  });

  final int teamIndex;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var playerCount = ref.watch(teamsProvider)[teamIndex].players.length;

    return Column(
      children: [
        const PlayersColumnTitles(),
        const Divider(
          height: 6,
        ),
        Expanded(
          child: LayoutBuilder(
            builder: (context, constraits) => ListView(
              //controller: scrollController,
              children: [
                ConstrainedBox(
                  constraints: BoxConstraints(minHeight: constraits.maxHeight),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: List<Widget>.generate(playerCount, (int index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        child: PlayerRow(
                          playerIndex: index,
                          teamIndex: teamIndex,
                        ),
                      );
                    }),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class PlayersColumnTitles extends ConsumerWidget {
  const PlayersColumnTitles({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var lang = ref.watch(currentLanguageProvider);

    return Row(
      children: [
        Expanded(
          flex: 1,
          child: Text(lang.playerNumber),
        ),
        Expanded(
          flex: 4,
          child: Text(lang.playerName),
        ),
        Expanded(
          flex: 1,
          child: Text(lang.playerFalls),
        ),
        Expanded(
          flex: 1,
          child: Text(lang.playerScore),
        ),
      ],
    );
  }
}
