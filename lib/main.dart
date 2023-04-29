import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart' as fv;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ny_times_stories_app_flutter/src/core/common_feature/presentation/providers/language_provider.dart';
import 'package:ny_times_stories_app_flutter/src/core/styles/app_theme.dart';
import 'package:ny_times_stories_app_flutter/src/core/translations/l10n.dart';
import 'package:ny_times_stories_app_flutter/src/core/util/injections.dart';
import 'package:ny_times_stories_app_flutter/src/core/util/router.dart';
import 'package:ny_times_stories_app_flutter/src/features/intro/presentation/pages/intro_page.dart';

import 'src/core/common_feature/presentation/providers/theme_provider.dart';

final navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initInjections();
  runApp(DevicePreview(
    builder: (context) {
      return fv.ProviderScope(
        child: App(),
      );
    },
    enabled: false,
  ));

  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
}

class App extends ConsumerWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final isDarkTheme = ref.watch(themeModeProvider);
    final language = ref.watch(languageProvider);

    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          useInheritedMediaQuery: false,
          title: 'New York Times Stories App',
          onGenerateRoute: AppRouter.generateRoute,
          theme: isDarkTheme ? darkAppTheme : appTheme,
          debugShowCheckedModeBanner: false,
          locale: Locale(language.name),
          builder: DevicePreview.appBuilder,
          localizationsDelegates: const [
            S.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          navigatorKey: navigatorKey,
          supportedLocales: const [
            Locale("ar"),
            Locale("en"),
          ],
          home: const IntroPage(),
        );
      },
    );
  }
}
