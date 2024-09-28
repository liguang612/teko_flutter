import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:teko_flutter/data/repository/local/local_data_access.dart';
import 'package:teko_flutter/data/repository/local/shared_preferences.dart';
import 'package:teko_flutter/view/product_manage/cubit/product_cubit.dart';

final getIt = GetIt.instance;

configureInjection() async {
  final sharedPref = await SharedPreferences.getInstance();

  // Dio
  getIt.registerFactory(() => Dio());

  // LocalDataAccess
  getIt.registerLazySingleton<LocalDataAccess>(
      () => SharedPrefHelper(sharedPref: sharedPref));

  getIt.registerLazySingleton(() => MyCubit());
}
