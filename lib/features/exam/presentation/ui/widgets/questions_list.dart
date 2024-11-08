import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../../../core/theme/colors_manager.dart';
import '../../../../authentication/presentation/widgets/custom_button.dart';
import '../../../domain/entities/question_entity.dart';
import '../../cubit/exam_cubit.dart';
import 'question_item.dart';

class QuestionsList extends StatefulWidget {
  final List<Question> questions;

  const QuestionsList({super.key, required this.questions});

  @override
  State<QuestionsList> createState() => _QuestionsListState();
}

class _QuestionsListState extends State<QuestionsList> {
  late final PageController _pageController;
  int currentPageIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: currentPageIndex);
  }

  void onPageChanged(int index) {
    setState(() {
      currentPageIndex = index;
    });
  }

  void _nextPage() {
    _pageController.nextPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeIn,
    );
  }

  void _previousPage() {
    _pageController.previousPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeIn,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BlocBuilder<ExamCubit, ExamState>(
          buildWhen: (previous, current) =>
              current is ExamLoaded || current is QuestionChanged,
          builder: (context, state) {
            return Text(
                "Question ${currentPageIndex + 1} of ${widget.questions.length}");
          },
        ),
        Gap(8.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Stack(
            children: [
              Container(
                width: 1.sw,
                height: 5.h,
                decoration: BoxDecoration(
                  color: ColorsManager.lighterGrey.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(50.r),
                ),
                child: const SizedBox(),
              ),
              Container(
                width: ((1.sw - 32.w) / widget.questions.length) *
                    (currentPageIndex + 1),
                height: 5.h,
                decoration: BoxDecoration(
                  color: ColorsManager.blue,
                  borderRadius: BorderRadius.circular(50.r),
                ),
              ),
            ],
          ),
        ),
        Gap(24.h),
        SizedBox(
          height: 0.7.sh,
          child: PageView.builder(
            controller: _pageController,
            onPageChanged: (value) {
              onPageChanged(value);
            },
            physics: const NeverScrollableScrollPhysics(),
            itemCount: context.read<ExamCubit>().questions.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: QuestionItem(
                  context.read<ExamCubit>().questions[index],
                ),
              );
            },
          ),
        ),
        Gap(16.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: CustomButton(
                  onPressed: () {
                    if (currentPageIndex > 0) {
                      context.read<ExamCubit>().previousQuestion();
                      _previousPage();
                    }
                  },
                  borderRadius: 10.r,
                  color: ColorsManager.lightWhite,
                  textColor: ColorsManager.blue,
                  text: 'Back',
                ),
              ),
              Gap(16.w),
              Expanded(
                child: CustomButton(
                  onPressed: () {
                    if (currentPageIndex <
                        context.read<ExamCubit>().questions.length - 1) {
                      context.read<ExamCubit>().nextQuestion();
                      _nextPage();
                    } else {
                      context.read<ExamCubit>().submitAnswers();
                    }
                  },
                  borderRadius: 10.r,
                  text: 'Next',
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
