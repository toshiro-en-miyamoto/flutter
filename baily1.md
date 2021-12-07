# Flutter for Beginners (2nd ed), Section 1

- By Thomas Bailey, Alessandro Biessek, Trevor Wills
- October, 2021
- ISBN 978-1-80056-599-9

Section 1: Introduction to Dart
- Chapter 2: An Introcution to Dart
- Chapter 4: Dart Classes and Constructs

# Chapter 2: An Introcution to Dart

**Operators**: are nothing more than methods defined in classes with a special syntax. So, when you use operators such as `x == y`, it is as though you are invoking the `==()` method to compare equality.

```dart
x.==(y)
```

**Equality operator**: the `==` operator does not compare memory references but rather the content of the variable. Also, unlike JavaScript, there is no `===` operator required because Dart type safety ensures that the `==` equality operator is only used on objects of the same type. For example, in JavaScript, `"7" == 7` evaluates to `true`, but `"7" === 7` evaluates to `false`.

**The `main` function**: is the function that the *Dart VM* searches for when it first starts running code.

```dart
void main(List<String> arguments) {
```

## Null safety

**`?` declaration**: To specify that a variable can be set to the null value, you can add a ? character to the type of the variable.

```dart
// can take an int or a null value
int? newNumber;
```

**`?.` (null aware) method operator**: This will only call the method if the variable is not `null`; otherwise, it will simply return `null`.

```dart
String? goalScorer;
// ...
print(goalScorer?.length);
```

**`!.` (null assertion) method operator**: say that we are confident that the `goalScorer` variable is not `null`. The compiler trusts that we are right about this.

```dart
String? goalScorer;
// ...
print(goalScorer!.length);
```

**Late variables**: There are times when you know a variable will have a value set before that value is accessed, but the variable's value cannot be initialized immediately at variable declaration.

## Built-in Types

**Numbers**: Dart represents numbers in two ways, outlined as follows:

- `int`: 64-bit signed non-fractional integer values such as -263 to 263-1.
- `double`: Dart represents fractional numeric values with a 64-bit double-precision floating-point number.
- Both of them extend the `num` type.

**Big integers**: Dart also has the `BigInt` type for representing arbitrary precision integers, which means that the size is only limited by your computer's random-access memory (RAM). This type can be very useful depending on the context; however, it does not have the same performance as `num` types, so you should carefully consider when to use it.

**Boolean types**: are simple truth values that can be useful for any logic. Unlike in JavaScript where everything with a value is `true` and everything without a value is `false`, Dart is strict about Boolean types and does not follow the same *truthy* and *falsy* approach.

**Lists**: should be created using the square brackets literal. In fact, creation of a list using the `List` type name is now deprecated.

```dart
List dynamicList[];
```

In many OO languages, instances of classes such as Lists are created using the `new` keyword. This was also true in the Dart language but is now no longer used.

In Dart, lists bring together the functionality of array and `List` types present in other programming languages.

- The `[index]` operator allows convenient access to the elements at a given index.
- The `+` operator can be used to concatenate two lists by returning a new list with the left operand followed by the right one.
- Dart lists are not naturally length-constrained, as arrays in some languages can be. Lists grow and shrink as needed.

During list creation, a length can be set to enforce a fixed size. Lists with a fixed size cannot be expanded.

```dart
List fixedList = List.filled(3, "World");
fixedList.add("Hello"); // Error
fixedList[0] = "Hello";
```

**Maps**: are dynamic collections for storing key-value pairs.

```dart
Map nameAgeMap = {};
nameAgeMap["Alice"] = 23;
print(nameAgeMap["Alice"]);
```

**Strings**: are a sequence of UTF-16 codes. Matching single or double quotes are used to wrap the text.

```dart
String singleQuoteString = 'Here is a string';
String doubleQuoteString = "Here is a string";
```

Multiline strings can be created using matching triple single quotes or triple double quotes

```dart
String multiLineStringS = '''Here is a multi-line
  single quote string''';
String multiLineStringD = """Here is a multi-line
  double quote string""";
```

**String interpolation**: is the action of evaluating placeholders within a string. The dollar (`$`) symbol identifies the placeholders to be evaluated. If this evaluation is a single variable, then the curly brackets can be omitted.

```dart
String someString = "Happy string";
print("The string is: $someString");
// prints The string is: Happy string

print("The string length is: $someString.length");
// prints The string length is: Happy string.length
```

For a placeholder that involves more than the evaluation of a single variable, the curly brackets denote the boundary of evaluation.

```dart
print("The string length is: ${someString.length}");
// prints The string length is: 16
```

**`const` and `final`**: If the value of the variable can be defined at compile time (e.g., literals), then you would use the `const` modifier to specify the variable as a constant.

```dart
const String someString = "Happy string";
```

However, if the value will be set once, but that value is not known as compile time, then use the `final` modifier instead.

```dart
final String someString = DateTime.now().toString();
```

With *stateless widgets*, you should set your variables as `final` because a stateless widget should not, by definition, be able to mutate its state.

## Functions and methods

**Return types**: This `sayHello` functions includes a return type of `String`, so the function must have a `return` statement at the end that returns a value of the expected type.

```dart
String sayHello() {
  return "Hello world!";
}
```

If the function could return a `String` literal or `null` then, as we saw in the Null safety section, we would mark the function's return type as `String?`.

```dart
String? sayHello() {
  return "Hello world!";
}
```

In this example, the `sayHello` function is a top-level function — in other words, it does not need a class to exist. Although Dart is an OO language, it is not necessary to write classes to encapsulate functions.

**`Function` type**: In Dart, `Function` is a type, like `String` or `num`. This means that it can also be assigned to fields or local variables or passed as parameters to other functions.

```dart
var helloFunction = sayHello();
String helloMessage = helloFunction();
```

**Function parameters**: A function can have two types of parameters: optional and required.

- required positional parameters
- optional positional parameters
- named parameters

```dart
// an optional positional parameter with a default value
sayHappyBirthday(String name, [int age = 21]) { ... }
```

```dart
// an optional named parameter with a default value
sayHappyBirthday(String name, {int age = 7}) { ... }
// calling the function
sayHappyBirthday('Anji', age: 26);
sayHappyBirthday('Yuki');
```

```dart
// a required named parameter
sayHappyBirthday(String name, {required int age}) { ... }
```

**Anonymous functions**: are a function that doesn't have a name; it is also called a lambda or closure.

```dart
void main() {
  List = [1, 2, 3, 4];
  list.forEach((number) => print('hello $number'));
}
```
