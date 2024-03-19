import 'package:flureboard/features/language/languages.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'current_language.g.dart';

@riverpod
class CurrentLanguage extends _$CurrentLanguage {
  @override
  Lang build() {
    return LangRu();
  }
}
