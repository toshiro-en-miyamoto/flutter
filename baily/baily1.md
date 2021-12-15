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
  ...
}
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

# Chapter 4: Dart Classes and Constructs

## Object orientation in Dart

In Dart, everything is an object — that is, every value stored in a variable is an instance of a class. Additionally, all objects also extend the `Object` class, directly or indirectly.

Dart classes do not support constructor overloading, but you can use the flexible function argument specifications from the language (optional, positional, and named) to provide different ways to instantiate a class.

**Encapsulation**: Dart does not have explicit access restrictions on fields and methods, unlike the famous keywords used in Java — protected, private, and public. In Dart, encapsulation occurs at the library level instead of at the class level.

- Dart creates implicit getters and setters for all fields in a class, so you can define how data is accessible to consumers and the way it changes.
- In Dart, if an identifier (ID) (that is, a class, class member, top-level function, or variable) starts with an underscore (_), it's private to its library where a library is normally the contents of a single file.

**Inheritance and composition**: Dart permits single direct inheritance. A class can only inherit from one other class, leading to a strict tree structure.

- Dart has special support for **mixins**, which can be used to extend class functionalities without direct inheritance, simulating multiple inheritance and enabling easy reuse of code.
- Dart does not contain a `final` class directive.

**Polymorphism**: is achieved by inheritance and can be regarded as the ability of an object to behave like another; for example, the int type is also a num type. The following also applies:

- Dart allows overriding parent methods to change their original behavior.
- Dart does not allow overloading in the way you may be familiar with. You cannot define the same method twice with different arguments. If required, you can simulate overloading by using flexible parameter definitions through optional and positional parameters.

**Functions as objects**: In Dart, even functions are objects. This is known as having first-class functions because they're treated the same way as other types.

## Understanding classes in Dart

```dart
class Person {                     // 1, 2, 3
  String? firstName;               // 4
  String? lastName;                // 4
  String getFullName() => "$firstName $lastName";
}

main() {
  Person somePerson = Person();    // 1, 2
  somePerson.firstName = "Clark";  // 4
  somePerson.lastName = "Kent";    // 4
  print(somePerson.getFullName());
}
```

1. We have not defined a constructor for the class, but, as you may have guessed, there's a default empty constructor (no arguments) already provided for us.
2. To instantiate a class, we call the constructor invocation. Unlike in many OOP languages, there is no need to use the `new` keyword.
3. The class does not have an ancestor class explicitly declared, but it does implicitly inherit from `Object`, as do all classes in Dart.
4. The class does not have any get or set accessor declared, so how did we access `firstName` and `lastName` to mutate it? A default get/set accessor is defined for every field in a class.

**getters and setters**: every field has these accessors, even when we do not define them. We can modify our Person class to replace the old `getFullName()` method and add it as a getter.

```dart
class Person {
  String? firstName;
  String? lastName;
  String get fulllName => "$firstName $lastName";
}

main() {
  Person somePerson = Person();
  somePerson.firstName = "Clark";
  somePerson.lastName = "Kent";
  print(somePerson.fullName);
  // somePerson.fullName = "peter parker";
}
```

1. We could not have defined a getter or setter with the same field names `firstName` and `lastName`. This would give us a compile error, as the class member names cannot be repeated.
2. We do not need to always define a get and set pair together, as you can see that we have only defined a `fullName` getter and not a setter, so we cannot modify `fullName`.

**Static fields and methods**: The `static` fields are associated with the class, rather than any object instance. The same goes for the `static` method definitions.

**Constructors**: is also a method in Dart, and its role is to initialize the instance of the class properly. As a method, it can have many of the characteristics of a common Dart method, such as arguments: required or optional, and named or positional.

```dart
class Person {
  late String firstName;
  late String lastName;

  Person(String firstName, String lastName) {
    this.firstName = firstName;
    this.lastName = lastName;
  }

  String get fullName => '$firstName $lastName';
}

void main() {
  // Person somePerson = Person(); No longer compiles
  var somePerson = Person("Clark", "Kent");
  print(somePerson.fullName);
}
```

Notice that we have to use the `late` keyword because the fields have not been declared with an initial value, but we know that values of the fields will be set on instantiation of the class, so their values will not be accessed before they have a value set.

There is no need for the constructor body, as the field values are set directly in the constructor signature.

```dart
class Person {
  late String firstName;
  late String lastName;
  Person(this.firstName, this.lastName);
  String get fullName => '$firstName $lastName';
}
```

