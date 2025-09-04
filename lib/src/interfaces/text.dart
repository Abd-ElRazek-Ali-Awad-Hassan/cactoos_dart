/// A text is an object that can be converted to a string.
///
/// This interface represents a text abstraction in the library.
/// It provides a way to convert an object to a string representation.
///
/// Example:
/// ```dart
/// final Text hello = PlainText("Hello, World!");
/// print(hello); // Hello, World!
/// ```
abstract interface class Text {
  /// Returns the string representation of this text.
  ///
  /// This method should be implemented to return the string
  /// that this text represents.
  @override
  String toString();
}
