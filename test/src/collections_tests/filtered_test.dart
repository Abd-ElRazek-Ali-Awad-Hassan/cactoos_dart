import 'package:cactoos_dart/cactoos_dart.dart';
import 'package:test/test.dart';

void main() {
  group('Filtered', () {
    test('empty when src are empty', () {
      expect(Filtered([], condition: (e) => '$e'.isNotEmpty), isEmpty);
    });

    test('filter elements', () {
      expect(Filtered(['', '1', '2'], condition: (e) => e.isNotEmpty), [
        '1',
        '2',
      ]);
    });
  });
}
