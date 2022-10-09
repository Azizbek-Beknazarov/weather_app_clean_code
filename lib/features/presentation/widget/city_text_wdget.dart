import 'package:flutter/material.dart';

class ShaharWidget extends StatelessWidget {
  final String shaharNomi;

  ShaharWidget({required this.shaharNomi});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.all(11),
        child: FittedBox(
            child: Text(shaharNomi == '' ? ' ' : shaharNomi,
                style: TextStyle(
                  fontSize: 22,
                  color: Colors.white,
                ))),
      ),
    );
  }
}
