import 'package:reliable_interval_timer/reliable_interval_timer.dart';

int operationSum(int n1, int n2) => n1 + n2;
int operationSub(int n1, int n2) => n1 - n2;

class TimerModel {
  final bool isPeriod, isPaused;
  final int periodTime;
  final int timeoutTime;
  final ReliableIntervalTimer timer;
  final int Function(int, int) operation;

  TimerModel({
    required this.isPeriod,
    required this.isPaused,
    required this.periodTime,
    required this.timeoutTime,
    required this.timer,
    required this.operation,
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
