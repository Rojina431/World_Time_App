import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};

  @override
  Widget build(BuildContext context) {
    data = ModalRoute.of(context).settings.arguments;

    String bgImage = data['isDaytime'] ? 'day.webp' : 'night.webp';
    //Color bgColor = data['isDaytime'] ? Colors.blue : Colors.blue[800];
    return Scaffold(
      // backgroundColor: bgColor,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/$bgImage'), fit: BoxFit.cover),
        ),
        child: Padding(
          padding: EdgeInsets.fromLTRB(0, 20.0, 0.0, 0),
          child: Center(
            child: Column(
              children: [
                FlatButton.icon(
                  onPressed: () {
                    Navigator.pushNamed(context, '/location');
                  },
                  icon: Icon(
                    Icons.edit_location,
                    color: Colors.grey,
                  ),
                  label: Text(
                    'Edit location',
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ),
                Text(
                  data['location'],
                  style: TextStyle(
                    fontSize: 40.0,
                    letterSpacing: 1.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 10.0),
                Text(
                  data['time'],
                  style: TextStyle(
                    fontSize: 30.0,
                    letterSpacing: 1.0,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
