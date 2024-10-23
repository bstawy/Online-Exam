import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:online_exam/features/subjects/presentation/exams/ui/exams_page.dart';

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
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ExamsPage(subject: subject),
          ),
        );
      },
      child: Container(
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
            subject.iconUrl != null && subject.iconUrl!.isNotEmpty
                ? Image.network(
                    subject.iconUrl!,
                    width: 48.w,
                    height: 48.h,
                    fit: BoxFit.contain,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        width: 48.w,
                        height: 48.h,
                        decoration: BoxDecoration(
                          color: ColorsManager.blue.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                        child: Icon(
                          Icons.subject,
                          color: ColorsManager.blue,
                          size: 24.r,
                        ),
                      );
                    },
                  )
                : Container(
                    width: 48.w,
                    height: 48.h,
                    decoration: BoxDecoration(
                      color: ColorsManager.blue.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    child: Icon(
                      Icons.subject,
                      color: ColorsManager.blue,
                      size: 24.r,
                    ),
                  ),
            Gap(8.w),
            Expanded(
              child: Text(
                subject.name ?? '',
                style: TextStyles.font16BlackRegular,
              ),
            ),
            Icon(
              Icons.arrow_forward_ios,
              color: ColorsManager.grey,
              size: 16.r,
            ),
          ],
        ),
      ),
    );
  }
}