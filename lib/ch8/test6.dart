import 'package:flutter/material.dart';


main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('test'),),
        body: MyBody(),
      ),
    );
  }
}
class MyBody extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return MyBodyState();
  }
}

class MyBodyState extends State<MyBody> {
  List<Widget> widgetList = [
    // MyColorItemWidget(Colors.red),
    // MyColorItemWidget(Colors.blue)
    MyColorItemWidget1(Colors.red , key: UniqueKey()),
    MyColorItemWidget1(Colors.blue ,key: UniqueKey())
  ];

  onChange(){
    setState(() {
      widgetList.insert(1, widgetList.removeAt(0));
    });
  }
  @override
  Widget build(BuildContext context) {
    print('MyBodyState 빌드됨 ');
    return Column(
      children: [
        Row(children: widgetList,),
        ElevatedButton(onPressed: onChange, child: Text('toggle'))
      ],
    );
  }
}

class MyColorItemWidget extends StatelessWidget{
  Color color;
  MyColorItemWidget(this.color);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
          color: color,
          width: 150,
          height: 150,
        )
    );
  }
}

class MyColorItemWidget1 extends StatefulWidget {
  Color color;

  MyColorItemWidget1(this.color, {Key? key}) : super(key: key) ;

  @override
  State<StatefulWidget> createState() {
    return MyColorItemWidgetState1(color);
  }
}

class MyColorItemWidgetState1 extends State<MyColorItemWidget1>{
  Color color;

  MyColorItemWidgetState1(this.color);

  @override
  Widget build(BuildContext context) {
  print(this.color);
    return Expanded(
        child: Container(
          color: color,
          width: 140,
          height: 140,
        )
    );
  }
}





