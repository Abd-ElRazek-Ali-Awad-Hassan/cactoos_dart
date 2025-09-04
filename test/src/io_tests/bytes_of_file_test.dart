import 'dart:io';

import 'package:cactoos_dart/cactoos_dart.dart';
import 'package:file/memory.dart';
import 'package:test/test.dart';

void main() {
  group('BytesOfFile', () {
    test('returns bytes of file', () async {
      final content = 'test text';

      final file = await MemoryFileSystem.test()
          .file('test.txt')
          .writeAsBytes(content.codeUnits);

      expect(String.fromCharCodes(await BytesOfFile(file)), content);
    });

    test('throws PathNotFoundException on non existed file', () async {
      expect(
        () async => await BytesOfFile.from('test.txt'),
        throwsA(isA<PathNotFoundException>()),
      );
    });
  });
}
