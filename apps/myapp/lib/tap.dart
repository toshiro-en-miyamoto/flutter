import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyTap(),
    );
  }
}

class MyTap extends StatefulWidget {
  const MyTap({Key? key}) : super(key: key);
  @override
  State<MyTap> createState() => _MyTapState();
}

class _MyTapState extends State<MyTap> {
  int _counter = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tap example'),
      ),
      body: Center(
        child: GestureDetector(
          onTap: () {
            setState(() {
              _counter++;
            });
          },
          child: Text(
            'Tap counter: $_counter',
          ),
        ),
      ),
    );
  }
}
