import 'package:get_it/get_it.dart';
import 'package:products_repository/products_repository.dart';
import 'package:products_service/products_service.dart';
import 'package:state_comparison/state_managements/get_it/get_it.dart';

final getIt = GetIt.instance;

setupGetIt() {
  getIt.registerLazySingleton<SpecificProductsService>(
    () => SpecificProductsService(),
  );
  getIt.registerLazySingleton<SpecificProductsRepository>(
    () => SpecificProductsRepository(
      service: getIt<SpecificProductsService>(),
    ),
  );
  getIt.registerLazySingleton<Cart>(() => Cart());
  getIt.registerLazySingleton<Products>(
    () => Products(
      productsRepository: getIt<SpecificProductsRepository>(),
    ),
  );
}
