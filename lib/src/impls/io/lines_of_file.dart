import 'dart:io';

import '../../abstractions/future_envelope.dart';

/// [LinesOfFile] is a [FutureEnvelope] that returns the lines of a file.
///
/// Example:
/// ```dart
/// final file = await MemoryFileSystem.test()
///     .file('test.txt')
///     .writeAsString('test\ntest2\n test3');
///
/// final lines = await LinesOfFile(file);
///
/// expect(lines, ['test', 'test2', ' test3']);
/// ```
final class LinesOfFile extends FutureEnvelope<Iterable<String>> {
  /// Creates a new [LinesOfFile] that wraps the file at [path].
  ///
  /// The lines of the file at [path] will be returned.
  ///
  /// Throws [PathNotFoundException] if the file at [path] does not exist.
  ///
  /// Throws [IOException] if an I/O error occurs.
  ///
  /// Throws [FileSystemException] if an error occurs.
  LinesOfFile.from(String path) : this(File(path));

  /// Creates a new [LinesOfFile] that wraps the given [file].
  ///
  /// The lines of [file] will be returned.
  ///
  /// Throws [PathNotFoundException] if [file] does not exist.
  ///
  /// Throws [IOException] if an I/O error occurs.
  ///
  /// Throws [FileSystemException] if an error occurs.
  LinesOfFile(File file) : super(future: () async => await file.readAsLines());
}
