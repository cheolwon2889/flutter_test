import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('test Asset'),
        ),
        body: Column(
          children: [
            Image.asset('images/renoir09.png'),
            Icon(Icons.alarm, size: 100, color: Colors.red,),
            FaIcon(FontAwesomeIcons.bell, size: 100,),
            // Image(
            //  image: NetworkImage(
            //      'https://docs.flutter.dev/assets/images/dash/dash-fainting.gif')
            // ),
            Text('Hello World',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                    color: Colors.red,
                    fontSize: 20,
                    height: 2,
                    backgroundColor: Colors.yellow,
                    decoration: TextDecoration.underline,
                    decorationColor: Colors.red,
                    decorationStyle: TextDecorationStyle.wavy))
          ],
        ),
      ),
    );
  }
}
