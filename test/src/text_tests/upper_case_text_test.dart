import 'package:cactoos_dart/cactoos_dart.dart';
import 'package:test/test.dart';

void main() {
  test('Upper case text', () {
    expect(UpperCaseText(PlainText('hellO')).toString(), 'HELLO');
  });
}
