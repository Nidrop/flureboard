import 'package:flureboard/features/main_page/widgets/center_column/center_column.dart';
import 'package:flureboard/features/main_page/widgets/players_column/players_column.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flureboard'),
      ),
      body: Row(
        children: [
          SizedBox(
            width: 426,
            child: PlayersColumn(
              teamIndex: 0,
            ),
          ),
          VerticalDivider(),
          Expanded(
            child: CenterColumn(),
          ),
          VerticalDivider(),
          SizedBox(
            width: 426,
            child: PlayersColumn(
              teamIndex: 1,
            ),
          ),
        ],
      ),
    );
  }
}
