import 'package:cactoos_dart/cactoos_dart.dart';
import 'package:test/test.dart';

void main() {
  group('MappedFuture', () {
    test('maps a src future to target', () async {
      expect(
        await MappedFuture(
          src: () => MappedFuture(src: () => Future.value('2'), map: int.parse),
          map: (v) => v.toString(),
        ),
        '2',
      );
    });
  });
}