**Named constructors**: Dart does not have overloading by redefinition, so to define alternative constructors for a class, you need to use the named constructors. For example, we could add a named constructor 'anonymous()'. The only difference compared with a simple method is that constructors do not have a `return` statement.

```dart
class Person {
  late String firstName;
  late String lastName;
  Person(this.firstName, this.lastName);
  Person.anonymous() {
    firstName = 'Jane';
    lastName = 'Doe';
  }
  String get fullName => '$firstName $lastName';
}
void main(List<String> arguments) {
  var ck = Person('Clark', 'Kent');
  print(ck.fullName);

  var nobody = Person.anonymous();
  print(nobody.fullName);
}
```

**Factory constructs**: may be used when data is being cached and we wnat to return an instance from the cache rather than construct a new instance.

```dart
class Person {
  ...
  factory Person.fromCache(String firstName, String lastName) {
    if (_cacheService.containsPerson(firstName, lastName)) {
      return _cacheService.getPerson(firstName, lastName);
    } else {
      return Person(firstName, lastName);
    }
  }
}
```

**Static fields and methods**: The `static` fields are associated with the class, rather than any object instance. The same goes for the `static` method definitions.

```dart
class _cacheService {
  static bool containsPerson(String firstName, String lastName) {
    return true;
  }

  static Person getPerson(String firstName, String lastName) {
    return Person('$firstName $lastName', 'from cache');
  }
}
```

**Class inhretance**: Dart allows us to extend defined classes using the `extends` keyword, where all of the members of the parent class are inherited, except the constructors.

```dart
class Student extends Person {
  String nickName;
  Student(String firstName, String lastName, this.nickName)
      : super(firstName, lastName);
  @override
  String toString() => '$fullName, aka $nickName';
}

main() {
  var student = Student('Clark', 'Kent', 'Kal-El');
  print(student);
}
```

Annotations generally contribute to the readability of the code. In this instance, `@override` annotation has been used to mark the `toString()` method as overriding the method from the parent class.

**Abstract classes**: In OOP, abstract classes are classes that cannot be instatiated. ... An abstract class may have abstract members without an implementation, allowing it to be implemented by the child types that extend them:

```dart
abstract class Person {
  String firstName;
  String lastName;
  Person(this.firstName, this.lastName);
  String get fullName;  // abstract method
}
```

**Interfaces**: Dart does not have the interface keyword but does allow us to use interfaces in a subtly diffrent way from what you may be used to. All class declarations are themselves interfaces, which means that when you are defining a class in a Dart, you are also defining an interface that may be implemented and not only extended by other classes. This is called *implicit interfaces* in the Dart world.

```dart
class Student implements Person {
  String nickName;
  @override String firstName;
  @override String lastName;
  Student(this.firstName, this.lastName, this.nickName);
  @override String get fullName => '$firstName $lastName';
  @override String toString() => '$fullName, aka $nickName';
}
```
**Mixins**: are mainly used in places where multiple inheritance is needed, as this is an easy way for classes to use common functionality. One of the main examples of this in Flutter is when you want to create a widget that is animated. Defining a widget class requires inheritance, so to add animation capabilities to your class, a mixin is required.

We can use two skills classes, `ProgrammingSkills` and `ManagementSkills`, by adding the `with` keyword to the class definition. `SeniorDeveloper` and `JuniorDeveloper` classes will have the `coding()` method, without the need to implement it in each class, as it is already implemmented in the `ProgrammingSkills` mixin. Additionally, the `SeniorDeveloper` class will have the `manage()` method.

```dart
class ProgrammingSkills {
  void coding() {
    print('writing code...');
  }
}

class ManagementSkills {
  void manage() {
    print('managing project...');
  }
}

class SeniorDeveloper extends Person with ProgrammingSkills, ManagementSkills {
  SeniorDeveloper(String firstName, String lastName)
      : super(firstName, lastName);
}

class JuniorDeveloper extends Person with ProgrammingSkills {
  JuniorDeveloper(String firstName, String lastName)
      : super(firstName, lastName);
}

main() {
  var senior = SeniorDeveloper('Senior', 'Developer');
  print(senior.fullName);
  senior.coding();
  senior.manage();

  var junior = JuniorDeveloper('Junior', 'Developer');
  print(junior.fullName);
  junior.coding();
}
```

## The `enum` type

