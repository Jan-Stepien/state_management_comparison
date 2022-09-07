import 'package:flutter/material.dart';
import 'package:products_repository/products_repository.dart';
import 'package:products_service/products_service.dart';
import 'package:provider/provider.dart';
import 'package:state_comparison/common/common.dart';
import 'package:state_comparison/state_managements/state_managemenets.dart';

class ProviderPage extends StatelessWidget {
  const ProviderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => Cart()),
          Provider(
            create: (_) => SpecificProductsRepository(
              service: SpecificProductsService(),
            ),
          ),
        ],
        child: const SharedNavigator(
          cartPage: ProviderCart(),
          homePage: ProviderHome(),
        ));
  }
}
