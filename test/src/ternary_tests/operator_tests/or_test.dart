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
      () => expect(
        ScalarOf.fromValue(true).or(ScalarOf.fromValue(false)).value(),
        true,
      ),
    );
  });
}
