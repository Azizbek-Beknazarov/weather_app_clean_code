import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ob_havo_app/features/presentation/bloc/obhavo_bloc.dart';

class ExtraObHavo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ObHavoBloc, ObHavoState>(builder: (ctx, state) {
      if (state is LoadedObHavo) {
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
                Text(
                  state.obhavo.windSpeed.round().toString() + " m/s",
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Shamol",
                  style: TextStyle(color: Colors.black54, fontSize: 16),
                )
              ],
            ),
            Column(
              children: [
                Image(
                  image: AssetImage('images/humidity.png'),
                  width: 30,
                  height: 30,
                  color: Colors.white,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  state.obhavo.main.humidity.round().toString() + " %",
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Namlik",
                  style: TextStyle(color: Colors.black54, fontSize: 16),
                )
              ],
            ),
            Column(
              children: [
                Icon(
                  Icons.visibility,
                  color: Colors.white,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  ((state.obhavo.visibility) / 1000).round().toString() + " km",
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Ko\'rish\nmasofasi",
                  style: TextStyle(
                      color: Colors.black54,
                      fontSize: 10,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Column(
              children: [
                Image(
                  image: AssetImage('images/icon_airpressure.png'),
                  width: 25,
                  height: 25,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  state.obhavo.main.pressure.round().toString() + " hPa",
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Bosim",
                  style: TextStyle(color: Colors.black54, fontSize: 16),
                ),
              ],
            ),
          ],
        );
      }
      return Container(
        child: Center(
          child: Text('error bloc builder'),
        ),
      );
    });
  }
}
