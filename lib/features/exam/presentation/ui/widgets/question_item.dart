import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/theme/colors_manager.dart';
import '../../../domain/entities/question_entity.dart';

class QuestionItem extends StatefulWidget {
  final Question question;

  const QuestionItem(this.question, {super.key});

  @override
  State<QuestionItem> createState() => _QuestionItemState();
}

class _QuestionItemState extends State<QuestionItem> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 16.w, horizontal: 8.h),
      decoration: BoxDecoration(
        color: ColorsManager.lightBlue,
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Row(
        children: [
          ListTile(
            title: Text(widget.question.question ?? ''),
            leading: Radio<bool>(
              value: isSelected,
              groupValue: true,
              onChanged: (value) {
                setState(() {
                  isSelected = value!;
                });
              },
            ),
          )
        ],
      ),
    );
  }
}
