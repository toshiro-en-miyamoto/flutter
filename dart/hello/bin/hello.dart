import 'package:hello/hello.dart' as hello;

void main(List<String> arguments) {
  hello.sayHello('${hello.calculate()}!');
  for (var i = 0; i < 5; i++) {
    hello.sayHello('${i + 1}');
  }
}
