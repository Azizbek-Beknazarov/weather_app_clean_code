import 'package:flutter/material.dart';

class CityWidget extends StatelessWidget {
  final String cityName;
  CityWidget({required this.cityName});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.all(3),
        child: FittedBox(
            child: Text(cityName == '' ? ' ' : cityName,
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.white,
                  // fontFamily: 'TitilliumWeb',
                ))),
      ),
    );
  }
}
