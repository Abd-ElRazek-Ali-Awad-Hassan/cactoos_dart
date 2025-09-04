import 'package:cactoos_dart/cactoos_dart.dart';
import 'package:test/test.dart';

void main() {
  test('False scalar', () {
    expect(False().value(), isFalse);
  });
}
