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
      home: const MyFormKey(),
    );
  }
}

class MyFormKey extends StatefulWidget {
  const MyFormKey({Key? key}) : super(key: key);
  @override
  State<MyFormKey> createState() => _MyFormKeyState();
}

class _MyFormKeyState extends State<MyFormKey> {
  final _key = GlobalKey<FormFieldState<String>>();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Form with a key'),
      ),
      body: Form(
        key: _key,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            TextFormField(
              validator: (String? value) {
                return value!.isEmpty ? 'Not empty' : null;
              },
            ),
            TextFormField(),
            Builder(
              builder: (BuildContext subContext) => TextButton(
                onPressed: () {
                  // final valid = Form.of(subContext)!.validate();
                  // print('valid: $valid');
                },
                child: const Text('validate'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
