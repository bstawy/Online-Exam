import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../../../core/theme/colors_manager.dart';
import '../../../../../core/theme/text_styles.dart';
import '../../../domain/entities/subject_entity.dart';

class SubjectsListItem extends StatelessWidget {
  final Subject subject;

  const SubjectsListItem({
    super.key,
    required this.subject,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16.h),
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
      decoration: BoxDecoration(
        color: ColorsManager.lightWhite,
        borderRadius: BorderRadius.circular(10.r),
        boxShadow: [
          BoxShadow(
            color: const Color(0xff2a2929).withOpacity(0.25),
            blurRadius: 8.r,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      alignment: Alignment.centerLeft,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.network(
            subject.iconUrl ?? '',
            width: 48.w,
            height: 48.h,
            fit: BoxFit.contain,
          ),
          Gap(8.w),
          Text(
            subject.name ?? '',
            style: TextStyles.font16BlackRegular,
          ),
        ],
      ),
    );
  }
}
