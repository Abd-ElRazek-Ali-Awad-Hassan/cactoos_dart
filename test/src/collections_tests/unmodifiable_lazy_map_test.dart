import 'package:cactoos_dart/cactoos_dart.dart';
import 'package:test/test.dart';

void main() {
  group('UnmodifiableLazyMap', () {
    test('get value given key', () {
      final map = UnmodifiableLazyMap(
        [1, 2, 3],
        key: (e) => e,
        value: (e) => '$e',
      );
      expect(map[1], '1');
    });

    test('get keys', () {
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
  });
}
