import '../../abstractions/text_envelope.dart';
import '../../interfaces/text.dart';

/// A [Text] implementation that trims whitespace from the beginning and end of another [Text].
///
/// This class wraps another [Text] object and removes any leading and trailing whitespace
/// from its string representation.
///
/// Example:
/// ```dart
/// final text = PlainText('  Hello, world!  ');
/// final trimmedText = TrimmedText(text);
/// print(trimmedText); // Prints: Hello, world!
/// ```
final class TrimmedText extends TextEnvelope {
  /// Creates a new [TrimmedText] that wraps the given [text].
  ///
  /// The string representation of [text] will have leading and trailing whitespace removed.
  TrimmedText(Text text) : super(() => '$text'.trim());
}
