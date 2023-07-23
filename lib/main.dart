
import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const FunnyQuotesApp());
}

class FunnyQuotesApp extends StatelessWidget {
  const FunnyQuotesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Funny Quotes',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightGreen),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
   static const List<String> _quoteList = [
    'ตัวผมเป็นยาดม ไม่เน้นชื่นชมแต่เน้นชื่นใจ',
    'โสดก็อ่อย ไม่สอยก็อด',
    'เด็กคืออนาคตของชาติ แต่ถ้าไม่มีอะไรผิดพลาด น้องก็น่าจะเป็นอนาคตของพี่',
    'ความสวยเราก็มี แต่ฝากไว้เกาหลี ยังไม่มีเวลาไปเอา',
    'รอเธอทักมา ก็เหมือนรอจินตราไว้ผมยาว',
    'อยากเป็นแว่นตาที่เธอใส่ ถึงแม้ไม่อยู่ในใจ แต่อยู่ในสายตา',
    'เธอชอบเขา แต่เรามันทะเล',
    'ชอบโดนเท เลยเซไปเรื่อยๆ',
    'เห็นป่า เห็นเขา เห็นใจเราบ้างรึยังนะ',
    'ไหล่โดนจอ หล่อโดนใจ',
  ];

  static const List _colorList = [
    Colors.blueGrey,
    Colors.indigo,
    Colors.pink,
    Colors.red,
    Colors.blue,
    Colors.green,
    Colors.orange,

  ];
  var _quote = _quoteList[0];
  var _colorRandom = _colorList[0];

  void _handleClickGo() {
    var rand = Random();
    String newQuote ;
    do{
      var randomIndex = rand.nextInt(_quoteList.length);
       newQuote = _quoteList[randomIndex];
    }while(newQuote == _quote);

    MaterialColor newColor;
    do{
      var randomIndex = rand.nextInt(_colorList.length);
       newColor = _colorList[randomIndex];
    }while(newColor == _colorRandom);
    setState(() {
      _quote = newQuote;
      _colorRandom = newColor;
    });
  }

  void _changeColor() {
    setState(() {
      var rand = Random();
      var randomIndex = rand.nextInt(_colorList.length);
      _colorRandom= _colorList[randomIndex];
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('คำคมกวนๆ')),
      floatingActionButton: FloatingActionButton(
        onPressed:(){
          _handleClickGo();
          _changeColor();
        },
        child: const Center(
          child: Text(
            'Next Quote',
            textAlign: TextAlign.center,
          ),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Text(
            _quote,
            style:  TextStyle(
              color: _colorRandom,
              fontSize: 50,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),

        ),
      ),
    );
  }
}