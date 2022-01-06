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
      home: const MyTextEditing(),
    );
  }
}

class MyTextEditing extends StatefulWidget {
  const MyTextEditing({Key? key}) : super(key: key);
  @override
  State<MyTextEditing> createState() => _MyTextEditingState();
}

class _MyTextEditingState extends State<MyTextEditing> {
  String _textValue = '';
  final _textEditingController = TextEditingController.fromValue(
    const TextEditingValue(text: 'Initial value'),
  );

  @override
  void initState() {
    super.initState();
    _textEditingController.addListener(() {
      setState(() {
        _textValue = _textEditingController.text;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Text editing example'),
      ),
      body: Column(
        children: [
          TextField(
            controller: _textEditingController,
          ),
          Text(
            'typed as: $_textValue',
          ),
        ],
      ),
    );
  }
}
