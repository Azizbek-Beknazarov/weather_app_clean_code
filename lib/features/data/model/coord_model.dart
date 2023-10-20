import 'package:ob_havo_app/features/domain/entity/obhavo_entity.dart';

class CoordModel extends Coord {
  CoordModel({required double lon, required double lat})
      : super(lon: lon, lat: lat);

  factory CoordModel.fromJson(Map<String, dynamic> json) {
    return CoordModel(
        lon: json['lon'].toDouble(),
        lat: json['lat'].toDouble()); //xato bolishi mumkin
  }

// Map<String, dynamic> toJson() {
//   final Map<String, dynamic> data = new Map<String, dynamic>();
//   data['lon'] = this.lon;
//   data['lat'] = this.lat;
//   return data;
// }
}
