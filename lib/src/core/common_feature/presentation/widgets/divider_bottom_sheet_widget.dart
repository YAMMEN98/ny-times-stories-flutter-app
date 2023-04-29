import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stories_app_flutter/src/core/styles/app_colors.dart';

class DividerBottomSheetWidget extends StatelessWidget {
  final double? width;

  const DividerBottomSheetWidget({Key? key, this.width}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: 2.sp,
      decoration: BoxDecoration(
        color: AppColors.lightGray,
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }
}
