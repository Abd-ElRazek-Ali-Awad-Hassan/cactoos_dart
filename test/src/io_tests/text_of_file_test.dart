import 'dart:io';

import 'package:cactoos_dart/cactoos_dart.dart';
import 'package:file/memory.dart';
import 'package:test/test.dart';

void main() {
  group('TextOfFile', () {
    test('returns text of file', () async {
      final expectedText = 'test text';

      final file = await MemoryFileSystem.test()
          .file('test.txt')
          .writeAsString(expectedText);

      expect(await TextOfFile(file), expectedText);
    });

    test('throws PathNotFoundException on non existed file', () async {
      expect(
        () async => await TextOfFile.from('test.txt'),
        throwsA(isA<PathNotFoundException>()),
      );
    });
  });
}
