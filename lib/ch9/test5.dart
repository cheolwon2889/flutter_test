import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test2/ch9/test1.dart';

main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("제스쳐 테스트"),
        ),
        body: Center( // Center 위젯으로 Column을 감쌉니다.
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, // 수직 중앙 정렬
            crossAxisAlignment: CrossAxisAlignment.center, // 수평 중앙 정렬
            children: [
              GestureDetector(
                child: Image.asset('images/renoir08.png'),
                onTap: () => {print('image click')},
                onVerticalDragStart: (details) {
                  print('vertical drag start...global position : ${details.globalPosition.dx} , ${details.globalPosition.dy}');
                  print('vertical drag start...local position : ${details.localPosition.dx} , ${details.localPosition.dy}');
                },
              ),
              SizedBox(height: 20), // 이미지와 버튼 사이에 간격 추가
              ElevatedButton(
                onPressed: () {print('ElevatedButton');},
                child: Text('Click Me....'),
                style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.red)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
