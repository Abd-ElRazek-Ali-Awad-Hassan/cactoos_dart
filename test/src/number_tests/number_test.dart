import 'package:cactoos_dart/cactoos_dart.dart';
import 'package:test/test.dart';

void main() {
  group('Number', () {
    test('from num', () {
      expect(Number(1).value(), 1);
    });

    test('from string', () {
      expect(Number.parse('-1').value(), -1);
    });

    test('equality', () {
      expect(Number.parse('-1'), Number.negative(1));
    });
  });
}
