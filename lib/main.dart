import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

main() {
  runApp(MyWidget());
}

class MyWidget extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('test UI'),),
        body: Center(
          child: Row(
            children: [
              IconButton(onPressed: (){}, icon: Icon(Icons.check_box, size: 20,)),
              Text('Disable')
            ],
          ),
        ),
      ),
    );
  }
}
