import 'dart:convert';
import 'package:ob_havo_app/core/error/exception.dart';
import 'package:ob_havo_app/features/data/model/obhavo_model.dart';
import 'package:http/http.dart' as http;

abstract class ObHavoRemoteDataSource {
  Future<ObHavoModel> getObhavoShaharNomiDatasourse(String shaharNomi);
}

//
const String apiKey = '9cfa3dd1b766c77679f13a1dc437c15b';
const String obhavoUrl = 'http://api.openweathermap.org/data/2.5/weather?';
const String units = '&units=metric';

class ObHavoRemoteDataSourceImple implements ObHavoRemoteDataSource {
  http.Client client;

  ObHavoRemoteDataSourceImple({required this.client});

  @override
  Future<ObHavoModel> getObhavoShaharNomiDatasourse(String shaharNomi)async {
    String link = obhavoUrl + 'q=$shaharNomi' + '&appid=$apiKey' + units;
    print('Link: $link');
    final response=await client.get(Uri.parse(link),headers: {'Content-Type': 'application/json'});
    if (response.statusCode == 200) {
      print('response code: ${response.body}');
      return ObHavoModel.fromJson(jsonDecode(response.body));
    } else {
      throw  ServerException();
    }
  }
}
