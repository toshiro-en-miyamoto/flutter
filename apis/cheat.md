# Flutter API Cheat Sheet

## the `main()` stub

```Dart
import 'package:flutter/material.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
        return MaterialApp(
            title: 'Welcome to Flutter',
            home: ...,
        );
    }
}
```

## the `material` library [3]

### `StatelessWidget`


## References

- [1] [Write your first Flutter app, part 1](https://flutter.dev/docs/get-started/codelab)
- [2] [Flutter API Reference](https://api.flutter.dev/)
- [3] [the `material` library](https://api.flutter.dev/flutter/material/material-library.html)
