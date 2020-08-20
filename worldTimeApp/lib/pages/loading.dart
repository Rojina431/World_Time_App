import 'package:flutter/material.dart';
//import 'package:http/http.dart';
//import 'dart:convert';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:worldTimeApp/services/world_time.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  String time;

  void setupData() async {
    WorldTime instance = WorldTime(
        location: 'Berlin', flag: 'germany.png', url: 'Europe/Berlin');
    await instance.getTime();
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location': instance.location,
      'time': instance.time,
      'flag': instance.flag
    });
  }

  @override
  void initState() {
    super.initState();
    print("This is init function");
    setupData();
    print('Hello');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blueAccent,
        body: Center(
          child: SpinKitCircle(color: Colors.white, size: 50.0),
        ));
  }
}