```dart
enum PersonType { student, employee }
```

Note that you only define the value name. `enum` types are are special types with a set of finite values that have an index property representing their value.

```dart
main() {
  print(PersonType.values);
  // [PersonType.student, PersonType.employee]
}
```

We are calling the `values` getter on the `PersonType` enum directly. This is a static member of the enum type that simply returns a list with all of its values.

## Using generics

We expect the `dynamicList` to be a list of name and nothing else. Unfortunately, without generics, we can place anything into the list, including a number.

```dart
var dynamicList = [];
dynamicList.add('Tokyo');
dynamicList.add(1);
```

However, if we specify the `String` type for the list, then adding a number would not compile.

```dart
var stringList = <String>[];
stringList.add('Tokyo');
// stringList.add(1);
```

For maps, we can specify a `<keyType, valueType>` prefix.

```dart
var heights = <String, int>{};
heights['Tokyo Tower'] = 333;
heights['Skytree Tower'] = 634;
```

Suppose in our map we allowed some entries to have no value. We would need to declare this so that when access the map's entries, we would know that `null` was a possible value.

```dart
var nullableMap = <String, String?>{};
nullableMap['Middlesbrough'] = 'Transport bridge';
nullableMap['New York'] = 'Status of Liberty';
nullableMap['Barnmouth'] = null;
```

## Asynchronous programming

Dart is a single-thread programming language, meaning that all of the application code runs in the same thread. However, Dart can perform asynchronous operations through the use of *Futures*.

So, we've declared that the method should be called asynchronously using `async`, and we may have specified that we want to come back to the method call when there is a result using `await`, bu what does the method actually return? The `Future<T>` object in Dart represents a value that will be provided sometime in the future.

```dart
Future<void> longRunningOperation3() async {
  for (var i = 0; i < 5; i++) {
    await Future.delayed(Duration(seconds: 1));
    print('index: $i');
  }
}

void tryAsync3() {
  print('start of long running operation');
  longRunningOperation3();
  print('continueing main body');
  for (var i = 10; i < 15; i++) {
    sleep(Duration(seconds: 1));
    print('index from main: $i');
  }
  print('end of main');
}

main() {
  tryAsync3();
}

start of long running operation
continueing main body
index from main: 10
index from main: 11
index from main: 12
index from main: 13
index from main: 14
end of main
index: 0
index: 1
index: 2
index: 3
index: 4
```

The `longRunningOperation()` calls `await` in `Future.delayed()` that is an asynchrounous function. The `longRunningOperation()` is suspended and will be resume only after a delay of 1 second. After the delay, however, the `tryAsync()` function is already running again; it did not not wait for the `longRunningOperation()` to complete because we didn't specify `await`, so the `longRunningOperation()` code will be executed only after the `tryAsync()` function has finished.

**Dart Isolates**: Every Dart application is composed at least of one `Isolate` instance — the main `Isolate` instance where all of the application runs. So, to create parallel execution code, we must create a new `Isolate` instance that can run in parallel with the main Isolate instance.

```dart
Future<void> longRunningOperation5(String message) async {
  for (var i = 0; i < 5; i++) {
    await Future.delayed(Duration(seconds: 1));
    print('$message: $i');
  }
}

void tryIsolate1() async {
  print('start of long running operation');
  // ignore: unawaited_futures
  Isolate.spawn(longRunningOperation5, 'Hello');
  print('continueing main body');
  for (var i = 10; i < 15; i++) {
    await Future.delayed(Duration(seconds: 1));
    print('index from main: $i');
  }
  print('end of main');
}

start of long running operation
continueing main body
index from main: 10
Hello: 0
index from main: 11
Hello: 1
index from main: 12
Hello: 2
index from main: 13
Hello: 3
index from main: 14
end of main
```

Both functions — `longRunningOperation()` and `tryIsolate()` — run interleaved, but this time, the `tryIsolate()` function runs ahread of the `longRunning Operation()` function. This is because unlike the previous example where the thread did not relinquish control until it reached `await Future.delayed()`, the `spawn` operation creates an isolate asynchronously, allowing the `tryIsolate()` function thread to immediately move to its `await Future.delayed()` function.

Isolates can be considered to be a sort of thread, but they do not share anything with each other, as the name suggests. This means that they do not share memory, so we do not need to use locks and other thread synchronization techniques here.

To communicate between isolates — that is, to send and receive data between them, we need to exchange messages.

