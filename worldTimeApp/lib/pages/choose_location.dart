import 'package:flutter/material.dart';

class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  int counter = 0;
  @override
  void initState() {
    super.initState();
    print("This is init function");
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
        body: RaisedButton(
          onPressed: () {
            setState() {
              counter += 1;
            }

            print('${counter}');
          },
          child: Text("Click me"),
        ));
  }
}
