import 'package:flureboard/features/main_page/models/timer_model.dart';
import 'package:reliable_interval_timer/reliable_interval_timer.dart';
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
      //TODO warm up timer
      timer: ReliableIntervalTimer(
        interval: const Duration(milliseconds: 100),
        callback: _timerCallback,
      ),
      operation: operationSub,
    );
  }

  void _timerCallback(int elapsedMilliseconds) {
    bool isPeriod = state.isPeriod;
    bool isPaused = state.isPaused;
    int periodTime = state.periodTime;
    int timeoutTime = state.timeoutTime;
    int interval = state.timer.interval.inMilliseconds;

    if (isPeriod) {
      if (periodTime > 0) {
        // periodTime = state.periodTime - interval;
        periodTime = state.operation(state.periodTime, interval);
      } else if (periodTime == 0 && state.operation == operationSum) {
        periodTime = state.operation(state.periodTime, interval);
      } else {
        state.timer.stop();
        isPaused = true;
        periodTime = 0;
      }
    } else {
      if (timeoutTime > 0) {
        // timeoutTime = state.timeoutTime - interval;
        timeoutTime = operationSub(state.timeoutTime, interval);
      } else {
        state.timer.stop();
        isPaused = true;
        timeoutTime = 0;
        isPeriod = true;
      }
    }

    state = TimerModel(
      isPeriod: isPeriod,
      isPaused: isPaused,
      periodTime: periodTime,
      timeoutTime: timeoutTime,
      timer: state.timer,
      operation: state.operation,
    );
  }

  void toggleOperation() {
    int Function(int, int) op;
    if (state.operation == operationSub) {
      op = operationSum;
    } else {
      op = operationSub;
    }

    state = TimerModel(
      isPeriod: state.isPeriod,
      isPaused: state.isPaused,
      periodTime: state.periodTime,
      timeoutTime: state.timeoutTime,
      timer: state.timer,
      operation: op,
    );
  }

  void setPeriodTime(int d) {
    // state.periodTime = d;
    state = TimerModel(
      isPeriod: state.isPeriod,
      isPaused: state.isPaused,
      periodTime: d,
      timeoutTime: state.timeoutTime,
      timer: state.timer,
      operation: state.operation,
    );
  }

  //currently only for channel communication
  void setTimeoutTime(int d) {
    // state.timeoutTime = d;
    state = TimerModel(
      isPeriod: state.isPeriod,
      isPaused: state.isPaused,
      periodTime: state.periodTime,
      timeoutTime: d,
      timer: state.timer,
      operation: state.operation,
    );
  }

  //currently only for channel communication
  void setPeriod(bool p) {
    state = TimerModel(
      isPeriod: p,
      isPaused: state.isPaused,
      periodTime: state.periodTime,
      timeoutTime: state.timeoutTime,
      timer: state.timer,
      operation: state.operation,
    );
  }

  void togglePeriodTimer() {
    bool isPeriod = state.isPeriod;
    bool isPaused = state.isPaused;
    int periodTime = state.periodTime;
    int timeoutTime = state.timeoutTime;

    if (isPaused) {
      isPaused = false;
      isPeriod = true;

      (!state.timer.isRunning) ? state.timer.start() : {};
    } else {
      isPaused = true;
      isPeriod = true; //not necessary

      state.timer.stop();
    }

    state = TimerModel(
      isPeriod: isPeriod,
      isPaused: isPaused,
      periodTime: periodTime,
      timeoutTime: timeoutTime,
      timer: state.timer,
      operation: state.operation,
    );
  }

  void toggleTimeout() {
    bool isPeriod = state.isPeriod;
    bool isPaused = state.isPaused;
    int periodTime = state.periodTime;
    int timeoutTime = state.timeoutTime;

    if (isPeriod) {
      isPaused = true; //not necessary
      isPeriod = false;

      //TODO mod
      timeoutTime = 1000 * 60 * 1;
      (!state.timer.isRunning) ? state.timer.start() : {};
    } else {
      isPaused = true;
      isPeriod = true;

      state.timer.stop();
    }

    state = TimerModel(
      isPeriod: isPeriod,
      isPaused: isPaused,
      periodTime: periodTime,
      timeoutTime: timeoutTime,
      timer: state.timer,
      operation: state.operation,
    );
  }

  void setOperation(int Function(int, int) op) {
    state = TimerModel(
      isPeriod: state.isPeriod,
      isPaused: state.isPaused,
      periodTime: state.periodTime,
      timeoutTime: state.timeoutTime,
      timer: state.timer,
      operation: op,
    );
  }
}
