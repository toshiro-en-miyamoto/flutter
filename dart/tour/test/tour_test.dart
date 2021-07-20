// import 'package:tour/tour.dart';
import 'package:test/test.dart';

void main() {
  test('default value of nullable', () {
    int? lineCount;
    expect(lineCount, isNull);
    expect(lineCount, isA<int?>());
    expect(lineCount, isNot(isA<int>()));
  });
  test('type inference fails', () {
    var lineCount;
    expect(lineCount, isNull);
    expect(lineCount, isA<Null>());
  });
}
