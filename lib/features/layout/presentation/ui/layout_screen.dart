import 'package:flutter/material.dart';

import '../../../home/presentation/ui/home_screen.dart';
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
        children: const [
          HomeScreen(),
          Center(
            child: Text('Result'),
          ),
          Center(
            child: Text('Profile'),
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
