import 'package:cactoos_dart/cactoos_dart.dart';
import 'package:test/test.dart';

void main() {
  group('Sum between', () {
    test('2 numbers', () {
      expect(Sum.of(1, 2).value(), 3);
    });

    test('multi numbers', () {
      expect(Sum.ofNumbers([1, 2, 4]).value(), 7);
    });

    test('scalar numbers', () {
      expect(Sum([Number(1), Number(2), Number(4)]).value(), 7);
    });
  });
}
