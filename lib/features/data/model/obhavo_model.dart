import 'package:ob_havo_app/features/domain/entity/obhavo_entity.dart';

class ObHavoModel extends ObHavoEntity {
  ObHavoModel(
      {required String shaharNomi,
      required int harorat,
      required String tavsif}):super(shaharNomi: shaharNomi,harorat: harorat,tavsif: tavsif);

  factory ObHavoModel.fromJson(Map<String, dynamic> json) {
    return ObHavoModel(
        shaharNomi: json['name'],
        harorat: (json['main']['temp'] as num).toInt(),
        tavsif: json['weather'][0]['description']);
  }

  Map<String, dynamic> toJson() {
    return ({
      'name': shaharNomi,
      'weather': [
        {'description': tavsif}
      ],
      'main': {'temp': harorat},
    });
  }
}
