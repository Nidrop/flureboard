import 'package:reliable_interval_timer/reliable_interval_timer.dart';

class TimerModel {
  final bool isPeriod, isPaused;
  final int periodTime;
  final int timeoutTime;
  final ReliableIntervalTimer timer;

  TimerModel({
    required this.isPeriod,
    required this.isPaused,
    required this.periodTime,
    required this.timeoutTime,
    required this.timer,
  });

  static String timeToString(int time) {
    int remainder = time;
    int millisecond = remainder % 1000 ~/ 100;
    remainder = remainder ~/ 1000;
    int second = remainder % 60;
    remainder = remainder ~/ 60;
    int minute = remainder % 100;
    return "${minute < 10 ? '0$minute' : minute}"
        ":${second < 10 ? '0$second' : second}"
        ".$millisecond";
  }
}
