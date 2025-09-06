import 'package:cactoos_dart/cactoos_dart.dart';
import 'package:test/test.dart';

void main() {
  group('Or of', () {
    test(
      'boolean callbacks',
      () => expect(Or.of(() => false, () => false).value(), false),
    );

    test(
      'boolean scalars',
      () =>
          expect(ScalarOf.value(true).or(ScalarOf.value(false)).value(), true),
    );
  });
}
