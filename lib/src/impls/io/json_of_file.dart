import 'dart:io';
import 'dart:convert';
import 'text_of_file.dart';
import '../../abstractions/future_envelope.dart';

/// A [Future] implementation that reads and parses a JSON file.
///
/// This class provides a way to asynchronously read a JSON file and parse its contents
/// into a [Map<String, dynamic>] object.
///
/// Example:
/// ```dart
/// final jsonFuture = JsonOfFile.from('path/to/file.json');
/// final jsonMap = await jsonFuture;
/// print(jsonMap['key']); // Prints the value associated with 'key'
/// ```
final class JsonOfFile extends FutureEnvelope<Map<String, dynamic>> {
  /// Creates a new [JsonOfFile] from a file path.
  ///
  /// The [path] parameter is the path to the JSON file to be read and parsed.
  /// The [encoding] parameter is the encoding to use when reading the file (defaults to UTF-8).
  JsonOfFile.from(String path, {Encoding encoding = utf8})
    : this(File(path), encoding: encoding);

  /// Creates a new [JsonOfFile] from a [File] object.
  ///
  /// The [file] parameter is the JSON file to be read and parsed.
  /// The [encoding] parameter is the encoding to use when reading the file (defaults to UTF-8).
  JsonOfFile(File file, {Encoding encoding = utf8})
    : super(
        future:
            () async => jsonDecode(await TextOfFile(file, encoding: encoding)),
      );
}
