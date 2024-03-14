import 'package:flureboard/features/main_page/models/timer_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'timer.g.dart';

@riverpod
class Timer extends _$Timer {
  @override
  TimerModel build() {
    return TimerModel(
      isPeriod: true,
      isPaused: true,
      periodTime: 0,
      timeoutTime: 0,
      timerInterval: const Duration(milliseconds: 100),
      timerCallback: _timerCallback,
    );
  }

  void _timerCallback(int elapsedMilliseconds) {}
  void setPeriodTime(DateTime d) {}
  void togglePeriodTimer() {}
  void toggleTimeout() {}
  void resetPeriodTimer() {}
}
