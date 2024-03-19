import 'package:flureboard/features/main_page/widgets/players_column/player_falls.dart';
import 'package:flureboard/features/main_page/widgets/players_column/player_name.dart';
import 'package:flureboard/features/main_page/widgets/players_column/player_number.dart';
import 'package:flureboard/features/main_page/widgets/players_column/player_score.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class PlayerRow extends StatelessWidget {
  const PlayerRow({
    super.key,
    required this.teamIndex,
    required this.playerIndex,
  });

  final int teamIndex;
  final int playerIndex;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: PlayerNumber(
            teamIndex: teamIndex,
            playerIndex: playerIndex,
          ),
        ),
        Expanded(
          flex: 4,
          child: PlayerName(
            teamIndex: teamIndex,
            playerIndex: playerIndex,
          ),
        ),
        Expanded(
          child: PlayerFalls(
            teamIndex: teamIndex,
            playerIndex: playerIndex,
          ),
        ),
        Expanded(
          child: PlayerScore(
            teamIndex: teamIndex,
            playerIndex: playerIndex,
          ),
        ),
      ],
    );
  }
}
