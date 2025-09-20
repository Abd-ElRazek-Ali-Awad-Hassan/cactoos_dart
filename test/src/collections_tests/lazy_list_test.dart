import 'package:cactoos_dart/cactoos_dart.dart';
import 'package:test/test.dart';

void main() {
  group('LazyList', () {
    test('getting value for a given index', () {
      final list = LazyList(src: () => [1, 2, 3]);

      expect(list[2], 3);
    });

    test('changing value for a given index', () {
      final list = LazyList(src: () => [1, 2, 3]);

      list[2] = 2;

      expect(list[2], 2);
    });

    test('clearing list', () {
      final list = LazyList(src: () => [1, 2, 3]);

      list.clear();

      expect(list, isEmpty);
    });

    test('getting length', () {
      final list = LazyList(src: () => [1, 2, 3]);

      expect(list.length, 3);
    });

    test('removing value for a given index', () {
      final list = LazyList(src: () => [1, 2, 3]);

      expect(list.removeAt(0), 1);

      expect(list, [2, 3]);
    });

    test('src is not called before first access', () {
      int count = 0;

      LazyList(
        src: () {
          final elements = [];

          count++;

          elements.addAll([1]);

          return elements;
        },
      );

      expect(count, 0);
    });
  });
}
