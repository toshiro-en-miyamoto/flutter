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
      home: const MyHomePage(title: 'Transitions with my class'),
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
                Navigator.of(context).push(MySlideTransition(
                  transitionPage: const AnotherScreen(title: 'Go back'),
                ));
              },
            ),
          ],
        ),
      ),
    );
  }
}

class MySlideTransition extends PageRouteBuilder {
  final Widget transitionPage;
  MySlideTransition({required this.transitionPage})
      : super(
          pageBuilder: (context, animation, secondaryAnimation) =>
              transitionPage,
          transitionsBuilder: (context, animation, secondaryAnimation, child) =>
              SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(-1, 0),
              end: Offset.zero,
            ).animate(animation),
            child: child,
          ),
        );
}

class AnotherScreen extends StatelessWidget {
  const AnotherScreen({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          child: Text(title),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
    );
  }
}
