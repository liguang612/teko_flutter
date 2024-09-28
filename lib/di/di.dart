import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:teko_flutter/data/mapper/product_page_mapper.dart';
import 'package:teko_flutter/data/repository/remote/product_repository.dart';
import 'package:teko_flutter/data/repository/remote/product_repository_impl.dart';
import 'package:teko_flutter/view/product_manage/cubit/product_cubit.dart';

final getIt = GetIt.instance;

configureInjection() {
  // Dio
  getIt.registerFactory(() => Dio());

  // Repository
  getIt.registerFactory<ProductRepository>(() => ProductRepositoryImpl());

  // Cubit
  getIt.registerLazySingleton(() => ProductCubit());

  // Mapper
  getIt.registerLazySingleton(() => ProductPageMapper());
}
