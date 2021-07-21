# [Effective Dart](https://dart.dev/guides/language/effective-dart)

- Style
  - Identifiers
  - Ordering
  - Formatting
- Documentation
  - Comments
  - Doc comments
  - Markdown
  - Writing
- Usage
  - Libraries
  - Null
  - Strings
  - Collections
  - Functions
  - Variables
  - Members
  - Constructors
  - Error handling
  - Asynchrony
- Design
  - Names
  - Libraries
  - Classes and mixins
  - Constructors
  - Members
  - Types
  - Parameters
  - Equality

A *mixin* describes the difference between a class and its superclass. A mixin
is either derived from an existing class declaration or introduced by a mixin
declaration.

## [Style](https://dart.dev/guides/language/effective-dart/style)

### Identifiers

### Ordering

### Formatting

## [Documentation](https://dart.dev/guides/language/effective-dart/documentation)

### Comments

### Doc comments

### Markdown

### Writing

## [Usage](https://dart.dev/guides/language/effective-dart/usage)

### Libraries

### Null

### Strings

### Collections

### Functions

### Variables

### Members

### Constructors

### Error handling

### Asynchrony

## [Design](https://dart.dev/guides/language/effective-dart/design)

### Names

### Libraries

### Classes and mixins

### Constructors

### Members

### Types

You can *type annotate* a variable, parameter, field, or return type. In the following example, `bool` and `String` are type annotations.

```dart
bool isEmpty(String parameter) {
  bool result = parameter.isEmpty;
  return result;
}
```

Type annotations are optional in Dart. If you omit one, Dart tries to *infer* a type based on the nearby context.

Inference is a powerful tool to spare you the effort of writing and reading types that are obvious or uninteresting. It keeps the reader’s attention focused on the behavior of the code itself.

**DON’T redundantly type annotate initialized local variables.**

Local variables, especially in modern code where functions tend to be small, have very little scope. Omitting the type focuses the reader’s attention on the more important name of the variable and its initialized value.

```dart
// good
var desserts = <List<Ingredient>>[];
for (var recipe in cookbook) {
    ....
}
// bad
List<List<Ingredient>> desserts = <List<Ingredient>>[];
for (List<Ingredient> recipe in cookbook) {
    ....
}
```

**DON’T annotate inferred parameter types on function expressions.**

Anonymous functions are almost always immediately passed to a method taking a callback of some type. When a function expression is created in a typed context, Dart tries to infer the function’s parameter types based on the expected type. For example, when you pass a function expression to Iterable.map(), your function’s parameter type is inferred based on the type of callback that map() expects:

```dart
// good
var names = people.map((person) => person.name);
// bad
var names = people.map((Person person) => person.name);
```

**DON’T type annotate initializing formals.**

If a constructor parameter is using `this.` to initialize a field, then the type of the parameter is inferred to have the same type as the field.

```dart
// good
class Point {
  double x, y;
  Point(this.x, this.y);
}
// bad
class Point {
  double x, y;
  Point(double this.x, double this.y);
}
```

**DO write type arguments on generic invocations that aren’t inferred.**

```dart
// good
var playerScores = <String, int>{};
final events = StreamController<Event>();
// bad
var playerScores = {};
final events = StreamController();
```

**DON’T write type arguments on generic invocations that are inferred.**

This is the converse of the previous rule. If an invocation’s type argument list is correctly inferred with the types you want, then omit the types and let Dart do the work for you.

```dart
// good
final Completer<String> response = Completer();
var items = Future.value([1, 2, 3]);
// bad
final Completer<String> response = Completer<String>();
var items = Future<List<int>>.value(<int>[1, 2, 3]);
```


The other guides in the Types section are:

- **DO type annotate variables without initializers.** The type of a variable —top-level, local, static field, or instance field— can often be inferred from its initializer. However, if there is no initializer, inference fails.
- **DO type annotate fields and top-level variables if the type isn’t obvious.** Type annotations are important documentation for how a library should be used. They form boundaries between regions of a program to isolate the source of a type error.
- **DO annotate return types on function declarations.** Dart doesn’t generally infer the return type of a function declaration from its body, unlike some other languages. That means you should write a type annotation for the return type yourself.
- **DO annotate parameter types on function declarations.** A function’s parameter list determines its boundary to the outside world. Annotating parameter types makes that boundary well defined. Note that even though default parameter values look like variable initializers, Dart doesn’t infer an optional parameter’s type from its default value. For example, write `void sayRepeatedly(String message, {int count = 2}) {...}` instead of `void sayRepeatedly(message, {count = 2}) {...}`.
- **AVOID writing incomplete generic types.** The goal of writing a type annotation or type argument is to pin down a complete type. However, if you write the name of a generic type but omit its type arguments, you haven’t fully specified the type. In Java, these are called “raw types”. For example: write `List<num> numbers = [1, 2, 3];` instead of `List numbers ...`

### Parameters

### Equality
