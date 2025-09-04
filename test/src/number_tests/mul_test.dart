import 'package:cactoos_dart/cactoos_dart.dart';
import 'package:test/test.dart';

void main() {
  group('Mul', () {
    test('for number', () {
      expect(Mul.forNumber(1, 2).value(), 2);
    });

    test('for scalar number', () {
      expect(Mul(Number(1), Number(2)).value(), 2);
    });
  });
}
