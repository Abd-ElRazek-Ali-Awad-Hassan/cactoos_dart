import 'package:equatable/equatable.dart';

import '../interfaces/text.dart';

/// An envelope for [Text] objects that provides equality comparison.
///
/// This abstract class implements the [Text] interface and extends [Equatable]
/// to provide equality comparison based on the string returned by [toString()].
/// It serves as a base class for all text implementations in the library.
///
/// Example:
/// ```dart
/// class MyText extends TextEnvelope {
///   MyText(String text) : super(() => text);
/// }
/// ```
abstract class TextEnvelope extends Equatable implements Text {
  /// Creates a new [TextEnvelope] with the given text function.
  ///
  /// The [_text] function is called when [toString()] is invoked.
  TextEnvelope(this._text);

  /// The function that returns the string representation of this text.
  final String Function() _text;

  /// Returns the string representation of this text.
  @override
  String toString() => _text();

  /// Returns a list containing the string representation of this text for equality comparison.
  @override
  List<Object?> get props => [toString()];
}
