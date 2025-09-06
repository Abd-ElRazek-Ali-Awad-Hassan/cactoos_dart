import 'package:cactoos_dart/cactoos_dart.dart';
import 'package:test/test.dart';

void main() {
  group('UnmodifiableLazyMap', () {
    test('getting value for a given key', () {
      final map = UnmodifiableLazyMap(
        [1, 2, 3],
        key: (e) => e,
        value: (e) => '$e',
      );
      expect(map[1], '1');
    });

    test('getting keys', () {
      final map = UnmodifiableLazyMap(
        [1, 2, 3],
        key: (e) => e,
        value: (e) => '$e',
      );
      expect(map.keys, [1, 2, 3]);
    });

    test('key is not called before getting values', () {
      int count = 0;

      UnmodifiableLazyMap(
        [1, 2, 3],
        key: (e) {
          count++;
          return e;
        },
        value: (e) => '$e',
      );

      expect(count, 0);
    });

    test('throws error on modifying an element', () {
      final map = UnmodifiableLazyMap(
        [1, 2, 3],
        key: (e) => e,
        value: (e) => '$e',
      );

      expect(() => map[1] = '1', throwsA(isA<UnsupportedError>()));
    });
  });
}
