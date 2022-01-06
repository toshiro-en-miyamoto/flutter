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
      home: const MyDrag(),
    );
  }
}

class MyDrag extends StatefulWidget {
  const MyDrag({Key? key}) : super(key: key);
  @override
  State<MyDrag> createState() => _MyDragState();
}

class _MyDragState extends State<MyDrag> {
  int _dragCount = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Drag example'),
      ),
      body: Center(
        child: GestureDetector(
          onHorizontalDragStart: (DragStartDetails details) {
            setState(() {});
          },
          onHorizontalDragUpdate: (DragUpdateDetails details) {
            setState(() {});
          },
          onHorizontalDragEnd: (DragEndDetails details) {
            setState(() {
              _dragCount++;
            });
          },
          child: Text(
            'Drag count: $_dragCount',
          ),
        ),
      ),
    );
  }
}
