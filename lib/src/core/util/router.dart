import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stories_app_flutter/src/core/common_feature/presentation/pages/photo_view_page.dart';
import 'package:stories_app_flutter/src/core/common_feature/presentation/pages/web_view_page.dart';
import 'package:stories_app_flutter/src/features/ny_times_stories/data/entities/story_model.dart';
import 'package:stories_app_flutter/src/features/ny_times_stories/presentation/pages/stories_page.dart';
import 'package:stories_app_flutter/src/features/ny_times_stories/presentation/pages/story_details_page.dart';

class AppRouter {
  static String currentRoute = "/";

  static Route<dynamic> generateRoute(RouteSettings settings) {
    currentRoute = settings.name ?? "/";
    switch (settings.name) {
      // Stories page
      case '/stories_page':
        return CupertinoPageRoute(
          settings: RouteSettings(name: settings.name),
          builder: (_) => StoriesPage(),
        );

      // Story details page
      case '/story_details_page':
        return CupertinoPageRoute(
          settings: RouteSettings(name: settings.name),
          builder: (_) {
            assert(settings.arguments != null, "story model is required");
            return StoryDetailsPage(
              model: settings.arguments as StoryModel,
            );
          },
        );

      // Web view page
      case '/web_view_page':
        return CupertinoPageRoute(
          settings: RouteSettings(name: settings.name),
          builder: (_) => WebViewPage(
            link: settings.arguments as String,
          ),
        );

      // Photo view page
      case '/photo_view_page':
        return CupertinoPageRoute(
          settings: RouteSettings(name: settings.name),
          builder: (_) {
            Map<String, dynamic>? args =
                settings.arguments as Map<String, dynamic>?;
            assert(args != null, "You should pass 'path' and 'fromNet'");
            return PhotoViewPage(
              path: args!['path'],
              fromNet: args['fromNet'],
            );
          },
        );

      default:
        return CupertinoPageRoute(
          settings: RouteSettings(name: settings.name),
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
