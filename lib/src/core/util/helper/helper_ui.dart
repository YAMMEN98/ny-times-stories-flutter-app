import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ny_times_stories_app_flutter/generated/l10n.dart';
import 'package:ny_times_stories_app_flutter/src/core/common_feature/data/entities/language_enum.dart';
import 'package:ny_times_stories_app_flutter/src/core/common_feature/presentation/widgets/arrow_back_button_widget.dart';
import 'package:ny_times_stories_app_flutter/src/core/common_feature/presentation/widgets/button_widget.dart';
import 'package:ny_times_stories_app_flutter/src/core/styles/app_colors.dart';
import 'package:ny_times_stories_app_flutter/src/core/util/constant/app_constants.dart';

import '../../common_feature/data/data_sources/app_shared_prefs.dart';
import '../injections.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

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
                          GestureDetector(
                            behavior: HitTestBehavior.opaque,
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: ArrowBackButtonWidget(
                              iconColor: Theme.of(context).iconTheme.color!,
                            ),
                          ),
                          GestureDetector(
                            behavior: HitTestBehavior.opaque,
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Icon(
                              Icons.filter_alt,
                              color: Theme.of(context).iconTheme.color,
                              size: 30.h,
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
                              text: "reset",
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
                              text: "confirm",
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
}
