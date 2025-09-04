/// A scalar is an object that encapsulates a single value of type [Value].
///
/// This interface represents the most primitive abstraction in the library.
/// It provides a way to retrieve a value of type [Value].
///
/// Example:
/// ```dart
/// final Scalar<int> five = ScalarOf.fromValue(5);
/// print(five.value()); // 5
/// ```
abstract interface class Scalar<Value> {
  /// Returns the encapsulated value.
  ///
  /// This method should be implemented to return the value
  /// that this scalar represents.
  Value value();
}
