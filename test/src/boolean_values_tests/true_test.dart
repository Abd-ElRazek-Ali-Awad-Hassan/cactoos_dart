import 'package:cactoos_dart/cactoos_dart.dart';
import 'package:test/test.dart';

void main() {
  test('True scalar', () {
    expect(True().value(), isTrue);
  });
}
