import 'dart:convert';
import 'dart:io';

import '../../abstractions/future_envelope.dart';

/// [LinesOf] is a [FutureEnvelope] that returns the lines of a file.
///
/// Example:
/// ```dart
/// final file = await MemoryFileSystem.test()
///     .file('test.txt')
///     .writeAsString('test\ntest2\n test3');
///
/// final lines = await LinesOf(file);
///
/// expect(lines, ['test', 'test2', ' test3']);
/// ```
final class LinesOf extends FutureEnvelope<Iterable<String>> {
  /// Creates a new [LinesOf] that wraps the given [file].
  ///
  /// The lines of [file] will be returned.
  ///
  /// Throws [PathNotFoundException] if [file] does not exist.
  ///
  /// Throws [IOException] if an I/O error occurs.
  ///
  /// Throws [FileSystemException] if an error occurs.
  LinesOf(File file, {Encoding encoding = utf8})
    : super(future: () async => await file.readAsLines(encoding: encoding));
}
