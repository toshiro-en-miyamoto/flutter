import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyTextInContainer(),
    );
  }
}

class MyTextInContainer extends StatelessWidget {
  const MyTextInContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Text in Container'),
      ),
      body: Container(
        decoration: BoxDecoration(
          border: Border.all(),
        ),
        padding: const EdgeInsets.all(14),
        child: const Text(
          'Beautiful Teesside',
        ),
      ),
    );
  }
}
