import 'package:cactoos_dart/cactoos_dart.dart';
import 'package:test/test.dart';

void main() {
  group('FirstOf', () {
    test('returns default when list is empty.', () {
      expect(FirstOf<num>([], defaultValue: Number(0)).value(), 0);
    });

    test('returns first element', () {
      expect(FirstOf<num>([1], defaultValue: Number(2)).value(), 1);
    });
  });
}
