import 'package:equatable/equatable.dart';

class ObHavoEntity extends Equatable {
  final Coord coord;
  final String mainD;
  final String icon;
  final Main main;
  final double windSpeed;
  final int visibility;
  final String name;
  final DateTime date;

  ObHavoEntity(
      {required this.coord,
      required this.main,
      required this.windSpeed,
      required this.mainD,
      required this.icon,
      required this.visibility,
      required this.name,
      required this.date});

  @override
  List<Object?> get props =>
      [coord, main, windSpeed, visibility, mainD, icon, name,date];
}
//

//done
class Coord {
  final double lon;
  final double lat;

  const Coord({required this.lon, required this.lat});
}

class Weather {
  late String main;
  late String description;
  late String icon;

  Weather({
    required this.main,
    required this.description,
    required this.icon,
  });
}

//done
class Main {
  final double temp;
  final double pressure;
  final double humidity;

  Main({
    required this.temp,
    required this.pressure,
    required this.humidity,
  });
}

class Sys {
  final String country;
  final int sunrise;
  final int sunset;

  Sys({required this.country, required this.sunrise, required this.sunset});
}
