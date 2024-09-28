import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:teko_flutter/data/local/local_data_access.dart';
import 'package:teko_flutter/data/local/shared_preferences.dart';
import 'package:teko_flutter/view/product_manage/cubit/cubit.dart';

final getIt = GetIt.instance;

configureInjection() async {
  final sharedPref = await SharedPreferences.getInstance();

  // LocalDataAccess
  getIt.registerLazySingleton<LocalDataAccess>(
      () => SharedPrefHelper(sharedPref: sharedPref));

  getIt.registerLazySingleton(() => MyCubit());
}
