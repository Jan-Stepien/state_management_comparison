import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:products_repository/products_repository.dart';
import 'package:products_service/products_service.dart';
import 'package:state_comparison/common/common.dart';
import 'package:state_comparison/state_managements/bloc/bloc.dart';

class BlocPage extends StatelessWidget {
  const BlocPage({super.key});

  @override
  Widget build(BuildContext context) {
    final productsService = SpecificProductsService();

    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<SpecificProductsRepository>(
          create: (_) => SpecificProductsRepository(
            service: productsService,
          ),
        ),
      ],
      child: MultiBlocProvider(
          providers: [
            BlocProvider<CartBloc>(
              create: (context) => CartBloc(),
            ),
          ],
          child: const SharedNavigator(
            cartPage: BlocCart(),
            homePage: BlocHome(),
          )),
    );
  }
}
