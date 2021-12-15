import 'package:hello/async.dart';
import 'package:hello/developers.dart';
import 'package:hello/hello.dart' as hello;
import 'package:hello/person.dart';
import 'package:hello/student.dart';

void main(List<String> arguments) {
  hello.sayHello('${hello.calculate()}!');
  for (var i = 0; i < 5; i++) {
    hello.sayHello('${i + 1}');
  }

  var ck = Person('Clark', 'Kent');
  print(ck.fullName);

  var nobody = Person.anonymous();
  print(nobody.fullName);
  var cached = Person.fromCache('Michael', 'Brecker');
  print(cached.fullName);

  var student = Student('Clark', 'Kent', 'Kal-El');
  print(student);
  var astudent = AStudent('Yumi', 'Matsutoya', 'Yuming');
  print(astudent);

  var senior = SeniorDeveloper('Senior', 'Developer');
  print(senior.fullName);
  senior.coding();
  senior.manage();
  var junior = JuniorDeveloper('Junior', 'Developer');
  print(junior.fullName);
  junior.coding();

  print(PersonType.values);
  // [PersonType.student, PersonType.employee]

  var dynamicList = [];
  dynamicList.add('Tokyo');
  dynamicList.add(1);
  print(dynamicList);

  var stringList = <String>[];
  stringList.add('Tokyo');
  // stringList.add(1);

  var heights = <String, int>{};
  heights['Tokyo Tower'] = 333;
  heights['Skytree Tower'] = 634;

  var nullableMap = <String, String?>{};
  nullableMap['Middlesbrough'] = 'Transport bridge';
  nullableMap['New York'] = 'Status of Liberty';
  nullableMap['Barnmouth'] = null;
  print(nullableMap);

// tryAsync4();
  tryIsolate1();
}
