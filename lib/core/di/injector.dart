import 'package:get_it/get_it.dart';
import 'package:piccolina_restaurant_app/app/presentation/pages/catalogue/catalogue_view_model.dart';
import 'package:piccolina_restaurant_app/app/presentation/pages/login/login_view_model.dart';
import 'package:piccolina_restaurant_app/app/presentation/pages/product-detail/product_detail_view_model.dart';
import 'package:piccolina_restaurant_app/app/presentation/pages/registration/registration_view_model.dart';
import 'package:piccolina_restaurant_app/core/services/auth_service.dart';
import 'package:piccolina_restaurant_app/core/services/category_service.dart';
import 'package:piccolina_restaurant_app/core/services/order_service.dart';
import 'package:piccolina_restaurant_app/core/services/product_service.dart';

final inject = GetIt.I;
void setupInjection() {
  inject
    ..registerLazySingleton(() => CatalogueViewModel())
    ..registerLazySingleton(() => ProductDetailViewModel())
    ..registerLazySingleton(() => LoginViewModel())
    ..registerLazySingleton(() => RegistrationViewModel())
    ..registerLazySingleton(() => AuthService())
    ..registerLazySingleton(() => CategoryService())
    ..registerLazySingleton(() => OrderService())
    ..registerLazySingleton(() => ProductService());
}
