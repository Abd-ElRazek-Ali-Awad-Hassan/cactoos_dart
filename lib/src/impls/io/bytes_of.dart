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
/// final bytesFuture = BytesOf(File('path/to/image.png'));
/// final bytes = await bytesFuture;
/// // Use bytes for image processing, etc.
/// ```
final class BytesOf extends FutureEnvelope<Uint8List> {
  /// Creates a new [BytesOf] from a [File] object.
  ///
  /// The [file] parameter is the file to be read as bytes.
  BytesOf(File file) : super(future: () async => await file.readAsBytes());
}
