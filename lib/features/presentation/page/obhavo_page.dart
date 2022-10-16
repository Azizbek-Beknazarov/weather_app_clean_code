import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ob_havo_app/features/presentation/bloc/obhavo_bloc.dart';
import 'package:ob_havo_app/features/presentation/widget/city_text_wdget.dart';
import 'package:ob_havo_app/features/presentation/widget/hourly_obhavo.dart';
import 'package:ob_havo_app/features/presentation/widget/temprature_widget.dart';

import '../widget/current_obhavo.dart';

class ObHavoPage extends StatefulWidget {
  @override
  _ObHavoPageState createState() => _ObHavoPageState();
}

class _ObHavoPageState extends State<ObHavoPage> {
  String _shaharNomi = '';
  final TextEditingController controllerShahar = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff030317),
      body: SingleChildScrollView(
        child: Column(children: [CurrentObHavo(),
          HourlyObHavo(),
        ],)
        // Container(
        //
        //   decoration: BoxDecoration(
        //
        //       image: DecorationImage(
        //     image: AssetImage('images/weather.jpg'),
        //     fit: BoxFit.cover,
        //   )),
        //   height: MediaQuery.of(context).size.height,
        //   width: MediaQuery.of(context).size.width,
        //
        //   child: Column(
        //     children: [
        //       Padding(
        //         padding: const EdgeInsets.all(8.0),
        //         child: TextField(
        //           decoration: InputDecoration(
        //             border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(60))),
        //             hintText: 'Shahar kiriting!',
        //             hintStyle: TextStyle(fontSize: 20.0, color: Colors.white),
        //           ),
        //           onSubmitted: (_) {
        //             searchShaharNomi();
        //           },
        //           controller: controllerShahar,
        //           onChanged: (value) {
        //             _shaharNomi = value;
        //           },
        //         ),
        //       ),
        //       Container(
        //         height: 100,
        //         width: 100,
        //         child: TextButton(
        //           child: Padding(
        //               padding: EdgeInsets.all(2),
        //               child: LayoutBuilder(builder: (context, constraints) {
        //                 return Icon(
        //                   Icons.search,
        //                   color: Colors.white,
        //                   size: constraints.biggest.height * 0.5,
        //                 );
        //               })),
        //           onPressed: () {
        //             searchShaharNomi();
        //           },
        //         ),
        //       ),
        //       BlocBuilder<ObHavoBloc, ObHavoState>(
        //         builder: (BuildContext context, state) {
        //           return getHaroratAndTavsif(state);
        //         },
        //       ),
        //       SizedBox(
        //         height: 12,
        //       ),
        //       // City Name
        //       BlocBuilder<ObHavoBloc, ObHavoState>(
        //         builder: (BuildContext context, state) {
        //           return getShaharNomi(state);
        //         },
        //       ),
        //     ],
        //   ),
        // ),
      ),
    );
  }

  @override
  void initState() {
    BlocProvider.of<ObHavoBloc>(context)
        .add(GetObHavoLocationEvent());
    super.initState();
  }

  Widget getHaroratAndTavsif(ObHavoState state) {
    if (state is InitialObHavo) {
      return HaroratText(
        tavsif: '',
        harorat: '',
      );
    } else if (state is ErrorObHavo) {
      return Text('Shahar topilmadi');
    } else if (state is LoadedObHavo) {
      return HaroratText(
        tavsif: state.obhavo.tavsif,
        harorat: state.obhavo.harorat.toString(),
      );
    } else if (state is LoadingObHavo) {
      return Center(
        child: CircularProgressIndicator(),
      );
    } else {
      return Text('Internet ulanmagan');
    }
  }

  Widget getShaharNomi(ObHavoState state) {
    if (state is InitialObHavo) {
      return ShaharWidget(shaharNomi: 'Loading...');
    } else if (state is ErrorObHavo) {
      return ShaharWidget(shaharNomi: '');
    } else if (state is LoadedObHavo) {
      return ShaharWidget(shaharNomi: state.obhavo.shaharNomi);
    } else if (state is LoadingObHavo) {
      return ShaharWidget(shaharNomi: '');
    } else {
      return Text("Internet ulanmagan");
    }
  }

  void searchShaharNomi() {
    controllerShahar.clear();
    FocusScope.of(context).requestFocus(new FocusNode());
    BlocProvider.of<ObHavoBloc>(context)
        .add(GetObHavoShaharNomiEvent(_shaharNomi));
  }
}
