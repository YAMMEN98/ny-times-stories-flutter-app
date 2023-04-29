import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ny_times_stories_app_flutter/src/core/common_feature/presentation/widgets/cached_image_widget.dart';
import 'package:ny_times_stories_app_flutter/src/core/styles/app_colors.dart';
import 'package:ny_times_stories_app_flutter/src/core/util/constant/app_constants.dart';
import 'package:ny_times_stories_app_flutter/src/core/util/helper/helper.dart';
import 'package:ny_times_stories_app_flutter/src/features/ny_times_stories/data/entities/story_model.dart';

class StoryCardListItemWidget extends StatefulWidget {
  final StoryModel model;

  const StoryCardListItemWidget({Key? key, required this.model})
      : super(key: key);

  @override
  State<StoryCardListItemWidget> createState() =>
      _StoryCardListItemWidgetState();
}

class _StoryCardListItemWidgetState extends State<StoryCardListItemWidget> {
  String? smallImageUrl;
  String? bigImageUrl;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // I put it here because it is not updated when apply search because they don't enter the initState again
    // so I should but it here to update it when chane list item

    // Check if somethings happened and do not return media
    // If everything seems to be in order we will display the image
    // else display placeholder instead

    // Small image for view and zoom it
    if (widget.model.multimedia != null &&
        widget.model.multimedia!.isNotEmpty) {
      smallImageUrl = widget.model.multimedia!.last.url;
    }

    // Big image for view and zoom it
    if (widget.model.multimedia != null &&
        widget.model.multimedia!.isNotEmpty) {
      bigImageUrl = widget.model.multimedia!.first.url;
    }

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 15.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Circle Avatar
          if (bigImageUrl != null) ...{
            Hero(
              tag: bigImageUrl!,
              child: GestureDetector(
                onTap: () {
                  FocusManager.instance.primaryFocus?.unfocus();
                  Navigator.pushNamed(
                    context,
                    "/photo_view_page",
                    arguments: {
                      "path": bigImageUrl!,
                      "fromNet": true,
                    },
                  );
                },
                child: CachedImageWidget(
                  imageUrl: bigImageUrl!,
                  radius: 200,
                  width: 70.sp,
                ),
              ),
            )
          } else ...{
            SizedBox(
              width: 70.sp,
              child: CircleAvatar(
                backgroundColor: AppColors.gray,
                radius: 40,
              ),
            )
          },

          // Space
          SizedBox(
            width: Helper.getVerticalSpace(),
          ),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Title
                Text(
                  _getTitle(),
                  style: Theme.of(context).textTheme.headlineMedium,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  softWrap: true,
                ),

                // Space
                SizedBox(
                  height: Helper.getVerticalSpace(),
                ),

                Text(
                  _getAbstract(),
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(color: AppColors.darkGray),
                ),

                // Space
                SizedBox(
                  height: 5.h,
                ),

                // Author
                Text(
                  _getAuthor(),
                  style: Theme.of(context)
                      .textTheme
                      .titleSmall!
                      .copyWith(color: AppColors.darkGray),
                  softWrap: true,
                ),
              ],
            ),
          ),

          // Space
          SizedBox(
            width: Helper.getVerticalSpace(),
          ),

          // Arrow icon
          IconButton(
            padding: EdgeInsets.zero,
            constraints: BoxConstraints(),
            onPressed: () {
              Navigator.pushNamed(
                context,
                "/story_details_page",
                arguments: widget.model,
              );
            },
            icon: Icon(
              Icons.arrow_forward_ios_rounded,
              size: 20.sp,
            ),
          )
        ],
      ),
    );
  }

  // Title
  String _getTitle() {
    if (widget.model.title != null && widget.model.title!.isNotEmpty) {
      return widget.model.title!;
    } else {
      return defaultStr;
    }
  }

  // Title
  String _getAbstract() {
    if (widget.model.title != null && widget.model.title!.isNotEmpty) {
      return widget.model.title!;
    } else {
      return defaultStr;
    }
  }

  // Author
  String _getAuthor() {
    if (widget.model.byline != null && widget.model.byline!.isNotEmpty) {
      return widget.model.byline!;
    } else {
      return defaultStr;
    }
  }
}
