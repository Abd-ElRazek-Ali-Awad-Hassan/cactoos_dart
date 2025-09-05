import 'package:cactoos_dart/cactoos_dart.dart';
import 'package:test/test.dart';

void main() {
  group('Mapped', () {
    test('empty when src are empty', () {
      expect(Mapped([], elementMapped: (e) => e), isEmpty);
    });

    test('map elements', () {
      expect(Mapped([1, 2, 3], elementMapped: (e) => '$e'), ['1', '2', '3']);
    });
  });
}
