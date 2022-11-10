import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_glow/flutter_glow.dart';
import 'package:ob_havo_app/features/presentation/bloc/obhavo_bloc.dart';
import 'package:ob_havo_app/features/presentation/widget/extra_obhavo.dart';

class CurrentObHavo extends StatelessWidget {
  CurrentObHavo({Key? key}) : super(key: key);

  String _shaharNomi = '';
  final TextEditingController controllerShahar = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ObHavoBloc, ObHavoState>(builder: (ctx, state) {
      if (state is LoadedObHavo) {
        String iconPath = 'images/sunny.png';
        switch (state.obhavo.icon) {
          case '01d':
            iconPath = 'images/clear_day.png';
            break;
          case '01n':
            iconPath = 'images/clear_night.png';
            break;
          case '02d':
            iconPath = 'images/few_clouds_d.png';
            break;
          case '02n':
            iconPath = 'images/few_clouds_n.png';
            break;
          case '03d':
            iconPath = 'images/scattered_clouds_d.png';
            break;
          case '03n':
            iconPath = 'images/scattered_clouds_n.png';
            break;
          case '04d':
            iconPath = 'images/broken_clouds.png';
            break;
          case '04n':
            iconPath = 'images/broken_clouds.png';
            break;
          case '09d':
            iconPath = 'images/shower_rain.png';
            break;
          case '09n':
            iconPath = 'images/shower_rain.png';
            break;
          case '10d':
            iconPath = 'images/shower_rain.png';
            break;
          case '10n':
            iconPath = 'images/shower_rain.png';
            break;
          case '11d':
            iconPath = 'images/thunderstorm.png';
            break;
          case '11n':
            iconPath = 'images/thunderstorm.png';
            break;
          case '13d':
            iconPath = 'images/snow2.png';
            break;
          case '13n':
            iconPath = 'images/snow2.png';
            break;
          case '50d':
            iconPath = 'images/mist.png';
            break;
          case '50n':
            iconPath = 'images/mist.png';
            break;
          default:
            iconPath='images/sunny.png';
        }
        return GlowContainer(
          height: MediaQuery.of(context).size.height - 140,
          margin: EdgeInsets.all(2),
          padding: EdgeInsets.only(top: 50, left: 30, right: 30),
          glowColor: Color(0xff00A1FF).withOpacity(0.5),
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(60),
              bottomRight: Radius.circular(60)),
          color: Color(0xff00A1FF),
          spreadRadius: 9,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    color: Colors.white,
                    icon: Icon(CupertinoIcons.search),
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (ctx) {
                            Size size = MediaQuery.of(context).size;
                            return Scaffold(
                              body: Container(
                                height: size.height - 250,
                                width: size.width,
                                child: Padding(
                                  padding: const EdgeInsets.all(28.0),
                                  child: Column(
                                    children: [
                                      TextField(
                                        decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(60))),
                                          hintText: 'Shahar kiriting!',
                                          hintStyle: TextStyle(
                                              fontSize: 20.0,
                                              color: Colors.black),
                                        ),
                                        onSubmitted: (_) {
                                          searchShaharNomi(context);
                                        },
                                        controller: controllerShahar,
                                        onChanged: (value) {
                                          _shaharNomi = value;
                                        },
                                        style: TextStyle(color: Colors.black),
                                        cursorColor: Colors.blue,
                                      ),
                                      TextButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                            searchShaharNomi(context);
                                          },
                                          child: Text('Izlash')),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          });
                    },
                  ),
                  Row(
                    children: [
                      Icon(CupertinoIcons.map_fill, color: Colors.white),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        state.obhavo.name,
                        // ("${state.obhavo.coord.lat.round().toString()} / ${state.obhavo.coord.lon.round().toString()}"),
                        // state.obhavo.shaharNomi,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 30),
                      )
                    ],
                  ),
                  IconButton(onPressed: (){

                  }, icon: Icon(Icons.settings,color: Colors.white,))
                ],
              ),
              Container(
                height: 390,
                child: Stack(
                  children: [
                    Container(
                      child: Image.asset(
                        (iconPath),
                      ),
                    ),
                    Positioned(
                        bottom: 0,
                        left: 0,
                        right: 0,
                        child: Center(
                            child: Column(
                          children: [
                            GlowText(
                              "${state.obhavo.main.temp.round().toString()}\u00B0",
                              style: TextStyle(
                                  height: 0.1,
                                  fontSize: 150,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(state.obhavo.mainD,
                                style: TextStyle(
                                  fontSize: 25,
                                )),
                            Text(state.obhavo.date.toString(),

                                style: TextStyle(
                                  fontSize: 18,
                                ))
                          ],
                        )))
                  ],
                ),
              ),
              Divider(
                thickness: 1,
                color: Colors.white,
              ),
              SizedBox(
                height: 10,
              ),
              ExtraObHavo(),
            ],
          ),
        );
      }
      return Container(
        child: Center(
          child: CircularProgressIndicator(),
        ),
      );
    });
  }

  //

  // Widget getShaharNomi(ObHavoState state) {
  //   if (state is InitialObHavo) {
  //     return ShaharWidget(shaharNomi: 'Loading...');
  //   } else if (state is ErrorObHavo) {
  //     return ShaharWidget(shaharNomi: '');
  //   } else
  //   //   if (state is LoadedObHavo) {
  //   //   return ShaharWidget(shaharNomi: state.obhavo.shaharNomi);
  //   // } else
  //   if (state is LoadingObHavo) {
  //     return ShaharWidget(shaharNomi: '');
  //   } else {
  //     return Text("Internet ulanmagan");
  //   }
  // }

  void searchShaharNomi(BuildContext context) {
    controllerShahar.clear();
    FocusScope.of(context).requestFocus(new FocusNode());
    BlocProvider.of<ObHavoBloc>(context)
        .add(GetObHavoShaharNomiEvent(_shaharNomi));
  }
}
