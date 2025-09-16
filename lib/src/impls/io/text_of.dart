import 'dart:convert';
import 'dart:io';

import '../../abstractions/future_envelope.dart';

/// A [Future] implementation that reads the contents of a file as a string.
///
/// This class provides a way to asynchronously read the contents of a file
/// and convert it to a string using the specified encoding.
///
/// Example:
/// ```dart
/// final textFuture = TextOf(File('path/to/file.txt'));
/// final text = await textFuture;
/// print(text); // Prints the contents of the file
/// ```
final class TextOf extends FutureEnvelope<String> {
  /// Creates a new [TextOf] from a [File] object.
  ///
  /// The [file] parameter is the file to be read.
  /// The [encoding] parameter is the encoding to use when reading the file (defaults to UTF-8).
  TextOf(File file, {Encoding encoding = utf8})
    : super(future: () async => await file.readAsString(encoding: encoding));
}
