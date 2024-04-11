import 'package:desktop_multi_window/desktop_multi_window.dart';
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
    WidgetsFlutterBinding.ensureInitialized();
    DesktopMultiWindow.createWindow('Scoreboard').then((window) {
      window
        ..setFrame(const Offset(0, 0) & const Size(1280, 720))
        ..center()
        ..setTitle('Flureboard Scoreboard')
        ..showTitleBar(true)
        ..setPreventClose(true)
        ..hide();
    });

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

class MyAppSecondary extends ConsumerStatefulWidget {
  const MyAppSecondary({super.key, required this.windowId});
  final int windowId;

  @override
  ConsumerState<MyAppSecondary> createState() => _MyAppSecondaryState();
}

class _MyAppSecondaryState extends ConsumerState<MyAppSecondary> {
  @override
  void initState() {
    super.initState();
    Future(() => ref.read(windowIdProvider.notifier).setId(widget.windowId));
  }

  @override
  Widget build(BuildContext context) {
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
