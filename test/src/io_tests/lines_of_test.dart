import 'dart:io';

import 'package:cactoos_dart/cactoos_dart.dart';
import 'package:file/memory.dart';
import 'package:test/test.dart';

void main() {
  group('LinesOf', () {
    test('returns text of file', () async {
      final file = await MemoryFileSystem.test()
          .file('test.txt')
          .writeAsString('test\ntest2\n test3');

      expect(await LinesOf(file), ['test', 'test2', ' test3']);
    });

    test('throws PathNotFoundException on non existed file', () async {
      expect(
        () async => await LinesOf(File('test.txt')),
        throwsA(isA<PathNotFoundException>()),
      );
    });
  });
}
