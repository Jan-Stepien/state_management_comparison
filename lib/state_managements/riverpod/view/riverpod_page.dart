import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:products_repository/products_repository.dart';
import 'package:products_service/products_service.dart';
import 'package:state_comparison/common/common.dart';
import 'package:state_comparison/state_managements/riverpod/riverpod.dart';

final productsRepositoryProvider = Provider<SpecificProductsRepository>(
  (ref) => SpecificProductsRepository(
    service: SpecificProductsService(),
  ),
);

class RiverpodPage extends StatelessWidget {
  const RiverpodPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const ProviderScope(
      child: SharedNavigator(
        cartPage: RiverpodCart(),
        homePage: RiverpodHome(),
      ),
    );
  }
}
