import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../domain/entities/subject_entity.dart';
import 'subjects_list_item.dart';

class SubjectsList extends StatelessWidget {
  final List<Subject> subjects;
  const SubjectsList({
    super.key,
    required this.subjects,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
        itemCount: subjects.length,
        itemBuilder: (context, index) {
          return SubjectsListItem(subject: subjects[index]);
        },
      ),
    );
  }
}
