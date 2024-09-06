import 'package:english_words/english_words.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('test1'),),
        body: MyBody(),
      ),
    );
  }
}

class MyBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MyBody1();
  }
}

class MyBody1 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyBodyState1();
  }
}

class MyBodyState1 extends State<MyBody1> {
  @override
  Widget build(BuildContext context) {
    var wordPair = WordPair.random();
    return Center(
      child: Column(
        children: [
          Text('${wordPair.first} , ${wordPair.second}'),
          ElevatedButton(onPressed: (){
            setState(() {

            });
          }, child: Text('바꾸기'))
        ],
      ),
    );
  }
}