import 'lower_case_text.dart';
import 'plain_text.dart';
import 'upper_case_text.dart';

import '../../abstractions/text_envelope.dart';
import '../../interfaces/text.dart';

/// A [Text] implementation that capitalizes the first letter of each word.
///
/// This class wraps another [Text] object and converts its string representation
/// to have the first letter of each word capitalized and the rest in lowercase.
///
/// Example:
/// ```dart
/// final text = PlainText('hello world');
/// final capitalizedText = CapitalizedText(text);
/// print(capitalizedText); // Prints: Hello World
/// ```
final class CapitalizedText extends TextEnvelope {
  /// Creates a new [CapitalizedText] that wraps the given [text].
  ///
  /// The string representation of [text] will have the first letter of each word
  /// capitalized and the rest in lowercase.
  CapitalizedText(Text text)
    : super(
        () => switch ('$text') {
          '' => '',
          String txt =>
            txt.contains(' ')
                ? txt
                    .split(' ')
                    .map((e) => CapitalizedText(PlainText(e)))
                    .join(' ')
                : [
                  UpperCaseText(PlainText(txt[0])),
                  LowerCaseText(PlainText(txt.substring(1))),
                ].join(),
        },
      );
}
