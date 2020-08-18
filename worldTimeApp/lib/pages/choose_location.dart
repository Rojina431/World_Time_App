import 'package:flutter/material.dart';

class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  int counter = 0;

  void getData() async {
    String name = await Future.delayed(Duration(seconds: 3), () {
      return 'Rojina';
    });

    String clz = await Future.delayed(Duration(seconds: 2), () {
      return 'Wrc';
    });

    print('$name - $clz');
  }

  @override
  void initState() {
    super.initState();
    print("This is init function");
    getData();
    print('Hello');
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
