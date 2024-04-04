import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flureboard/features/main_page/main_page.dart';
import 'package:flureboard/features/main_page/providers/window_id.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main(List<String> args) {
  if (args.firstOrNull == 'multi_window') {
    final windowId = int.parse(args[1]);
    // final argument = args[2];
    runApp(
      ProviderScope(
        child: MyAppSecondary(
          windowId: windowId,
        ),
      ),
    );
  } else {
    // debugPrint(args.firstOrNull);
    runApp(const ProviderScope(child: MyApp()));
  }
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      title: 'Flureboard',
      theme: FlexThemeData.light(scheme: FlexScheme.indigo),
      darkTheme: FlexThemeData.dark(
        scheme: FlexScheme.indigo,
        darkIsTrueBlack: true,
      ),
      themeMode: ThemeMode.dark,
      debugShowCheckedModeBanner: false,
      home: const MainPage(),
    );
  }
}

class MyAppSecondary extends ConsumerWidget {
  const MyAppSecondary({super.key, required this.windowId});
  final int windowId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //TODO find another way
    final wid = ref.watch(windowIdProvider);
    if (wid == 0) {
      Future(() => ref.read(windowIdProvider.notifier).setId(windowId));
    }

    return MaterialApp(
      title: 'Flureboard Scoreboard',
      theme: FlexThemeData.light(scheme: FlexScheme.indigo),
      darkTheme: FlexThemeData.dark(
        scheme: FlexScheme.indigo,
        darkIsTrueBlack: true,
      ),
      themeMode: ThemeMode.dark,
      debugShowCheckedModeBanner: false,
      home: const MainPage(),
    );
  }
}
