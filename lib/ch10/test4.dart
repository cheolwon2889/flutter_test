import 'package:flutter/material.dart';

main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: Text('test expanded'),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Row(
              children: [
                Image.asset(
                  'images/cupcake.jpg',
                  fit: BoxFit.cover,
                  width: 40,
                  height: 40,
                ),
                Image.asset(
                  'images/donut.jpg',
                  fit: BoxFit.cover,
                  width: 40,
                  height: 40,
                ),
                Image.asset(
                  'images/eclair.jpg',
                  fit: BoxFit.cover,
                  width: 40,
                  height: 40,
                ),
                Image.asset(
                  'images/froyo.jpg',
                  fit: BoxFit.cover,
                  width: 40,
                  height: 40,
                ),
                Spacer(),
                Image.asset(
                  'images/gingerbread.jpg',
                  fit: BoxFit.cover,
                  width: 40,
                  height: 40,
                ),
              ],
            ),
            MyBody(),
            MyBody2()
          ],
        ),
      ),
    ));
  }
}

class MyBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
            flex: 2,
            child: Container(
              color: Colors.red, height: 40,
              width: 50, // 필요없음
            )),
        Expanded(
            flex: 1,
            child: Container(
              color: Colors.green,
              height: 40,
              width: 50,
            )),
        Expanded(
            flex: 2,
            child: Container(
              color: Colors.yellow,
              height: 40,
              width: 50,
            ))
      ],
    );
  }
}

class MyBody2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          color: Colors.red,
          height: 300,
        ),
        Container(
          color: Colors.green,
          height: 300,
        ),
        Container(
          color: Colors.blue,
          height: 300,
        ),
      ],
    );
  }
}
