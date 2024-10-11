import 'package:flutter/widgets.dart';

extension Navigation on BuildContext {
  Future<dynamic> pushWithAnimation(Widget screen, {Object? arguments}) {
    return Navigator.of(this).push(
      PageRouteBuilder(
        pageBuilder: (ctx0, animation, secondaryAnimation) => screen,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          const double begin = 0.0;
          const double end = 1.0;
          const curve = Curves.easeInOut;
          var tween = Tween<double>(begin: begin, end: end)
              .chain(CurveTween(curve: curve));
          return FadeTransition(
            opacity: animation.drive(tween),
            child: child,
          );
        },
      ),
    );
  }

  Future<dynamic> pushNamed(String routeName, {Object? arguments}) {
    return Navigator.of(this).pushNamed(routeName, arguments: arguments);
  }

  Future<dynamic> pushReplacementNamed(String routeName,
      {Object? arguments, bool navigateWithNavBar = false}) {
    return Navigator.of(this, rootNavigator: !navigateWithNavBar)
        .pushReplacementNamed(routeName, arguments: arguments);
  }

  Future<dynamic> pushNamedAndRemoveUntil(String routeName,
      {Object? arguments,
      required RoutePredicate predicate,
      bool navigateWithNavBar = false}) {
    return Navigator.of(this, rootNavigator: !navigateWithNavBar)
        .pushNamedAndRemoveUntil(routeName, predicate, arguments: arguments);
  }

  void pop() => Navigator.of(this, rootNavigator: true).pop();

  void popUntil(String routeName, {bool navigateWithNavBar = false}) =>
      Navigator.of(this, rootNavigator: !navigateWithNavBar)
          .popUntil(ModalRoute.withName(routeName));
}
