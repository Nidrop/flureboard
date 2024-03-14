import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'period.g.dart';

@riverpod
class Period extends _$Period {
  @override
  int build() {
    return 0;
  }

  void inc() {
    state++;
  }

  void dec() {
    state--;
  }
}
