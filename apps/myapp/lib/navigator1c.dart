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
      // home: const MyHomePage(title: 'Flutter Navigator 1.0'),
      routes: {
        '/': (context) =>
            const MyHomePage(title: 'Navigator 1.0 - get a Future'),
        '/screen2': (context) => const AnotherScreen(title: "Go back"),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('Hello My Home Page!'),
            ElevatedButton(
              child: const Text('Press this'),
              onPressed: () async {
                bool? outcome = await Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return const AnotherScreen(title: 'Go back');
                }));
                ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text('$outcome')));
              },
            ),
          ],
        ),
      ),
    );
  }
}

class AnotherScreen extends StatelessWidget {
  const AnotherScreen({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: Text(title),
              onPressed: () {
                Navigator.of(context).pop(true);
              },
            ),
            ElevatedButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop(false);
              },
            ),
          ],
        ),
      ),
    );
  }
}
