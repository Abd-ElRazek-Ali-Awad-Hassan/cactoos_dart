import 'package:cactoos_dart/cactoos_dart.dart';
import 'package:test/test.dart';

void main() {
  test('Lower case text', () {
    expect(LowerCaseText(PlainText('HeLlO')).toString(), 'hello');
  });
}
