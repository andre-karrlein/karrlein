import 'dart:html' as html;
import 'package:flutter/material.dart';

import 'package:karrlein/responsive_widget.dart';
import 'package:karrlein/navbutton.dart';

class SocialInfo extends StatelessWidget {
    List<Widget> socialMediaWidgets() => [
        Padding(
            padding: EdgeInsets.all(5.0),
            child: NavButton(
                text: "LinkedIn",
                onPressed: () {
                    html.window.open("https://linkedin.com/in/andré-karrlein-81879417a", "_blank");
                },
                color: Colors.orange,
            ),
        ),
        Padding(
            padding: EdgeInsets.all(5.0),
            child: NavButton(
                text: "Twitter",
                onPressed: () {
                    html.window.open("https://twitter.com/rb_ak1", "_blank");
                },
                color: Colors.orange,
            ),
        ),
        Padding(
            padding: EdgeInsets.all(5.0),
            child: NavButton(
                text: "Github",
                onPressed: () {
                    html.window.open("https://github.com/andre-karrlein", "_blank");
                },
                color: Colors.orange,
            ),
        ),
    ];

    Widget copyRightText() => Text(
        "André Karrlein ©️2020",
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.grey,
        ),
    );

  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(
      largeScreen: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: socialMediaWidgets(),
          ),
          copyRightText(),
        ],
      ),
      smallScreen: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          ...socialMediaWidgets(),
          copyRightText(),
        ],
      ),
    );
  }
}
