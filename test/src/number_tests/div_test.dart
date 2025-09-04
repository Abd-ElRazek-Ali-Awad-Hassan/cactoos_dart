import 'package:cactoos_dart/cactoos_dart.dart';
import 'package:test/test.dart';

void main() {
  group('Div', () {
    test('between numbers', () {
      expect(Div.betweenNumbers(1, 2).value(), 0.5);
    });

    test('between scalars', () {
      expect(Div(Number(1), Number(2)).value(), 0.5);
    });

    test('throws AssertionError when divisor is zero', () {
      expect(
        () => Div.betweenNumbers(1, 0).value(),
        throwsA(isA<AssertionError>()),
      );
    });
  });
}
