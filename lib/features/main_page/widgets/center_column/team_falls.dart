import 'package:flureboard/features/language/current_language.dart';
import 'package:flureboard/features/main_page/providers/teams.dart';
import 'package:flureboard/features/main_page/widgets/flure_button.dart';
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
    var lang = ref.watch(currentLanguageProvider);
    var team = ref.watch(teamsProvider)[teamIndex];

    return Container(
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
          FlureButton(
            onPressed: () => ref.read(teamsProvider.notifier).incTeamFalls(
                  teamIndex: teamIndex,
                  number: 1,
                ),
            onSecondaryTap: () => ref.read(teamsProvider.notifier).incTeamFalls(
                  teamIndex: teamIndex,
                  number: -1,
                ),
            child: Text(team.falls.toString()),
          ),
        ],
      ),
    );
  }
}
