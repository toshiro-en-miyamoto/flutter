# Flutter API Cheat Sheet

## the `main()` stub [1]

```dart
// Copyright 2018 The Flutter team. All rights reserved.
import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Startup Name Generator',
      home: RandomWords(),
    );
  }
}

class RandomWords extends StatefulWidget {
  @override
  State<RandomWords> createState() => _RandomWordsState();
}

class _RandomWordsState extends State<RandomWords> {
  final _suggestions = <WordPair>[];
  final _biggerFont = const TextStyle(fontSize: 18.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Startup Name Generator'),
      ),
      body: _buildSuggestions(),
    );
  }

  Widget _buildSuggestions() {
    return ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemBuilder: (context, i) {
          if (i.isOdd) return const Divider();

          final index = i ~/ 2;
          if (index >= _suggestions.length) {
            _suggestions.addAll(generateWordPairs().take(10));
          }
          return _buildRow(_suggestions[index]);
        });
  }

  Widget _buildRow(WordPair pair) {
    return ListTile(
      title: Text(
        pair.asPascalCase,
        style: _biggerFont,
      ),
    );
  }
}
```

- Applications [3]
  - `runApp(Widget app) → void`: Inflate the given widget and attach it to the screen.
  - `MaterialApp`: An application that uses material design.
  - `Scaffold`: Implements the basic material design visual layout structure.
    - The Scaffold is designed to be a top level container for a `MaterialApp`. This means that adding a Scaffold to each route on a Material app will provide the app with Material's basic visual layout structure. [Scaffold class](https://api.flutter.dev/flutter/material/Scaffold-class.html)
  - `AppBar`: A material design app bar.
- Widgets [4]
  - `Widget`: Describes the configuration for an *Element*.
  - `StatelessWidget`: A widget that does not require mutable state.
    - `build(BuildContext context) → Widget`: Describes the part of the user interface represented by this widget.
- States [4]
  - `StatefulWidget`: A widget that has mutable state.
    - `createState() → State<StatefulWidget>`: Creates the mutable state for this widget at a given location in the tree.
  - `State<T extends StatefulWidget>`: The logic and internal state for a StatefulWidget.
    - `build(BuildContext context) → Widget`: Describes the part of the user interface represented by this widget.
- [Scrollable widgets](https://api.flutter.dev/flutter/widgets/ScrollView-class.html) [3]
  - `ListView`: A scrollable list of widgets arranged linearly.
  - `ListTile`: A single fixed-height row that typically contains some text as well as a leading or trailing icon.
    - `title → Widget?`: The primary content of the list tile.
    - `trailing → Widget?`: A widget to display after the title.
    - `onTap → GestureTapCallback?`: Called when the user taps this list tile.
- Flutter's painting API wrappers [5]
  - `EdgeInsets`: An immutable set of offsets in each of the four cardinal directions.
- Text [4]
  - `Text`: A run of text with a single style.
    - If your app might be deployed to users who speak another language then you’ll need to internationalize it. Refer to [Internationalizing Flutter apps](https://flutter.dev/docs/development/accessibility-and-localization/internationalization).
- Icon
  - `Icon`: A graphical icon widget drawn with a glyph from a font described in an *IconData* such as material's predefined *IconDatas* in *Icons*. [4]
  - `Icons`: Identifiers for the supported material design icons. [3]

## References

- [1] [Write your first Flutter app, part 1](https://flutter.dev/docs/get-started/codelab)
- [2] [Flutter API Reference](https://api.flutter.dev/)
- [3] [the `material` library](https://api.flutter.dev/flutter/material/material-library.html)
- [4] [the `widget` library](https://api.flutter.dev/flutter/widgets/widgets-library.html)
- [5] [the `painting` library](https://api.flutter.dev/flutter/painting/painting-library.html)