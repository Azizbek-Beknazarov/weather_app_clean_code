import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_glow/flutter_glow.dart';
import 'package:intl/intl.dart';
import 'package:ob_havo_app/features/presentation/bloc/obhavo_bloc.dart';
import 'package:ob_havo_app/features/presentation/widget/extra_obhavo.dart';

class CurrentObHavo extends StatelessWidget {
  CurrentObHavo({Key? key}) : super(key: key);

  final TextEditingController controllerShahar = TextEditingController();

  @override
  Widget build(BuildContext context) {
    String shaharNomi = '';

    return GlowContainer(
      height: MediaQuery.of(context).size.height - 140,
      margin: const EdgeInsets.all(2),
      padding: const EdgeInsets.only(top: 50, left: 30, right: 30),
      glowColor: const Color(0xff00A1FF).withOpacity(0.5),
      borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(60), bottomRight: Radius.circular(60)),
      color: const Color(0xff00A1FF),
      spreadRadius: 9,
      child: BlocBuilder<ObHavoBloc, ObHavoState>(builder: (context, state) {
        String iconPath = 'images/sunny.png';
        if (state is LoadedObHavo) {
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
              iconPath = 'images/sunny.png';
          }
          return Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    color: Colors.white,
                    icon: const Icon(CupertinoIcons.search),
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (ctx) {
                            Size size = MediaQuery.of(context).size;
                            return Scaffold(
                              body: SizedBox(
                                height: size.height - 250,
                                width: size.width,
                                child: Padding(
                                  padding: const EdgeInsets.all(28.0),
                                  child: Column(
                                    children: [
                                      TextField(
                                        decoration: const InputDecoration(
                                          border: OutlineInputBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(60))),
                                          hintText: 'Shaharni kiriting!',
                                          hintStyle: TextStyle(
                                              fontSize: 20.0,
                                              color: Colors.black),
                                        ),
                                        onSubmitted: (_) {
                                          searchShaharNomi(context, shaharNomi);
                                        },
                                        controller: controllerShahar,
                                        onChanged: (value) {
                                          shaharNomi = value;
                                        },
                                        style: const TextStyle(
                                            color: Colors.black),
                                        cursorColor: Colors.blue,
                                      ),
                                      TextButton(
                                          onPressed: () {
                                            searchShaharNomi(
                                                context, shaharNomi);
                                            Navigator.pop(context);
                                          },
                                          style: ButtonStyle(
                                              backgroundColor:
                                                  MaterialStateProperty.all(
                                                      Colors.blue)),
                                          child: const Text(
                                            'Izlash',
                                            style:
                                                TextStyle(color: Colors.white),
                                          )),
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
                      const Icon(CupertinoIcons.map_fill, color: Colors.white),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        state.obhavo.name,
                        // ("${state.obhavo.coord.lat.round().toString()} / ${state.obhavo.coord.lon.round().toString()}"),
                        // state.obhavo.shaharNomi,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 30),
                      )
                    ],
                  ),
                  IconButton(
                      onPressed: () {
                        BlocProvider.of<ObHavoBloc>(context)
                            .add(GetObHavoLocationEvent());
                      },
                      icon: const Icon(
                        Icons.update,
                        color: Colors.white,
                      ))
                ],
              ),
              Text(
                state.obhavo.sys.country,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
              ),
              SizedBox(
                height: 390,
                child: Stack(
                  children: [
                    Image.asset(
                      (iconPath),
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
                              style: const TextStyle(
                                  height: 0.1,
                                  fontSize: 150,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(state.obhavo.description,
                                style: const TextStyle(
                                  fontSize: 25,
                                )),
                            Text(
                              '${DateFormat.yMMMd().add_Hm().format(state.obhavo.date)} ',
                              style: const TextStyle(
                                fontSize: 18,
                              ),
                            ),
                          ],
                        )))
                  ],
                ),
              ),
              const Divider(
                thickness: 1,
                color: Colors.white,
              ),
              const SizedBox(
                height: 10,
              ),
              ExtraObHavo(),
            ],
          );
        }

        return const Center(
          child:
              CircularProgressIndicator.adaptive(backgroundColor: Colors.black),
        );
      }),
    );
  }

  void searchShaharNomi(BuildContext context, String shahar) {
    controllerShahar.clear();
    FocusScope.of(context).requestFocus(FocusNode());
    BlocProvider.of<ObHavoBloc>(context).add(GetObHavoShaharNomiEvent(shahar));
  }
}
