import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ob_havo_app/features/presentation/bloc/obhavo_bloc.dart';
class UpperContiner extends StatefulWidget {
  @override
  _UpperContinerState createState() => _UpperContinerState();
}

class _UpperContinerState extends State<UpperContiner> {
   String cityName='rom';
  final TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        TextField(

          onSubmitted: (_) {
        searchCityName();
          },
          controller: controller,
          onChanged: (value) {
            cityName = value;
          },
          // style: kInputTextStyle,
          // decoration: kInputDecoration,
        ),
        Container(
          height: 50,
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
        )
      ],
    );
  }

  void searchCityName() {
    controller.clear();
    FocusScope.of(context).requestFocus(new FocusNode());
    BlocProvider.of<ObHavoBloc>(context)
        .add(GetObHavoShaharNomiEvent(cityName));
    
  }
}
