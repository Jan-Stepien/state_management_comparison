import 'package:flutter/material.dart';
import 'package:products_repository/products_repository.dart';
import 'package:products_service/products_service.dart';
import 'package:provider/provider.dart';
import 'package:state_comparison/state_managements/state_managemenets.dart';

class ProviderPage extends StatefulWidget {
  const ProviderPage({super.key});

  @override
  State<ProviderPage> createState() => _ProviderPageState();
}

class _ProviderPageState extends State<ProviderPage> {
  @override
  Widget build(BuildContext context) {
    final navigator = Navigator.of(context);

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Cart()),
        Provider(
          create: (_) =>
              SpecificProductsRepository(service: SpecificProductsService()),
        ),
      ],
      child: Navigator(
        initialRoute: FeaturePages.main.name,
        onGenerateRoute: (settings) {
          if (settings.name == FeaturePages.cart.name) {
            return MaterialPageRoute(
              builder: (context) => const ProviderCart(),
              settings: settings,
            );
          } else if (settings.name == FeaturePages.main.name) {
            return MaterialPageRoute(
              builder: (context) => const ProviderHome(),
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
      ),
    );
  }
}

enum FeaturePages {
  cart,
  main,
}
