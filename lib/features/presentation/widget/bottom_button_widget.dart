import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ob_havo_app/features/presentation/bloc/obhavo_bloc.dart';
class BottomButton extends StatelessWidget {
  static String cityName = 'shs';
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          height: 200,
          child: MaterialButton(
            color: Colors.green,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(60),
                topRight: Radius.circular(60),
              ),
            ),
            minWidth: 50,
            child: Text(
              'My Weather',
            ),
            onPressed: () {
              //  BlocProvider.of<ObHavoBloc>(context)
              // .add(GetWeatherByLocation());
            },
          ),
        ),
      ),
    );
  }
}
