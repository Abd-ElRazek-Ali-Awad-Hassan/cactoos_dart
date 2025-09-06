import 'package:cactoos_dart/cactoos_dart.dart';
import 'package:test/test.dart';

void main() {
  group('And of', () {
    test('boolean callbacks', () {
      expect(And.of(() => true, () => true).value(), true);
    });

    test('boolean scalars', () {
      expect(ScalarOf.value(true).and(ScalarOf.value(true)).value(), true);
    });
  });
}
