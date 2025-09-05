import 'package:cactoos_dart/cactoos_dart.dart';
import 'package:test/test.dart';

void main() {
  group('FirstOf', () {
    test('returns default when list is empty.', () {
      expect(FirstOf([], defaultValue: 0).value(), 0);
    });

    test('returns first element', () {
      expect(FirstOf([1], defaultValue: 0).value(), 1);
    });
  });
}
