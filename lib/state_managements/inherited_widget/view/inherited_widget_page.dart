import 'package:flutter/material.dart';
import 'package:state_comparison/common/common.dart';
import 'package:state_comparison/state_managements/inherited_widget/inherited_widget.dart';

class InheritedWidgetPage extends StatelessWidget {
  const InheritedWidgetPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const CartStateWidget(
        child: SharedNavigator(
      cartPage: InheritedWidgetCart(),
      homePage: InheritedWidgetHome(),
    ));
  }
}
