import 'dart:convert';
import 'dart:io';

import 'package:cactoos_dart/cactoos_dart.dart';
import 'package:file/memory.dart';
import 'package:test/test.dart';

void main() {
  group('JsonOfFile', () {
    test('returns json content of file', () async {
      final content = {'id': 1, 'name': 'test', 'age': 20};

      final file = await MemoryFileSystem.test()
          .file('test.txt')
          .writeAsString(jsonEncode(content));

      expect(await JsonOfFile(file), content);
    });

    test('throws PathNotFoundException on non existed file', () async {
      expect(
        () async => await JsonOfFile.from('test.txt'),
        throwsA(isA<PathNotFoundException>()),
      );
    });
  });
}
