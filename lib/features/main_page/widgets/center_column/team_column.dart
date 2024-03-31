import 'package:flureboard/features/language/current_language.dart';
import 'package:flureboard/features/main_page/providers/board_settings.dart';
import 'package:flureboard/features/main_page/providers/teams.dart';
import 'package:flureboard/features/main_page/providers/window_id.dart';
import 'package:flureboard/features/main_page/widgets/flure_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TeamColumn extends ConsumerWidget {
  const TeamColumn({
    super.key,
    required this.teamIndex,
  });

  final int teamIndex;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        TeamName(
          teamIndex: teamIndex,
        ),
        TeamCountry(
          teamIndex: teamIndex,
        ),
        TeamScore(
          teamIndex: teamIndex,
        ),
        //timeouts
        TeamTimeouts(
          teamIndex: teamIndex,
        ),
      ],
    );
  }
}

class TeamTimeouts extends ConsumerWidget {
  const TeamTimeouts({
    super.key,
    required this.teamIndex,
  });

  final int teamIndex;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final window = ref.watch(windowIdProvider);
    final lang = ref.watch(currentLanguageProvider);
    final team = ref.watch(teamsProvider)[teamIndex];
    final hasTeamTimeouts =
        ref.watch(boardSettingsProvider).teamTimeoutsEnabled;

    return (hasTeamTimeouts)
        ? Column(
            children: [
              Text(lang.teamTimeouts),
              const SizedBox(
                height: 3,
              ),
              (window == 0)
                  ? FlureButton(
                      onPressed: () =>
                          ref.read(teamsProvider.notifier).incTeamTimeouts(
                                teamIndex: teamIndex,
                                number: 1,
                              ),
                      onSecondaryTap: () =>
                          ref.read(teamsProvider.notifier).incTeamTimeouts(
                                teamIndex: teamIndex,
                                number: -1,
                              ),
                      child: Text(team.timeouts.toString()),
                    )
                  : Text(team.timeouts.toString()),
            ],
          )
        : const SizedBox();
  }
}

class TeamScore extends ConsumerWidget {
  const TeamScore({
    super.key,
    required this.teamIndex,
  });

  final int teamIndex;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final window = ref.watch(windowIdProvider);
    final hasPlayers = ref.watch(boardSettingsProvider).playersEnabled;
    final score = ref.watch(TeamScoreProvider(teamIndex));

    return (hasPlayers || window != 0)
        ? Text(
            score.toString(),
            style: const TextStyle(fontSize: 60, fontWeight: FontWeight.bold),
          )
        : FlureButton(
            onPressed: () => ref
                .read(teamsProvider.notifier)
                .incTeamScore(teamIndex: teamIndex, number: 1),
            onSecondaryTap: () => ref
                .read(teamsProvider.notifier)
                .incTeamScore(teamIndex: teamIndex, number: -1),
            child: Text(
              score.toString(),
              style: const TextStyle(fontSize: 60, fontWeight: FontWeight.bold),
            ),
          );
  }
}

class TeamCountry extends ConsumerWidget {
  const TeamCountry({
    super.key,
    required this.teamIndex,
  });

  final int teamIndex;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var window = ref.watch(windowIdProvider);
    var lang = ref.watch(currentLanguageProvider);
    var team = ref.watch(teamsProvider)[teamIndex];

    return Container(
      child: (window == 0)
          ? Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: TextFormField(
                initialValue: ref.read(teamsProvider)[teamIndex].country,
                decoration: InputDecoration(
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.zero),
                  ),
                  labelText: lang.teamCountry,
                ),
                onChanged: (value) => ref.read(teamsProvider.notifier).setTeam(
                      teamIndex: teamIndex,
                      country: value,
                    ),
              ),
            )
          : Text(team.country),
    );
  }
}

class TeamName extends ConsumerWidget {
  const TeamName({
    super.key,
    required this.teamIndex,
  });

  final int teamIndex;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var window = ref.watch(windowIdProvider);
    var lang = ref.watch(currentLanguageProvider);
    var team = ref.watch(teamsProvider)[teamIndex];

    return (window == 0)
        ? Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: TextFormField(
              initialValue: ref.read(teamsProvider)[teamIndex].name,
              decoration: InputDecoration(
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.zero),
                ),
                labelText: lang.teamName,
              ),
              onChanged: (value) => ref.read(teamsProvider.notifier).setTeam(
                    teamIndex: teamIndex,
                    name: value,
                  ),
            ),
          )
        : Text(team.name);
  }
}
