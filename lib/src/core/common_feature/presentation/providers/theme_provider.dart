import 'package:stories_app_flutter/src/core/util/helper/helper.dart';
import 'package:riverpod/riverpod.dart';

final themeModeProvider = StateProvider<bool>((ref) {
  return Helper.isDarkTheme();
});