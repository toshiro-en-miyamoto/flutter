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
      home: const MyButtonHandler(),
    );
  }
}

class MyButtonHandler extends StatefulWidget {
  const MyButtonHandler({Key? key}) : super(key: key);
  @override
  State<MyButtonHandler> createState() => _MyButtonHandlerState();
}

class _MyButtonHandlerState extends State<MyButtonHandler> {
  var state = 'to be validated';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Button handler example'),
      ),
      body: Column(
        children: <Widget>[
          Center(
            child: Text(
              state,
              style: const TextStyle(fontSize: 24),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                state = 'validated';
              });
            },
            child: const Text('validate me'),
          ),
        ],
      ),
    );
  }
}
