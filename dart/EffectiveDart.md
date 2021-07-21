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

# The Guide: [Style](https://dart.dev/guides/language/effective-dart/style)

## Identifiers

## Ordering

## Formatting

# The Guide: [Documentation](https://dart.dev/guides/language/effective-dart/documentation)

## Comments

## Doc comments

## Markdown

## Writing

# The Guide: [Usage](https://dart.dev/guides/language/effective-dart/usage)

## Libraries

## Null

## Strings

## Collections

## Functions

## Variables

## Members

## Constructors

## Error handling

## Asynchrony

# The Guide: [Design](https://dart.dev/guides/language/effective-dart/design)

## Names

## Libraries

## Classes and mixins

## Constructors

## Members

## Types

You can *type annotate* a variable, parameter, field, or return type. In the following example, `bool` and `String` are type annotations.

```dart
bool isEmpty(String parameter) {
  bool result = parameter.isEmpty;
  return result;
}
```

Type annotations are optional in Dart. If you omit one, Dart tries to *infer* a type based on the nearby context. Sometimes it doesn’t have enough information to infer a complete type. When that happens, Dart sometimes reports an error, but usually silently fills in any missing parts with `dynamic`.

According to the section 20.7 Type `dynamic` of the 
Dart Programming Language Specification, 5th edition (version 2.10; April 9, 2021),

- The type `dynamic` is a static type which is a supertype of all other types, just like `Object`, but it it differs from other types in that the static analysis assumes that every member access has a corresponding member with a signature that admits the given access.
- For instance, when the receiver in an ordinary method invocation has type `dynamic`, any method name can be invoked, with any number of type arguments or
none, with any number of positional arguments, and any set of named arguments, of any type, without error.


### DON’T redundantly type annotate initialized local variables.

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

### DON’T annotate inferred parameter types on function expressions.

Anonymous functions are almost always immediately passed to a method taking a callback of some type. When a function expression is created in a typed context, Dart tries to infer the function’s parameter types based on the expected type. For example, when you pass a function expression to Iterable.map(), your function’s parameter type is inferred based on the type of callback that map() expects:

```dart
// good
var names = people.map((person) => person.name);
// bad
var names = people.map((Person person) => person.name);
```

### DON’T type annotate initializing formals.

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

### DO write type arguments on generic invocations that aren’t inferred.

```dart
// good
var playerScores = <String, int>{};
final events = StreamController<Event>();
// bad
var playerScores = {};
final events = StreamController();
```

### DON’T write type arguments on generic invocations that are inferred.

This is the converse of the previous rule. If an invocation’s type argument list is correctly inferred with the types you want, then omit the types and let Dart do the work for you.

```dart
// good
final Completer<String> response = Completer();
var items = Future.value([1, 2, 3]);
// bad
final Completer<String> response = Completer<String>();
var items = Future<List<int>>.value(<int>[1, 2, 3]);
```

### DO annotate with `dynamic` instead of letting inference fail.

When `dynamic` is the type you want, write that explicitly to make your intent clear and highlight that this code has less static safety.

```dart
// good
dynamic mergeJson(dynamic original, dynamic changes) => ...
// bad
mergeJson(original, changes) => ...
```

Note that it’s OK to omit the type when Dart *successfully* infers `dynamic`.
Here, Dart infers `Map<String, dynamic>` for `json` and then from that infers `dynamic` for `users`. It’s fine to leave `users` without a type annotation.

```dart
Map<String, dynamic> readJson() => ...

void printUsers() {
  var json = readJson();
  var users = json['users'];
  print(users);
}
```

### AVOID using `dynamic` unless you want to disable static checking.

Some operations work with any possible object. For example, a `log()` method could take any object and call `toString()` on it. Two types in Dart permit all values: `Object?` and `dynamic`. However, they convey different things. If you simply want to state that you allow all objects, use `Object?`. If you want to allow all objects except `null`, then use `Object`.

The type `dynamic` not only accepts all objects, but it also permits all *operations*. Any member access on a value of type `dynamic` is allowed at compile time, but may fail and throw an exception at runtime. If you want exactly that risky but flexible dynamic dispatch, then `dynamic` is the right type to use.

The main exception to this rule is when working with existing APIs that use `dynamic`, especially inside a generic type. For example, JSON objects have type `Map<String, dynamic>` and your code will need to accept that same type. Even so, when using a value from one of these APIs, it’s often a good idea to cast it to a more precise type before accessing members.

### PREFER signatures in function type annotations.

The identifier `Function` by itself without any return type or parameter signature refers to the special `Function` type. This type is only marginally more useful than using `dynamic`. If you’re going to annotate, prefer a full function type that includes the parameters and return type of the function.

```dart
// good
bool isValid(String value, bool Function(String) test) => ...
// bad
bool isValid(String value, Function test) => ...
```

### PREFER inline function types over typedefs.

