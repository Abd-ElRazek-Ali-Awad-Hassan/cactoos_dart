import 'package:cactoos_dart/cactoos_dart.dart';
import 'package:test/test.dart';

void main() {
  group('Not', () {
    test('of boolean result', () {
      expect(Not.of(() => true).value(), false);
    });

    test('of boolean scalar', () {
      expect(ScalarOf.fromValue(false).negate().value(), true);
    });
  });
}
