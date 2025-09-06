import 'package:cactoos_dart/cactoos_dart.dart';
import 'package:test/test.dart';

void main() {
  group('LazyMap', () {
    test('getting value for a given key', () {
      final map = LazyMap([1, 2, 3], key: (e) => '$e', value: (e) => e);

      expect(map['2'], 2);
    });

    test('changing value for a given key', () {
      final map = LazyMap([1, 2, 3], key: (e) => '$e', value: (e) => e);

      map['2'] = 3;

      expect(map['2'], 3);
    });

    test('clearing map', () {
      final map = LazyMap([1, 2, 3], key: (e) => '$e', value: (e) => e);

      map.clear();

      expect(map, isEmpty);
    });

    test('getting keys', () {
      final map = LazyMap([1, 2, 3], key: (e) => '$e', value: (e) => e);

      expect(map.keys, ['1', '2', '3']);
    });

    test('removing value', () {
      final map = LazyMap([1, 2, 3], key: (e) => '$e', value: (e) => e);

      expect(map.remove('1'), 1);

      expect(map, {'2': 2, '3': 3});
    });

    test('key is not called before first access', () {
      int count = 0;

      LazyMap(
        [1, 2, 3],
        key: (e) {
          count++;

          return e;
        },
        value: (e) => e,
      );

      expect(count, 0);
    });
  });
}
