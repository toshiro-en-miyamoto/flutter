enum PersonType { student, employee }

class Person {
  late String firstName;
  late String lastName;
  Person(this.firstName, this.lastName);
  String get fullName => '$firstName $lastName';
  Person.anonymous() {
    firstName = 'Jane';
    lastName = 'Doe';
  }
  factory Person.fromCache(String firstName, String lastName) {
    if (_cacheService.containsPerson(firstName, lastName)) {
      return _cacheService.getPerson(firstName, lastName);
    } else {
      return Person(firstName, lastName);
    }
  }
}

class _cacheService {
  static bool containsPerson(String firstName, String lastName) {
    return true;
  }

  static Person getPerson(String firstName, String lastName) {
    return Person('$firstName $lastName', 'from cache');
  }
}

abstract class APerson {
  String firstName;
  String lastName;
  APerson(this.firstName, this.lastName);
  String get fullName; // abstract method
}
