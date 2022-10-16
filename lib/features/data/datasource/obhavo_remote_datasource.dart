import 'dart:convert';
import 'package:geolocator/geolocator.dart';
import 'package:ob_havo_app/core/error/exception.dart';
import 'package:ob_havo_app/features/data/model/obhavo_model.dart';
import 'package:http/http.dart' as http;
import 'package:ob_havo_app/core/util/constants.dart' as con;

abstract class ObHavoRemoteDataSource {
  Future<ObHavoModel> getObhavoShaharNomiDatasourse(String shaharNomi);

  Future<ObHavoModel> getObhavoLocationDatasourse();
}

//

class ObHavoRemoteDataSourceImple implements ObHavoRemoteDataSource {
  http.Client client;
  Geolocator geolocator;

  ObHavoRemoteDataSourceImple({required this.client, required this.geolocator});

  @override
  Future<ObHavoModel> getObhavoShaharNomiDatasourse(String shaharNomi) async {
    String link = con.Constants.obhavoUrl +
        'q=$shaharNomi' +
        '&appid=${con.Constants.apiKey}' +
        con.Constants.units;
    print('Link: $link');
    final response = await client
        .get(Uri.parse(link), headers: {'Content-Type': 'application/json'});
    if (response.statusCode == 200) {
      print('response code: ${response.body}');
      return ObHavoModel.fromJson(jsonDecode(response.body));
    } else {
      throw ServerException();
    }
  }

  @override
  Future<ObHavoModel> getObhavoLocationDatasourse() async {
    if (!await Geolocator.isLocationServiceEnabled()) {
      throw LocationDisabledException();
    }
    //
    LocationPermission permission;
    permission = await Geolocator.requestPermission();
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.low);
//
    double lon = position.longitude;
    double lat = position.latitude;
//
    String link = con.Constants.obhavoUrl +
        'lat=$lat&' +
        'lon=$lon' +
        '&appid=${con.Constants.apiKey}' +
        con.Constants.units;
print(link);
    //
    final response = await client.get(
        Uri.parse(
          link,
        ),
        headers: {'Content-Type': 'application/json'});
    if(response.statusCode==200){
      print(response.body);
      return ObHavoModel.fromJson(jsonDecode(response.body));
    }else{
     throw ServerException();
    }
  }
}
