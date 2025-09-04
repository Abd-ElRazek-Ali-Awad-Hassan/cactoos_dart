import 'package:cactoos_dart/cactoos_dart.dart';
import 'package:test/test.dart';

void main() {
  group('Ternary', () {
    test('on scalars', () {
      expect(
        Ternary(
          condition: Number.zero()
              .greaterThan(Number.negative(1))
              .equals(True()),
          left: Ternary(
            condition: Number(1).greaterThan(Number(2)),
            left: Number(1),
            right: Number(2),
          ),
          right: Number.zero(),
        ).value(),
        2,
      );
    });

    test('on callbacks', () {
      expect(
        Ternary.when(
          left:
              Ternary.when(
                left: () => 2,
                right: () => 1,
                condition: () => false,
              ).value,
          right: () => 5,
          condition: () => true,
        ).value(),
        1,
      );
    });
  });
}
