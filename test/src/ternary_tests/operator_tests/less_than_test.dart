import 'package:cactoos_dart/cactoos_dart.dart';
import 'package:test/test.dart';

void main() {
  group('Less Than', () {
    test('between scalars', () {
      expect(Number(2).plus(Number(4)).lessThan(Number(8)).value(), isTrue);
      expect(Number(1).plus(Number(1)).lessThan(Number(2)).value(), isFalse);
    });
  });
}
