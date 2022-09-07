import 'package:flutter/material.dart';

class SharedNavigator extends StatelessWidget {
  const SharedNavigator({
    super.key,
    required this.homePage,
    required this.cartPage,
  });

  final Widget homePage;
  final Widget cartPage;

  @override
  Widget build(BuildContext context) {
    final navigator = Navigator.of(context);
    return Navigator(
      initialRoute: FeaturePages.main.name,
      onGenerateRoute: (settings) {
        if (settings.name == FeaturePages.cart.name) {
          return MaterialPageRoute(
            builder: (context) => cartPage,
            settings: settings,
          );
        } else if (settings.name == FeaturePages.main.name) {
          return MaterialPageRoute(
            builder: (context) => homePage,
            settings: settings,
          );
        } else {
          navigator.pushReplacementNamed(settings.name ?? '');
          return MaterialPageRoute(
            builder: (context) => const SizedBox(),
            settings: settings,
          );
        }
      },
    );
  }
}

enum FeaturePages {
  cart,
  main,
}
