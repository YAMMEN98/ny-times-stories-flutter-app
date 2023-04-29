import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ny_times_stories_app_flutter/src/core/common_feature/presentation/widgets/arrow_back_button_widget.dart';
import 'package:ny_times_stories_app_flutter/src/core/common_feature/presentation/widgets/button_widget.dart';
import 'package:ny_times_stories_app_flutter/src/core/styles/app_colors.dart';
import 'package:ny_times_stories_app_flutter/src/core/translations/l10n.dart';
import 'package:ny_times_stories_app_flutter/src/core/util/constant/app_constants.dart';
import 'package:ny_times_stories_app_flutter/src/features/ny_times_stories/data/entities/story_model.dart';

class HelperUi {
  static void showUpperSheetModal(BuildContext context, List<Widget> children,
      {Function? reset, Function? confirm}) {
    showGeneralDialog(
      context: context,
      barrierDismissible: true,
      transitionDuration: const Duration(milliseconds: 500),
      barrierLabel: MaterialLocalizations.of(context).dialogLabel,
      barrierColor: Colors.black.withOpacity(0.5),
      pageBuilder: (context, _, __) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Flexible(
              fit: FlexFit.loose,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                color: Theme.of(context).dialogBackgroundColor,
                child: Material(
                  color: AppColors.transparent,
                  child: ListView(
                    shrinkWrap: true,
                    children: <Widget>[
                      SizedBox(
                        height: 15.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // Keep row for widget direction in en/ar
                          GestureDetector(
                            behavior: HitTestBehavior.opaque,
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: ArrowBackButtonWidget(
                              iconColor: Theme.of(context).iconTheme.color!,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 30.h,
                      ),
                      for (Widget child in children) child,
                      Row(
                        children: [
                          Expanded(
                            child: ButtonWidget(
                              backgroundColor: AppColors.transparent,
                              text: S.of(context).reset,
                              onPressed: () {
                                if (reset != null) {
                                  reset();
                                }
                                // Navigator.pop(context);
                              },
                              textStyle: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                              borderColor: Theme.of(context).iconTheme.color!,
                            ),
                          ),
                          SizedBox(
                            width: 30.w,
                          ),
                          Expanded(
                            child: ButtonWidget(
                              backgroundColor: AppColors.transparent,
                              text: S.of(context).confirm,
                              onPressed: () {
                                if (confirm != null) {
                                  confirm();
                                }
                                Navigator.pop(context);
                              },
                              textStyle: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                              borderColor: Theme.of(context).iconTheme.color!,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        );
      },
      transitionBuilder: (context, animation, secondaryAnimation, child) {
        return SlideTransition(
          position: CurvedAnimation(
            parent: animation,
            curve: Curves.easeOut,
          ).drive(Tween<Offset>(
            begin: const Offset(0, -1.0),
            end: Offset.zero,
          )),
          child: child,
        );
      },
    );
  }

  static List<T> runFilter<T>(String text, List<T> allResult) {
    List<T> results = [];
    if (text.isEmpty) {
      // if the search field is empty or only contains white-space, we'll display all users
      results = List.from(allResult);
    } else {
      results = allResult.where((user) {
        /// (*)
        // Story Model
        if (user is StoryModel) {
          return (user.title ?? defaultStr)
              .toLowerCase()
              .contains(text.toLowerCase());
        }

        // Not a ty[e on if condition on (*)
        return false;
      }).toList();
    }
    return results;
  }
}
