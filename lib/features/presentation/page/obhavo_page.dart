import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ob_havo_app/features/presentation/bloc/obhavo_bloc.dart';

import '../widget/Container.dart';
import '../widget/city_text_wdget.dart';
import '../widget/error_widget.dart';
import '../widget/loading_widget.dart';
import '../widget/temprature_widget.dart';

class ObHavoPage extends StatefulWidget {
  @override
  _ObHavoPageState createState() => _ObHavoPageState();
}

class _ObHavoPageState extends State<ObHavoPage> {

  String cityName='rom';
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: Text('Ob Havo'),),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('images/moon.png'),
                  fit: BoxFit.cover,
                )),
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            // color: Colors.black12,
            child: Column(children: [
             TextField(
               onSubmitted: (_) {
                 searchCityName();
               },
               controller: controller,
               onChanged: (value) {
                 cityName = value;
                 print(cityName.toString());
               },
             ),
            Container(
              height: 100,
              width: 100,
              // height: SizeConfig.blockHeight * 17,
              // width: SizeConfig.blockWidth * 18,
              // decoration: BoxDecoration(
              //   // color: kSearchColor,
              //   borderRadius: BorderRadius.only(
              //     bottomLeft: Radius.circular(85),
              //   ),
              // ),
              child: FlatButton(
                child: Padding(
                    padding: EdgeInsets.all(2),
                    child: LayoutBuilder(builder: (context, constraints) {
                      return Icon(
                        Icons.search,
                        color: Colors.white,
                        size: constraints.biggest.height * 0.5,
                      );
                    })),
                onPressed: () {
                  searchCityName();
                },
                // shape: RoundedRectangleBorder(
                //   borderRadius: BorderRadius.only(
                //     bottomLeft: Radius.circular(85),
                //   ),
                // ),
              ),
            ),
            BlocBuilder<ObHavoBloc, ObHavoState>(
              builder: (BuildContext context, state) {
                return getTemperatureAndDescription(state);
              },
            ),
            SizedBox(
              height: 12,
            ),
            // City Name
            BlocBuilder<ObHavoBloc, ObHavoState>(
              builder: (BuildContext context, state) {
                return getCityName(state);
              },
            ),
          ],),),
        ),
      ),
      // body: buildBody(),
      // body: GestureDetector(
      //   onTap: () => FocusScope.of(context).requestFocus(new FocusNode()),
      //   child: buildBody(),
      // ),
    );
  }

  @override
  void initState() {
    // BlocProvider.of<ObHavoBloc>(context)
    //     .add(GetWeatherByLocation());
    BlocProvider.of<ObHavoBloc>(context)
    .add(GetObHavoShaharNomiEvent('samarkand'));
    super.initState();
  }

  SingleChildScrollView buildBody() {
    return SingleChildScrollView(
      // Continer to make a backroungImage
      child: Container(
        color: Colors.yellow,
        // width: MediaQuery.of(context).size.width,
        // height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage('images/moon.png'),
          fit: BoxFit.cover,
        )),
        // constraints: BoxConstraints.expand(),
        child: buildSafeArea(),
      ),
    );
  }

  SafeArea buildSafeArea() {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              UpperContiner(),
            ],
          ),
          // Temperature and Description
          BlocBuilder<ObHavoBloc, ObHavoState>(
            builder: (BuildContext context, state) {
              return getTemperatureAndDescription(state);
            },
          ),
          SizedBox(
            height: 12,
          ),
          // City Name
          BlocBuilder<ObHavoBloc, ObHavoState>(
            builder: (BuildContext context, state) {
              return getCityName(state);
            },
          ),
          SizedBox(height: 3,
              // height: SizeConfig.blockHeight * 4,
              ),
          // My location Method
          // BottomButton(),
        ],
      ),
    );
  }

  Widget getTemperatureAndDescription(ObHavoState state) {
    if (state is InitialObHavo) {
      return TempratureText(
        description: 'ggg',
        temperature: 'ttt',
        temprature: '2',
      );
    } else if (state is ErrorObHavo) {
      return ErrorsWidget(message: state.errorXabar);
    } else if (state is LoadedObHavo) {
      return TempratureText(
        description: state.obhavo.tavsif,
        temperature: state.obhavo.harorat.toString(),
        temprature: '1',
      );
    } else if (state is LoadingObHavo) {
      return Center(child: CircularProgressIndicator(),);
    } else {
      return ErrorsWidget(message: "Un expected Error");
    }
  }

  Widget getCityName(ObHavoState state) {
    if (state is InitialObHavo) {
      return CityWidget(cityName: 'Tashkent');
    } else if (state is ErrorObHavo) {
      return CityWidget(cityName: '');
    } else if (state is LoadedObHavo) {
      return CityWidget(cityName: state.obhavo.shaharNomi);
    } else if (state is LoadingObHavo) {
      return CityWidget(cityName: '');
    } else {
      return ErrorsWidget(message: "Un expected Error");
    }
  }
  void searchCityName() {
    controller.clear();
    FocusScope.of(context).requestFocus(new FocusNode());
    BlocProvider.of<ObHavoBloc>(context)
        .add(GetObHavoShaharNomiEvent(cityName));

  }
}
