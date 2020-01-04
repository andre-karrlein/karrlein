import 'package:flutter/material.dart';

class AkDot extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
        return Row(
            children: <Widget>[
                Text(
                    "AK",
                    textScaleFactor: 3,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                    ),
                ),
                SizedBox(
                    width: 10,
                ),
                AnimatedContainer(
                    duration: Duration(seconds: 1),
                    height: 15,
                    width: 15,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.blue,
                    ),
                )
            ],
        );
    }
}
