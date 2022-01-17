import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String? _selectedTown;
  void _setTownName(String townName) {
    setState(() {
      _selectedTown = townName;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Navigator(
        pages: [
          MaterialPage(
            child: MyHomePage(
              title: 'Press this',
              townNameCallback: _setTownName,
            ),
          ),
          if (_selectedTown != null)
            MaterialPage(
              child: TownScreen(title: _selectedTown!),
            ),
        ],
        onPopPage: (route, result) {
          if (!route.didPop(result)) {
            return false;
          }
          setState(() {
            _selectedTown = null;
          });
          return true;
        },
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage(
      {Key? key, required this.title, required this.townNameCallback})
      : super(key: key);

  final String title;
  final void Function(String) townNameCallback;
  @override
  State<StatefulWidget> createState() => _MyHomePageState();
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
          children: [
            ElevatedButton(
              child: const Text('Whitby'),
              onPressed: () {
                widget.townNameCallback('Whitby');
              },
            ),
            ElevatedButton(
              child: const Text('Scarborough'),
              onPressed: () async {
                widget.townNameCallback('Scarborough');
              },
            ),
          ],
        ),
      ),
    );
  }
}

class TownScreen extends StatelessWidget {
  const TownScreen({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(title),
            ElevatedButton(
              child: const Text('Close'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      ),
    );
  }
}
