import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'window_id.g.dart';

@riverpod
class Period extends _$Period {
  @override
  int build() {
    return 0;
  }

  void setId(int id) {
    state = id;
  }
}
