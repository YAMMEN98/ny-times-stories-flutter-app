import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:stories_app_flutter/src/core/common_feature/data/entities/language_enum.dart';
import 'package:stories_app_flutter/src/core/util/constant/app_constants.dart';

import '../../common_feature/data/data_sources/app_shared_prefs.dart';
import '../injections.dart';

class Helper {
  // Get language
  static LanguageEnum getLang() {
    LanguageEnum? lang;
    lang = sl<AppSharedPrefs>().getLang();
    lang = lang ?? LanguageEnum.en;
    return lang;
  }

  // Get language
  static void  setLang(LanguageEnum language) {
     sl<AppSharedPrefs>().setLang(language);
  }

  // Get svg picture path
  static String getSvgPath(String name) {
    return "$svgPath$name";
  }

  // Get image picture path
  static String getImagePath(String name) {
    return "$imagePath$name";
  }

  // Get vertical space
  static double getVerticalSpace() {
    return 10.h;
  }

  // Get horizontal space
  static double getHorizontalSpace() {
    return 10.w;
  }

  // Get Dio Header
  static Map<String, dynamic> getHeaders() {
    return {}..removeWhere((key, value) => value == null);
  }

  // Get theme is dark or not
  static bool  isDarkTheme() {
    return sl<AppSharedPrefs>().getIsDarkTheme();
  }

  // Format date to standard format
  static formatDate(String date) {
    DateTime dateTime = DateTime.parse(date);
    return DateFormat('dd/MM/yyyy').format(dateTime);
  }
}
