import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:state_comparison/common/common.dart';
import 'package:state_comparison/state_managements/redux/redux.dart';

class ReduxPage extends StatelessWidget {
  const ReduxPage({super.key});

  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
      store: store,
      child: const SharedNavigator(
        cartPage: ReduxCart(),
        homePage: ReduxHome(),
      ),
    );
  }
}
