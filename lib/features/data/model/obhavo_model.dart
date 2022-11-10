import 'package:flutter/cupertino.dart';
import 'package:ob_havo_app/features/data/model/coord_model.dart';
import 'package:ob_havo_app/features/data/model/main_model.dart';

import 'package:ob_havo_app/features/domain/entity/obhavo_entity.dart';
import 'package:weather_icons/weather_icons.dart';

class ObHavoModel extends ObHavoEntity {
  ObHavoModel(
      {required Coord coord,
      required Main main,
      required double windSpeed,
      required int visibility,
      required String icon,
      required String mainD,
      required String name, required DateTime date})
      : super(
            coord: coord,
            main: main,
            windSpeed: windSpeed,
            visibility: visibility,
            mainD: mainD,
            icon: icon,
            name: name,
  date: date);

  factory ObHavoModel.fromJson(Map<String, dynamic> json) {
    return ObHavoModel(
        coord: json['coord'] != null
            ? new CoordModel.fromJson(json['coord'])
            : null as CoordModel,
        main: json['main'] != null
            ? new MainModel.fromJson(json['main'])
            : null as MainModel,
        windSpeed: json['wind']['speed'].toDouble(),
        visibility: json['visibility'],
        mainD: json['weather'][0]['main'],
        icon: json['weather'][0]['icon'],
        name: json['name'],
        date: DateTime.fromMillisecondsSinceEpoch(
            json['dt'] * 1000,
            isUtc: false)
    );
  }

}
