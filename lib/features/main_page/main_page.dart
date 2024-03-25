import 'package:flureboard/features/main_page/widgets/center_column/center_column.dart';
import 'package:flureboard/features/main_page/widgets/players_column/players_column.dart';
import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flureboard'),
        centerTitle: true,
      ),
      body: const Row(
        children: [
          SizedBox(
            width: 426,
            child: PlayersColumn(
              teamIndex: 0,
            ),
          ),
          VerticalDivider(
            width: 4,
          ),
          Expanded(
            child: CenterColumn(),
          ),
          VerticalDivider(
            width: 4,
          ),
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
