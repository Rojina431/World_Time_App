import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  List location = [];

  String locations;
  String time;
  String url;
  bool isDaytime;
  Future getArea() async {
    try {
      // 1. Create a List of location

      Response response =
          await get('http://worldtimeapi.org/api/timezone.text');

      // 2. Decode the response body

      List responseData = jsonDecode(response.body);
      // 3. Iterate through all the users in the list
      responseData.forEach((userData) {
        // 4. Create a new user and add to the list
        location.add(userData);
      });
      print(location);
    } catch (error) {
      print(error);
    }
  }

  //updating time
  void updateTime(index) async {
    url = location[index];
    try {
      Response response =
          await get('http://worldtimeapi.org/api/timezone/$url');
      Map data = jsonDecode(response.body);

      String datetime = data['datetime'];
      String offset = data['utc_offset'].substring(1, 3);

      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset)));

      isDaytime = now.hour > 6 && now.hour < 18 ? true : false;
      time = DateFormat.jm().format(now);
      print(data);
      print(time);

      //Nvigating to home page
      Navigator.pop(context,
          {'location': location[index], 'time': time, 'isDaytime': isDaytime});
    } catch (error) {
      print(error);
    }
  }

  Widget projectWidget() {
    return FutureBuilder(
      builder: (context, projectSnap) {
        if (projectSnap.connectionState == ConnectionState.none &&
            projectSnap.hasData == false) {
          //print('project snapshot data is: ${projectSnap.data}');
          return Container();
        }

        return ListView.builder(
          itemCount: location.length,
          itemBuilder: (context, index) {
            // Widget to display the list of project
            return Card(
              child: ListTile(
                onTap: () {
                  print(location[index]);
                  updateTime(index);
                },
                title: Text(location[index]),
              ),
            );
          },
        );
      },
      future: getArea(),
    );
  }

  @override
  Widget build(BuildContext context) {
    print("This is build function");
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        backgroundColor: Colors.black38,
        title: Text('Choose a Location'),
        centerTitle: true,
      ),
      body: projectWidget(),
    );
  }
}
