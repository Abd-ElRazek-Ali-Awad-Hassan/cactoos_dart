import 'package:cactoos_dart/cactoos_dart.dart';
import 'package:test/test.dart';

void main() {
  test('Capitalized text', () {
    expect(CapitalizedText(PlainText('hellO world')).toString(), 'Hello World');
  });
}
