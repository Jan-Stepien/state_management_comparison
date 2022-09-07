import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:state_comparison/app/app.dart';
import 'package:state_comparison/common/common.dart';

class SharedHomeScaffold extends StatelessWidget {
  const SharedHomeScaffold({
    super.key,
    required this.title,
    required this.body,
  });

  final String title;

  final Widget body;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SharedAppBar(
        title: title,
        cartRedirect: () =>
            Navigator.pushNamed(context, FeaturePages.cart.name),
      ),
      drawer: SharedDrawer(
        drawerItems: drawerItems,
      ),
      body: body,
    );
  }
}
