import 'dart:convert';


import 'package:ob_havo_app/core/util/constants.dart';
import 'package:ob_havo_app/features/data/model/obhavo_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class ObhavoLocalDatasource {
  Future<ObHavoModel> getOxirgiObhavo();

  Future<void> obhavoToCache(ObHavoModel obhavo);
}

class ObhavoLocalDatasourceImple
    // implements ObhavoLocalDatasource
{
  final SharedPreferences preferences;

  ObhavoLocalDatasourceImple({required this.preferences});

  // @override
  // Future<ObHavoModel> getOxirgiObhavo() {
  //   final jsonObhavo =
  //       preferences.getString(Constants.CACHED_OBHAVO_LIST);
  //   if (jsonObhavo!=null) {
  //     print('Get Obhavo from Cache: ${jsonObhavo.length}');
  //     return Future.value(ObHavoModel.fromJson(json.decode(jsonObhavo)));
  //   }else {
  //     // throw CacheException();
  //   }
  // }

  // @override
  // Future<void> obhavoToCache(ObHavoModel obhavo) {
  //  return preferences.setString(Constants.CACHED_OBHAVO_LIST, json.encode(obhavo.toJson()));
  // }
}
