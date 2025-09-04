import 'package:cactoos_dart/cactoos_dart.dart';
import 'package:test/test.dart';

void main() {
  group('Equals', () {
    test('between scalars', () {
      expect(Number(1).plus(Number(1)).equals(Number(2)).value(), isTrue);
      expect(Number(2).plus(Number(4)).equals(Number(3)).value(), isFalse);
    });
  });
}
