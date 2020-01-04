import 'dart:html' as html;
import 'package:flutter/material.dart';

import 'package:karrlein/responsive_widget.dart';
import 'package:karrlein/navbutton.dart';

class SocialInfo extends StatelessWidget {
  List<Widget> socialMediaWidgets() {
    return [
      NavButton(
        text: "LinkedIn",
        onPressed: () {
          html.window.open("https://linkedin.com/in/andré-karrlein-81879417a", "linkedin");
        },
        color: Colors.blue,
      ),
      NavButton(
        text: "Twitter",
        onPressed: () {
          html.window.open("https://twitter.com/rb_ak1", "Twitter");
        },
        color: Colors.blue,
      ),
      NavButton(
        text: "Github",
        onPressed: () {
          html.window.open("https://github.com/andre-karrlein", "Github");
        },
        color: Colors.blue,
      ),
    ];
  }

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
