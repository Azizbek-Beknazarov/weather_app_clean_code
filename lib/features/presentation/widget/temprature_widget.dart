import 'package:flutter/material.dart';
class TempratureText extends StatelessWidget {
  final String temperature;
  final String description;

  TempratureText({required this.temperature,
    required this.description, required String temprature});
  @override
  Widget build(BuildContext context) {
    return Container(
      // height: SizeConfig.blockHeight * 15,
      child: Padding(
        padding: EdgeInsets.all(2),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: <Widget>[
                Text(
                  temperature,
                  // style: kTemperatureTextStyle,
                ),
                Text(
                  temperature == '' ? '' : ' \u2103',
                  // style: kDgreeTextStyle,
                ),
              ],
            ),
            Text(description,),
          ],
        ),
      ),
    );
  }
}
