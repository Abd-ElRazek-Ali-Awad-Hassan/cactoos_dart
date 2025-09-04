import 'package:cactoos_dart/cactoos_dart.dart';
import 'package:test/test.dart';

void main() {
  group('Greater Than', () {
    test('between scalars', () {
      expect(Number(2).plus(Number(4)).greaterThan(Number(5)).value(), isTrue);
      expect(Number(1).plus(Number(1)).greaterThan(Number(2)).value(), isFalse);
    });
  });
}
