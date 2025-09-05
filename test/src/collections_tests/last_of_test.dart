import 'package:cactoos_dart/cactoos_dart.dart';
import 'package:test/test.dart';

void main() {
  group('LastOf', () {
    test('returns default when list is empty.', () {
      expect(LastOf([], defaultValue: 0).value(), 0);
    });

    test('returns last element', () {
      expect(LastOf([1, 2, 3], defaultValue: 0).value(), 3);
    });
  });
}
