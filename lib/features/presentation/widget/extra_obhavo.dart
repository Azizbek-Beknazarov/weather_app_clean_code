import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ob_havo_app/features/presentation/bloc/obhavo_bloc.dart';

class ExtraObHavo extends StatelessWidget {
  final ObHavoState temp;

  ExtraObHavo(this.temp);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Column(
          children: [
            Icon(
              CupertinoIcons.wind,
              color: Colors.white,
            ),
            SizedBox(
              height: 10,
            ),
            Text('34',
              // temp.obhavo.toString() + " Km/h",
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Wind",
              style: TextStyle(color: Colors.black54, fontSize: 16),
            )
          ],
        ),
        Column(
          children: [
            Icon(
              CupertinoIcons.wind,
              color: Colors.white,
            ),
            SizedBox(
              height: 10,
            ),
            Text('22',
              // temp.humidity.toString() + " %",
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Humidity",
              style: TextStyle(color: Colors.black54, fontSize: 16),
            )
          ],
        ),
        Column(
          children: [
            Icon(
              CupertinoIcons.wind,
              color: Colors.white,
            ),
            SizedBox(
              height: 10,
            ),
            Text('3 %',
              // temp.chanceRain.toString() + " %",
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Rain",
              style: TextStyle(color: Colors.black54, fontSize: 16),
            )
          ],
        )
      ],
    );
  }
}
