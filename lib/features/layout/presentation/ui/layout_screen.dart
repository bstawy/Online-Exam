import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/caching/tokens_manager.dart';
import '../../../../core/extensions/navigation_ext.dart';
import '../../../../core/service_locator/service_locator.dart';
import '../../../authentication/presentation/login/ui/pages/login_page.dart';
import '../../../subjects/presentation/cubit/subjects_cubit.dart';
import '../../../subjects/presentation/ui/pages/subjects_page.dart';
import 'widgets/bottom_nav_bar.dart';

class LayoutScreen extends StatefulWidget {
  static const String routeName = '/layout';
  const LayoutScreen({super.key});

  @override
  State<LayoutScreen> createState() => _LayoutScreenState();
}

class _LayoutScreenState extends State<LayoutScreen> {
  late final PageController _pageController;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _animateToPage(int index) {
    _currentIndex = index;

    _pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: (value) => setState(() => _currentIndex = value),
        children: [
          BlocProvider<SubjectsCubit>(
            create: (context) => getIt<SubjectsCubit>()..getAllSubjects(),
            child: const SubjectsPage(),
          ),
          const Center(
            child: Text('Result'),
          ),
          Center(
            child: ElevatedButton(
                onPressed: () async {
                  await TokensManager.deleteToken();
                  context.pushNamedAndRemoveUntil(
                    LoginPage.routeName,
                    predicate: (_) => false,
                  );
                },
                child: const Text('Logout')),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavBar(
        currentIndex: _currentIndex,
        animateToPage: _animateToPage,
      ),
    );
  }
}
