import 'package:reliable_interval_timer/reliable_interval_timer.dart';

class TimerModel {
  bool isPeriod, isPaused;
  int periodTime;
  int timeoutTime;
  late ReliableIntervalTimer _timer;

  TimerModel({
    required this.isPeriod,
    required this.isPaused,
    required this.periodTime,
    required this.timeoutTime,
    required Duration timerInterval,
    required dynamic Function(int) timerCallback,
  }) {
    _timer =
        ReliableIntervalTimer(interval: timerInterval, callback: timerCallback);
  }
}
