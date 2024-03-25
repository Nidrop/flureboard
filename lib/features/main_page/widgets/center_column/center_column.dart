import 'package:flureboard/features/main_page/widgets/center_column/period_zone.dart';
import 'package:flureboard/features/main_page/widgets/center_column/team_column.dart';
import 'package:flureboard/features/main_page/widgets/center_column/team_falls.dart';
import 'package:flureboard/features/main_page/widgets/center_column/timer_zone.dart';
import 'package:flutter/material.dart';

class CenterColumn extends StatelessWidget {
  const CenterColumn({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        //teams,period
        Expanded(
          flex: 5,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(child: TeamColumn(teamIndex: 0)),
              PeriodZone(),
              Expanded(child: TeamColumn(teamIndex: 1)),
            ],
          ),
        ),
        //timer
        Expanded(flex: 3, child: TimerZone()),
        //falls
        Expanded(
          flex: 1,
          child: Row(
            children: [
              Expanded(child: TeamFalls(teamIndex: 0)),
              Expanded(child: TeamFalls(teamIndex: 1)),
            ],
          ),
        ),
      ],
    );
  }
}
