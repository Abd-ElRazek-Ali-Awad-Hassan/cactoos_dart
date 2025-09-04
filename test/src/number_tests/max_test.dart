import 'package:cactoos_dart/cactoos_dart.dart';
import 'package:test/test.dart';

void main() {
  group('Max', () {
    test('of two numbers', () {
      expect(Max.ofTwoNumbers(1, 2).value(), 2);
    });

    test('of numbers', () {
      expect(Max.ofNumbers([1, 2, 0, -1]).value(), 2);
    });

    test('of scalars', () {
      expect(
        Max([
          Number(1),
          Number(2),
          Number.negative(2),
          Number.negative(100),
          Number.negative(100.5),
        ]).value(),
        2,
      );
    });

    test('of scalars', () {
      expect(() => Min([]).value(), throwsA(isA<AssertionError>()));
    });
  });
}
