import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';

class MyResumePage extends StatefulWidget {
    MyResumePage({Key key, this.title}) : super(key: key);

    final String title;

    @override
    _MyResumePageState createState() => _MyResumePageState();
}

class _MyResumePageState extends State<MyResumePage> {

    Future<List<Experience>> _getExperiences() async {
        var data = await http.get("https://api.karrlein.com/resume/v1/experience/");
        var jsonData = json.decode(data.body);

        List<Experience> experiences = [];

        for(var u in jsonData) {
            Experience experience = Experience(u["role"], u["company"], u["city"], u["timeframe"]);

            experiences.add(experience);
        }
        return experiences;
    }

    @override
    Widget build(BuildContext context) {
        return Container(
            width: double.maxFinite,
            child: FutureBuilder(
                    future: _getExperiences(),
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                        if(snapshot.data == null) {
                            return Container(
                                    child: Center(
                                            child: Text("Loading..."),
                                    ),
                            );
                        } else {
                            return ListView.builder(
                                    shrinkWrap: true,
                                    itemCount: snapshot.data.length,
                                    itemBuilder: (BuildContext context, int index) {
                                        return Card(
                                          color: Theme.of(context).accentColor,
                                          elevation: 8.0,
                                          child: ListTile(
                                                leading: Container(
                                                  width: MediaQuery.of(context).size.width * 0.20,
                                                  child: Text(
                                                    snapshot.data[index].role,
                                                    style: TextStyle(color: Colors.white),
                                                    ),
                                                ),
                                                title: Text(
                                                  snapshot.data[index].company,
                                                  style: TextStyle(color: Colors.white),
                                                  ),
                                                subtitle: Text(
                                                    snapshot.data[index].timeframe,
                                                    style: TextStyle(color: Colors.white),
                                                  ),
                                          )
                                        );
                                    },
                            );
                        }
                    },
            ),
        );
    }
}

class Experience {
    final String role;
    final String company;
    final String city;
    final String timeframe;

    Experience(this.role, this.company, this.city, this.timeframe);
}
