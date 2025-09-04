import 'package:cactoos_dart/cactoos_dart.dart';
import 'package:test/test.dart';

void main() {
  group('Min', () {
    test('of two numbers', () {
      expect(Min.ofTwoNumbers(1, 2).value(), 1);
    });

    test('of numbers', () {
      expect(Min.ofNumbers([1, 2, 0, -1]).value(), -1);
    });

    test('of scalars', () {
      expect(
        Min([
          Number(1),
          Number(2),
          Number.negative(2),
          Number.negative(100),
          Number.negative(100.5),
        ]).value(),
        -100.5,
      );
    });

    test('of scalars', () {
      expect(() => Min([]).value(), throwsA(isA<AssertionError>()));
    });
  });
}
