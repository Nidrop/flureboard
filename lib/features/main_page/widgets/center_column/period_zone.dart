import 'package:flureboard/features/language/current_language.dart';
import 'package:flureboard/features/main_page/providers/period.dart';
import 'package:flureboard/features/main_page/providers/window_id.dart';
import 'package:flureboard/features/main_page/widgets/flure_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PeriodZone extends ConsumerWidget {
  const PeriodZone({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var window = ref.watch(windowIdProvider);
    var lang = ref.watch(currentLanguageProvider);
    var period = ref.watch(periodProvider);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(lang.period),
        const SizedBox(
          height: 3,
        ),
        (window == 0)
            ? FlureButton(
                onPressed: () => ref.read(periodProvider.notifier).inc(1),
                onSecondaryTap: () => ref.read(periodProvider.notifier).inc(-1),
                child: Text(period.toString()),
              )
            : Text(period.toString()),
      ],
    );
  }
}
