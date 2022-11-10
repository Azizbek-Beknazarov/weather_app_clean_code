import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ob_havo_app/features/presentation/bloc/obhavo_bloc.dart';

import 'package:ob_havo_app/features/presentation/widget/hourly_obhavo.dart';

import '../widget/current_obhavo.dart';

class ObHavoPage extends StatefulWidget {
  @override
  _ObHavoPageState createState() => _ObHavoPageState();
}

class _ObHavoPageState extends State<ObHavoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff030317),
      body: RefreshIndicator(
        onRefresh: () {
          return refresh();
        },
        child: SingleChildScrollView(
            child: Column(
          children: [
            CurrentObHavo(),
             HourlyObHavo(),
          ],
        )),
      ),
    );
  }

  @override
  void initState() {
    BlocProvider.of<ObHavoBloc>(context).add(GetObHavoLocationEvent());
    super.initState();
  }

  Future<void> refresh() {
    return Future(() =>
        BlocProvider.of<ObHavoBloc>(context).add(GetObHavoLocationEvent()));
  }
}
