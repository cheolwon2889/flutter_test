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
          title: Text('입력 테스트'),
        ),
        body: MyBody(),
      ),
    );
  }
}

class MyBody extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyBodyState();
  }
}

class MyBodyState extends State<MyBody> {
  final controller = TextEditingController();
  int textCounter = 0;

  bool checkValue = true;

  String radioResultValue = 'android';

  double sliderValue = 0.0;

  bool switchValue = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller.addListener(() {
      setState(() {
        textCounter;
      });
      textCounter = controller.text.length;
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          textInputAction: TextInputAction.send,
          style: TextStyle(fontSize: 15),
          textAlign: TextAlign.center,
          controller: controller,
          decoration: InputDecoration(
              labelText: 'Name',
              prefixIcon: Icon(Icons.input),
              border: OutlineInputBorder(),
              hintText: 'Hint Text',
              helperText: '이름을 입력하세요.',
              counterText: "$textCounter characters"),
        ),
        ElevatedButton(
            onPressed: () {
              print('submit : ${controller.text} textCounter : $textCounter ,');
              controller.clear();
            },
            child: Text('submit')),
        Row(
          children: [
            Checkbox(
                value: checkValue,
                onChanged: (bool? value) {
                  setState(() {
                    checkValue = value ?? false;
                  });
                }),
            Text("check box value is $checkValue")
          ],
        ),
        Row(
          children: [
            Radio(
                value: 'android',
                groupValue: radioResultValue,
                onChanged: (String? value) {
                  setState(() {
                    radioResultValue = value ?? 'android';
                  });
                }),
            Text('android')
          ],
        ),
        Row(
          children: [
            Radio(
                value: 'ios',
                groupValue: radioResultValue,
                onChanged: (String? value) {
                  setState(() {
                    radioResultValue = value ?? 'ios';
                  });
                }),
            Text('ios')
          ],
        ),
        Text('선택된 결과는 $radioResultValue'),
        Slider(
            min: 0,
            max: 100,
            value: sliderValue,
            onChanged: (double value) {
              setState(() {
                sliderValue = value;
              });
            }),
        Text('slider value $sliderValue'),
        Switch(
            value: switchValue,
            onChanged: (bool value) {
              setState(() {
                switchValue = value;
              });
            }),
        Text('Switch value $switchValue'),
      ],
    );
  }
}
