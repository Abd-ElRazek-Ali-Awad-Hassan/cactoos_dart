import '../../abstractions/text_envelope.dart';
import '../../interfaces/text.dart';

/// A [Text] implementation that converts another [Text] to uppercase.
///
/// This class wraps another [Text] object and converts its string representation to uppercase.
///
/// Example:
/// ```dart
/// final text = PlainText('Hello, world!');
/// final upperText = UpperCaseText(text);
/// print(upperText); // Prints: HELLO, WORLD!
/// ```
final class UpperCaseText extends TextEnvelope {
  /// Creates a new [UpperCaseText] that wraps the given [text].
  ///
  /// The string representation of [text] will be converted to uppercase.
  UpperCaseText(Text text) : super(() => '$text'.toUpperCase());
}
