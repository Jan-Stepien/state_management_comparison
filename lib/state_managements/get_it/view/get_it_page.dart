import 'package:flutter/material.dart';
import 'package:state_comparison/common/common.dart';
import 'package:state_comparison/state_managements/get_it/get_it.dart';

class GetItPage extends StatelessWidget {
  const GetItPage({super.key});

  @override
  Widget build(BuildContext context) {
    setupGetIt();

    return SharedNavigator(
      cartPage: GetItCart(),
      homePage: GetItHome(),
    );
  }
}
