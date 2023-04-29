import 'package:stories_app_flutter/src/core/common_feature/data/entities/language_enum.dart';
import 'package:stories_app_flutter/src/core/util/helper/helper.dart';
import 'package:riverpod/riverpod.dart';

final languageProvider = StateProvider<LanguageEnum>((ref) {
  return Helper.getLang();
});