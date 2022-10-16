import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_glow/flutter_glow.dart';
import 'package:ob_havo_app/features/presentation/bloc/obhavo_bloc.dart';
import 'package:ob_havo_app/features/presentation/widget/extra_obhavo.dart';

class CurrentObHavo extends StatelessWidget {
  const CurrentObHavo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GlowContainer(
      height: MediaQuery.of(context).size.height - 140,
      margin: EdgeInsets.all(2),
      padding: EdgeInsets.only(top: 50, left: 30, right: 30),
      glowColor: Color(0xff00A1FF).withOpacity(0.5),
      borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(60), bottomRight: Radius.circular(60)),
      color: Color(0xff00A1FF),
      spreadRadius: 9,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(
                CupertinoIcons.square_grid_2x2,
                color: Colors.white,
              ),
              Row(
                children: [
                  Icon(CupertinoIcons.map_fill, color: Colors.white),
                  SizedBox(
                    width: 5,
                  ),
                  BlocBuilder<ObHavoBloc, ObHavoState>(
                      builder: (context, state) {
                    if (state is LoadedObHavo) {
                      return Text(
                        state.obhavo.shaharNomi,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 30),
                      );
                    }
                    return Text(
                      'Ulanish yo\'q',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                    );
                  })
                ],
              ),
              Icon(Icons.more_vert, color: Colors.white)
            ],
          ),
          Container(
            margin: EdgeInsets.only(top: 10),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                border: Border.all(width: 0.2, color: Colors.white),
                borderRadius: BorderRadius.circular(30)),
            child: Text(
              "Yangilash",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            height: 390,
            child: Stack(
              children: [
                Image(
                  image: AssetImage('images/thunder.png'),
                  fit: BoxFit.fill,
                ),
                Positioned(

                  bottom: 0,
                  right: 0,
                  left: 0,
                  child: Center(
                      child: Column(
                    children: [
                      BlocBuilder<ObHavoBloc, ObHavoState>(
                          builder: (context, state) {
                        if (state is LoadedObHavo) {
                          return GlowText(
                            state.obhavo.harorat.toString(),
                            style: TextStyle(
                                height: 0.1,
                                fontSize: 150,
                                fontWeight: FontWeight.bold),
                          );
                        }
                        return Center(child: CircularProgressIndicator(backgroundColor: Colors.red),);
                      }),
                      BlocBuilder<ObHavoBloc,ObHavoState>(builder: (context,state){
                        if(state is LoadedObHavo){
                          return Text(state.obhavo.tavsif,
                              style: TextStyle(
                                fontSize: 25,
                              ));
                        }
                        return Text('',
                            // currentTemp.name,
                            style: TextStyle(
                              fontSize: 25,
                            ));
                      }),

                      Text('day',
                          // currentTemp.day,
                          style: TextStyle(
                            fontSize: 18,
                          ))
                    ],
                  )),
                )
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
           BlocBuilder<ObHavoBloc,ObHavoState>(builder: (context,state){
             if(state is LoadedObHavo){
               return ExtraObHavo(state);
             }
             return Center(child: CircularProgressIndicator(),);
           }),

        ],
      ),
    );
  }
// Widget getShaharNomi(ObHavoState state) {
//   if (state is InitialObHavo) {
//     return ShaharWidget(shaharNomi: 'Loading...');
//   } else if (state is ErrorObHavo) {
//     return ShaharWidget(shaharNomi: '');
//   } else if (state is LoadedObHavo) {
//     return ShaharWidget(shaharNomi: state.obhavo.shaharNomi);
//   } else if (state is LoadingObHavo) {
//     return ShaharWidget(shaharNomi: '');
//   } else {
//     return Text("Internet ulanmagan");
//   }
// }
}