In Dart 1, if you wanted to use a function type for a field, variable, or generic type argument, you had to first define a typedef for it. Dart 2 supports a function type syntax that can be used anywhere a type annotation is allowed:

```dart
// good
class FilteredObservable {
  final bool Function(Event) _predicate;
  final List<void Function(Event)> _observers;

  FilteredObservable(this._predicate, this._observers);

  void Function(Event)? notify(Event event) {
    if (!_predicate(event)) return null;

    void Function(Event)? last;
    for (var observer in _observers) {
      observer(event);
      last = observer;
    }

    return last;
  }
}
```

### PREFER using function type syntax for parameters.

Dart has a special syntax when defining a parameter whose type is a function. Sort of like in C, you surround the parameter’s name with the function’s return type and parameter signature:

```dart
// before Dart 2
Iterable<T> where(bool predicate(T element)) => ...
```

Before Dart 2 added function type syntax, this was the only way to give a parameter a function type without defining a typedef. Now that Dart has a general notation for function types, you can use it for function-typed parameters as well:

```dart
// with Dart 2
Iterable<T> where(bool Function(T) predicate) => ...
```

### DON’T specify a return type for a setter.

Setters always return `void` in Dart. Writing the word is pointless.

```dart
// good
set foo(Foo value) { ... }
// bad
void set foo(Foo value) { ... }
```

### DO use `Future<void>` as the return type of asynchronous members that do not produce values.

When you have a synchronous function that doesn’t return a value, you use `void` as the return type. The asynchronous equivalent for a method that doesn’t produce a value, but that the caller might need to await, is `Future<void>`.

You may see code that uses `Future` or `Future<Null>` instead because older versions of Dart didn’t allow `void` as a type argument. Now that it does, you should use it. Doing so more directly matches how you’d type a similar synchronous function, and gives you better error-checking for callers and in the body of the function.

For asynchronous functions that do not return a useful value and where no callers need to await the asynchronous work or handle an asynchronous failure, use a return type of `void`.

### AVOID using `FutureOr<T>` as a return type.

If you return a `FutureOr<int>`, users need to check whether get back an `int` or a `Future<int>` before they can do anything useful. (Or they’ll just await the value, effectively always treating it as a `Future`.) Just return a `Future<int>`, it’s cleaner. It’s easier for users to understand that a function is either always asynchronous or always synchronous, but a function that can be either is hard to use correctly.

```dart
// good
Future<int> triple(FutureOr<int> value) async => (await value) * 3;
// bad
FutureOr<int> triple(FutureOr<int> value) {
  if (value is int) return value * 3;
  return value.then((v) => v * 3);
}
```

The more precise formulation of this guideline is to only use `FutureOr<T>` in contravariant positions. Parameters are contravariant and return types are covariant. In nested function types, this gets flipped—if you have a parameter whose type is itself a function, then the callback’s return type is now in contravariant position and the callback’s parameters are covariant. This means it’s OK for a callback’s type to return `FutureOr<T>`:

```dart
// good
Stream<S> asyncMap<T, S>(
  Iterable<T> iterable, 
  FutureOr<S> Function(T) callback) async* 
{
  for (var element in iterable) {
    yield await callback(element);
  }
}
```

### Other guides

The other guides in the Types section are:

- **DO type annotate variables without initializers.** The type of a variable —top-level, local, static field, or instance field— can often be inferred from its initializer. However, if there is no initializer, inference fails. For example, write `List<AstNode> parameters;` instead of `var parameters;`.
- **DO type annotate fields and top-level variables if the type isn’t obvious.** Type annotations are important documentation for how a library should be used. They form boundaries between regions of a program to isolate the source of a type error. Write `Future<bool> install(PackageId id, String destination) => ...` instead of `install(id, destination) => ...`.
- **DO annotate return types on function declarations.** Dart doesn’t generally infer the return type of a function declaration from its body, unlike some other languages. That means you should write a type annotation for the return type yourself. Write `String makeGreeting(String who) { return 'Hello, $who!'; }` instead of `makeGreeting(String who) { return 'Hello, $who!'; }`.
- **DO annotate parameter types on function declarations.** A function’s parameter list determines its boundary to the outside world. Annotating parameter types makes that boundary well defined. Note that even though default parameter values look like variable initializers, Dart doesn’t infer an optional parameter’s type from its default value. For example, write `void sayRepeatedly(String message, {int count = 2}) {...}` instead of `void sayRepeatedly(message, {count = 2}) {...}`.
- **AVOID writing incomplete generic types.** The goal of writing a type annotation or type argument is to pin down a complete type. However, if you write the name of a generic type but omit its type arguments, you haven’t fully specified the type. In Java, these are called “raw types”. For example: write `List<num> numbers = [1, 2, 3];` instead of `List numbers ...`.
- **DON’T use the legacy typedef syntax.** Write in the new syntax `typedef Comparison<T> = int Function(T, T);` instead of `typedef int Comparison<T>(T a, T b);`.

## Parameters

## Equality
