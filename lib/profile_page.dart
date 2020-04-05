import 'package:url_launcher/url_launcher.dart';
import 'package:universal_html/html.dart' as html;
import 'package:flutter/foundation.dart';

import 'package:flutter/material.dart';

import 'package:karrlein/responsive_widget.dart';
import 'package:karrlein/navbutton.dart';
import 'package:karrlein/navheader.dart';
import 'package:karrlein/socialinfo.dart';
import 'package:karrlein/profile.dart';
import 'package:karrlein/resume.dart';

class ProfilePage extends StatelessWidget {

    void openLink(String url, String target) async {
        if(kIsWeb) {
            html.window.open(url, target);
        } else {
            if(await canLaunch(url)) {
                launch(url);
            }
        }
    }

    const ProfilePage({Key key}) : super(key: key);

    List<Widget> navButtons(BuildContext context) => [
        /*Padding(
            padding: EdgeInsets.all(2.0),
            child: NavButton(
                text: "about me",
                onPressed: () {
                    createDialog(context, "About me", "TODO");
                },
            ),
        ),*/
        Padding(
            padding: EdgeInsets.all(2.0),
            child: NavButton(
                text: "resume",
                onPressed: () {
                    createResumeDialog(context);
                },
            ),
        ),
        Padding(
            padding: EdgeInsets.all(2.0),
            child: NavButton(
                text: "contact",
                onPressed: () {
                    openLink("mailto:andre@karrlein.com", "_self");
                },
            ),
        ),
      ];

    createResumeDialog(BuildContext context) {
        return showDialog(context: context, builder: (context) {
            return AlertDialog(
                title: Text("Resume"),
                content: MyResumePage(),
                actions: <Widget>[
                    NavButton(
                        text: "close",
                        onPressed: () {
                            Navigator.of(context).pop();
                        },
                        color: Colors.redAccent,
                    )
                ],
            );
        });
    }
    createDialog(BuildContext context, String title, String content) {
        return showDialog(context: context, builder: (context) {
            return AlertDialog(
                title: Text(title),
                content: Text(content),
                actions: <Widget>[
                    NavButton(
                        text: "close",
                        onPressed: () {
                            Navigator.of(context).pop();
                        },
                        color: Colors.redAccent,
                    )
                ],
            );
        });
    }

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
							children: <Widget>[
                                new UserAccountsDrawerHeader(
                                    accountName: new Text("André Karrlein"),
                                    accountEmail: new Text("andre@karrlein.com"),
                                    currentAccountPicture: new CircleAvatar(backgroundImage: new AssetImage('assets/images/me.png')),
                                    arrowColor: Theme.of(context).backgroundColor,
                                    onDetailsPressed: () {},
                                ),
                                ...navButtons(context),
                                Divider(
                                    height: 2.0,
                                ),
                                ...SocialInfo().socialMediaWidgets()
                            ]
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
									NavHeader(navButtons: navButtons(context)),
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
