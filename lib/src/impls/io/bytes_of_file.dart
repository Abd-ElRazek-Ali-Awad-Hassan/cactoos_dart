import 'dart:io';
import 'dart:typed_data';

import '../../abstractions/future_envelope.dart';

/// A [Future] implementation that reads the contents of a file as bytes.
///
/// This class provides a way to asynchronously read the binary contents of a file
/// as a [Uint8List].
///
/// Example:
/// ```dart
/// final bytesFuture = BytesOfFile.from('path/to/image.png');
/// final bytes = await bytesFuture;
/// // Use bytes for image processing, etc.
/// ```
final class BytesOfFile extends FutureEnvelope<Uint8List> {
  /// Creates a new [BytesOfFile] from a file path.
  ///
  /// The [path] parameter is the path to the file to be read as bytes.
  BytesOfFile.from(String path)
    : super(future: () async => await File(path).readAsBytes());

  /// Creates a new [BytesOfFile] from a [File] object.
  ///
  /// The [file] parameter is the file to be read as bytes.
  BytesOfFile(File file) : super(future: () async => await file.readAsBytes());
}
