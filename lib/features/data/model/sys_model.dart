import 'package:ob_havo_app/features/domain/entity/obhavo_entity.dart';

class SysModel extends Sys {
  SysModel(
      {required super.country, required super.sunrise, required super.sunset});

  factory SysModel.fromJson(Map<String, dynamic> json) {
    return SysModel(
      country: json['country'],
      sunrise: DateTime.fromMillisecondsSinceEpoch(json['sunrise'] * 1000),
      sunset: DateTime.fromMillisecondsSinceEpoch(json['sunset'] * 1000),
    );
  }
// Map<String, dynamic> toJson() {
//   final Map<String, dynamic> data = new Map<String, dynamic>();
//   data['country'] = this.country;
//   data['sunrise'] = this.sunrise;
//   data['sunset'] = this.sunset;
//   return data;
// }
}
