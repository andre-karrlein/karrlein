import 'dart:html' as html;
import 'package:flutter/material.dart';

import 'package:karrlein/responsive_widget.dart';
import 'package:karrlein/navbutton.dart';
import 'package:karrlein/navheader.dart';
import 'package:karrlein/socialinfo.dart';
import 'package:karrlein/profile.dart';

class ProfilePage extends StatelessWidget {
    const ProfilePage({Key key}) : super(key: key);

    List<Widget> navButtons() => [
        NavButton(
          text: "about",
          onPressed: () {
            html.window.open("/", "Ak");
          },
        ),
        NavButton(
          text: "work",
          onPressed: () {
            html.window.open("/", "Ak");
          },
        ),
        NavButton(
          text: "contact",
          onPressed: () {
            html.window.open("/", "Ak");
          },
        ),
      ];

    @override
    Widget build(BuildContext context) {
        return ResponsiveWidget(
            largeScreen: Scaffold(
                backgroundColor: Theme.of(context).backgroundColor,
                appBar: AppBar(
                    elevation: 0.0,
                    backgroundColor: Theme.of(context).backgroundColor,
                    iconTheme: Theme.of(context).iconTheme,
                ),
                drawer: ResponsiveWidget.isSmallScreen(context)
					? Drawer(
						child: ListView(
							padding: const EdgeInsets.all(20),
							children: navButtons(),
                        ),
                    )
                    : null,
                body: SingleChildScrollView(
                    child: AnimatedPadding(
                        duration: Duration(seconds: 1),
                        padding: EdgeInsets.all(MediaQuery.of(context).size.height * 0.1),
                        child: ResponsiveWidget(
                            largeScreen: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
									NavHeader(navButtons: navButtons()),
                                    SizedBox(
                                        height: MediaQuery.of(context).size.height * 0.1,
                                    ),
                                    Profile(),
                                    SizedBox(
                                        height: MediaQuery.of(context).size.height * 0.2,
                                    ),
                                    SocialInfo(),
                                ],
                            ),
                        ),
                    ),
                ),
            ),
        );
    }
}
