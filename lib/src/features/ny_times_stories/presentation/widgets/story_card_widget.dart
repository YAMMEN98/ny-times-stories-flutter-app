import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ny_times_stories_app_flutter/src/core/common_feature/presentation/widgets/cached_image_widget.dart';
import 'package:ny_times_stories_app_flutter/src/core/util/helper/helper.dart';

import '../../../../core/styles/app_colors.dart';

class StoryCardWidget extends StatefulWidget {

  const StoryCardWidget({Key? key,})
      : super(key: key);

  @override
  State<StoryCardWidget> createState() => _StoryCardWidgetState();
}

class _StoryCardWidgetState extends State<StoryCardWidget> {
  String? smallImageUrl;
  String? bigImageUrl;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 15.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Circle Avatar
          if (smallImageUrl != null) ...{
            Hero(
              tag: bigImageUrl!,
              child: GestureDetector(
                onTap: () {
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
                  imageUrl: smallImageUrl!,
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
                  "Title",
                  style: Theme.of(context).textTheme.headlineMedium,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  softWrap: true,
                ),

                // Space
                SizedBox(
                  height: Helper.getVerticalSpace() * 2,
                ),

                Text(
                  "Body",
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
                  "Author",
                  style: Theme.of(context)
                      .textTheme
                      .titleSmall!
                      .copyWith(color: AppColors.darkGray),
                  textAlign: TextAlign.end,
                ),
              ],
            ),
          ),

          // Space
          SizedBox(
            width: Helper.getVerticalSpace(),
          ),

        ],
      ),
    );
  }
}
