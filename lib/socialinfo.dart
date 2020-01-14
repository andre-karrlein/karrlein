import 'package:url_launcher/url_launcher.dart';
import 'package:universal_html/html.dart' as html;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:karrlein/responsive_widget.dart';
import 'package:karrlein/navbutton.dart';

class SocialInfo extends StatelessWidget {

    void openLink(String url, String target) async {
        if(kIsWeb) {
            html.window.open(url, target);
        } else {
            if(await canLaunch(url)) {
                launch(url);
            }
        }
    }


    List<Widget> socialMediaWidgets() => [
        Padding(
            padding: EdgeInsets.all(5.0),
            child: NavButton(
                text: "LinkedIn",
                onPressed: () {
                    openLink("https://linkedin.com/in/andré-karrlein-81879417a", "_blank");
                },
                color: Colors.blue,
            ),
        ),
        Padding(
            padding: EdgeInsets.all(5.0),
            child: NavButton(
                text: "Twitter",
                onPressed: () {
                    openLink("https://twitter.com/rb_ak1", "_blank");
                },
                color: Colors.blue,
            ),
        ),
        Padding(
            padding: EdgeInsets.all(5.0),
            child: NavButton(
                text: "Github",
                onPressed: () {
                    openLink("https://github.com/andre-karrlein", "_blank");
                },
                color: Colors.blue,
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
        children: ResponsiveWidget.isSmallScreen(context) ? <Widget>[copyRightText()] : <Widget>[
          ...socialMediaWidgets(),
          copyRightText(),
        ],
      ),
    );
  }
}
