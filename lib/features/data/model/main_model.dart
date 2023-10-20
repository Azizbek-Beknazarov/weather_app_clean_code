import 'package:ob_havo_app/features/domain/entity/obhavo_entity.dart';

class MainModel extends Main {
  MainModel(
      {required super.temp, required super.pressure, required super.humidity});

  factory MainModel.fromJson(Map<String, dynamic> json) {
    return MainModel(
        temp: json['temp'].toDouble(),
        pressure: json['pressure'].toDouble(),
        humidity: json['humidity'].toDouble());
  }
// Map<String, dynamic> toJson() {
//   final Map<String, dynamic> data = new Map<String, dynamic>();
//   data['temp'] = this.temp;
//   data['pressure'] = this.pressure;
//   data['humidity'] = this.humidity;
//   return data;
// }
}
