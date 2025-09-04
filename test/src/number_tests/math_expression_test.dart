import 'package:cactoos_dart/cactoos_dart.dart';
import 'package:test/test.dart';

void main() {
  test('math expression on numbers', () {
    expect(
      Number(1)
          .plus(Number(2))
          .mul(Number(3).plus(Number(1)).min(Number(1)))
          .min(Number(1))
          .div(Number(2))
          .mul(Number(2))
          .value(),
      8,
    );
  });
}
