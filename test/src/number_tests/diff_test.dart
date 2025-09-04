import 'package:cactoos_dart/cactoos_dart.dart';
import 'package:test/test.dart';

void main() {
  group('Diff', () {
    test('between 2 numbers', () {
      expect(Diff.betweenNumbers(1, 2).value(), -1);
    });

    test('between scalar numbers', () {
      expect(Diff(Number(1), Number(2)).value(), -1);
    });
  });
}
