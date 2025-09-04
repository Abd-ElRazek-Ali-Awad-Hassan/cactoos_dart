import '../../abstractions/text_envelope.dart';
import '../../interfaces/text.dart';

/// A [Text] implementation that converts another [Text] to lowercase.
///
/// This class wraps another [Text] object and converts its string representation to lowercase.
///
/// Example:
/// ```dart
/// final text = PlainText('Hello, World!');
/// final lowerText = LowerCaseText(text);
/// print(lowerText); // Prints: hello, world!
/// ```
final class LowerCaseText extends TextEnvelope {
  /// Creates a new [LowerCaseText] that wraps the given [text].
  ///
  /// The string representation of [text] will be converted to lowercase.
  LowerCaseText(Text text) : super(() => '$text'.toLowerCase());
}
