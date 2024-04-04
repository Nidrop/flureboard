import 'package:flureboard/features/language/current_language.dart';
import 'package:flureboard/features/main_page/providers/board_settings.dart';
import 'package:flureboard/features/main_page/providers/window_id.dart';
import 'package:flureboard/features/main_page/widgets/center_column/center_column.dart';
import 'package:flureboard/features/main_page/widgets/players_column/players_column.dart';
import 'package:flureboard/features/main_page/widgets/window_icon_button.dart';
import 'package:flureboard/features/settings_dialog/settings_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MainPage extends ConsumerWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final windowId = ref.watch(windowIdProvider);
    final lang = ref.watch(currentLanguageProvider);
    final settings = ref.watch(boardSettingsProvider);

    return Scaffold(
      appBar: (windowId == 0)
          ? AppBar(
              title: Text('Flureboard'),
              centerTitle: true,
              actions: [
                const WindowIconButton(),
                IconButton(
                  tooltip: lang.settings,
                  onPressed: () => showDialog(
                    context: context,
                    builder: (context) => const SettingsDialog(),
                  ),
                  icon: const Icon(Icons.settings),
                ),
              ],
            )
          : null,
      body: (settings.playersEnabled)
          ? const Row(
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
            )
          : const CenterColumn(),
    );
  }
}
