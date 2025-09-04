import 'package:cactoos_dart/cactoos_dart.dart';
import 'package:test/test.dart';

void main() {
  test('Trimmed text', () {
    expect(TrimmedText(PlainText('    -hello+ ')).toString(), '-hello+');
  });
}
