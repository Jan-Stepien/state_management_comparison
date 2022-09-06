import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:state_comparison/app/app.dart';

class AppHome extends StatelessWidget {
  const AppHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SharedDrawer(
        drawerItems: drawerItems,
      ),
      appBar: const SharedAppBar(title: 'Home page'),
      body: const Center(child: Text('Home page')),
    );
  }
}
