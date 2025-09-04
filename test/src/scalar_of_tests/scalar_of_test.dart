import 'package:cactoos_dart/cactoos_dart.dart';
import 'package:test/test.dart';

void main() {
  group('ScalarOf', () {
    test('Scalar from value', () {
      expect(ScalarOf.fromValue(1).value(), 1);
    });

    test('Scalar from callback', () {
      expect(ScalarOf(() => 1).value(), 1);
    });
  });
}
