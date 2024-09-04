import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test2/ch9/test1.dart';

main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  String str = 'disable';
  bool check = true;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('test'),
        ),
        body: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center, // icon 버튼 text버튼 중앙
            children: [
              IconButton(
                  onPressed: () {
                    setState(() {
                       str = check ? 'enable': 'disable';
                    });
                      check = !check;
                  },
                  icon: check
                      ? Icon(Icons.check_box)
                      : Icon(Icons.check_box_outline_blank)),
              Text(str)
            ],
          ),
        ),
      ),
    );
  }
}
