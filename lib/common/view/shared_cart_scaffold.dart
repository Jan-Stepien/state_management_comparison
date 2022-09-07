import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:state_comparison/common/common.dart';

class SharedCartScaffold extends StatelessWidget {
  const SharedCartScaffold({
    super.key,
    required this.total,
    required this.body,
  });

  final String total;

  final Widget body;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SharedAppBar(
        title: total,
        cartRedirect: () =>
            Navigator.pushNamed(context, FeaturePages.cart.name),
      ),
      body: body,
    );
  }
}
