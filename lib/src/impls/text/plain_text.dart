import '../../abstractions/text_envelope.dart';

/// A simple implementation of [Text] that wraps a plain string.
///
/// This class provides a way to create a [Text] object from a plain string.
///
/// Example:
/// ```dart
/// final text = PlainText('Hello, world!');
/// print(text); // Prints: Hello, world!
/// ```
final class PlainText extends TextEnvelope {
  /// Creates a new [PlainText] with the given string.
  ///
  /// The [text] parameter is the string to be wrapped.
  PlainText(String text) : super(() => text);
}
