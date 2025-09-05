import 'package:cactoos_dart/cactoos_dart.dart';
import 'package:cactoos_dart/src/impls/length/length.dart';
import 'package:test/test.dart';

void main() {
  group('Length', () {
    test('length of string', () {
      expect(Length.ofString('hello').value(), 5);
    });

    test('length of Iterable', () {
      expect(Length.ofIterable([1, 2, 3]).value(), 3);
    });

    test('length of Map', () {
      expect(Length.ofMap({'0': '1'}).value(), 1);
    });
  });
}
