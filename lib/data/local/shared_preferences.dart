import 'package:shared_preferences/shared_preferences.dart';
import 'package:teko_flutter/data/constants.dart';
import 'package:teko_flutter/data/local/local_data_access.dart';

class SharedPrefHelper implements LocalDataAccess {
  final SharedPreferences sharedPref;

  SharedPrefHelper({required this.sharedPref});

  @override
  int getThings() {
    return sharedPref.getInt(SharedPreferenceKey.thing) ?? 0;
  }
}
