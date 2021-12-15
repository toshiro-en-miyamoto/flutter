import 'package:hello/person.dart';

class Student extends Person {
  String nickName;
  Student(String firstName, String lastName, this.nickName)
      : super(firstName, lastName);
  @override
  String toString() => '$fullName, aka $nickName';
}

class AStudent implements APerson {
  String nickName;
  @override
  String firstName;
  @override
  String lastName;
  AStudent(this.firstName, this.lastName, this.nickName);
  @override
  String get fullName => '$firstName $lastName';
  @override
  String toString() => '$fullName, aka $nickName';
}
