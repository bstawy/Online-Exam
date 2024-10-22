import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../../../core/theme/colors_manager.dart';
import '../../../../../core/theme/font_weight_helper.dart';
import '../../../../../core/theme/text_styles.dart';
import '../../cubit/subjects_cubit.dart';
import '../widgets/subjects_list.dart';

class SubjectsPage extends StatelessWidget {
  static const String routeName = '/home';
  const SubjectsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Survey'),
        titleTextStyle: TextStyle(
          color: ColorsManager.blue,
          fontSize: 20.sp,
          fontWeight: FontWeightHelper.medium,
        ),
        forceMaterialTransparency: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Search',
                    hintStyle: TextStyles.font14GreyMedium,
                    prefixIcon: const Icon(
                      Icons.search,
                      color: ColorsManager.grey,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.r),
                      borderSide: const BorderSide(
                        color: ColorsManager.grey,
                      ),
                    ),
                  ),
                ),
                Gap(40.h),
                Text(
                  "Browse by subject",
                  style: TextStyles.font18BlackMedium,
                ),
                Gap(16.h),
              ],
            ),
          ),
          BlocBuilder<SubjectsCubit, SubjectsState>(
            bloc: context.read<SubjectsCubit>(),
            builder: (context, state) {
              if (state is SubjectsLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is SubjectsError) {
                return Center(
                  child: Text(state.errorModel.message ?? ''),
                );
              } else if (state is SubjectsLoaded) {
                return SubjectsList(subjects: state.subjects);
              } else {
                return const SizedBox();
              }
            },
          ),
        ],
      ),
    );
  }
}
