import 'package:flutter/material.dart';

class HaroratText extends StatelessWidget {
  final String harorat;
  final String tavsif;

  HaroratText({required this.harorat, required this.tavsif});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.all(21),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: <Widget>[
                Text(
                  harorat,
                ),
                Text(
                  harorat == '' ? '' : ' \u2103',
                ),
              ],
            ),
            Text(
              tavsif,
            ),
          ],
        ),
      ),
    );
  }
}
