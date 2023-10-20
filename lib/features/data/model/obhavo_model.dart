import 'package:ob_havo_app/features/data/model/coord_model.dart';
import 'package:ob_havo_app/features/data/model/main_model.dart';
import 'package:ob_havo_app/features/data/model/sys_model.dart';
import 'package:ob_havo_app/features/domain/entity/obhavo_entity.dart';

class ObHavoModel extends ObHavoEntity {
  ObHavoModel(
      {required Coord coord,
      required Main main,
      required double windSpeed,
      required int visibility,
      required String icon,
      required String description,
      required String name,
      required DateTime date,
      required int cloudiness,
      required Sys sys,
      required double timezone})
      : super(
            coord: coord,
            main: main,
            windSpeed: windSpeed,
            visibility: visibility,
            description: description,
            icon: icon,
            name: name,
            date: date,
            cloudiness: cloudiness,
            sys: sys,
            timezone: timezone);

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
      description: json['weather'][0]['description'],
      icon: json['weather'][0]['icon'],
      name: json['name'],
      date:
          DateTime.fromMillisecondsSinceEpoch(json['dt'] * 1000, isUtc: false),
      cloudiness: json["clouds"]['all'],
      sys: json['sys'] != null
          ? new SysModel.fromJson(json['sys'])
          : null as SysModel,
      timezone: json['timezone'] / 3600.toDouble(),
    );
  }

// Map<String, dynamic> toJson() {
//   final Map<String, dynamic> data = new Map<String, dynamic>();
//   data['coord'] = this.coord;
//   data['main'] = this.main;
//   data['wind']['speed'] = this.windSpeed;
//   data['weather'][0]['description'] = this.description;
//   data['weather'][0]['icon'] = this.icon;
//   data['name'] = this.name;
//   data['dt'] = this.date;
//   data["clouds"]['all'] = this.cloudiness;
//   data["sys"] = this.sys;
//   data["timezone"] = this.timezone;
//   return data;
// }
}
