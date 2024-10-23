import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../domain/entities/exam_entity.dart';
import '../../../../../domain/entities/subject_entity.dart';
import 'widgets/exam_list_item.dart';

class ExamsPage extends StatelessWidget {
  final Subject subject;

  const ExamsPage({
    super.key,
    required this.subject,
  });

  // Temporary mock data
  List<Exam> get _mockExams => [
        const Exam(
          level: 'High level',
          questionCount: 20,
          fromTime: 1.00,
          toTime: 6.00,
          durationMinutes: 30,
        ),
        const Exam(
          level: 'High level',
          questionCount: 20,
          fromTime: 1.00,
          toTime: 6.00,
          durationMinutes: 30,
        ),
        const Exam(
          level: 'High level',
          questionCount: 20,
          fromTime: 1.00,
          toTime: 6.00,
          durationMinutes: 30,
        ),
      ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(subject.name ?? ''),
      ),
      body: ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
        itemCount: _mockExams.length,
        itemBuilder: (context, index) {
          return ExamListItem(exam: _mockExams[index]);
        },
      ),
    );
  }
}
