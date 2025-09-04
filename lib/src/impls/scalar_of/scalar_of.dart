import '../../abstractions/scalar_envelope.dart';

/// A simple implementation of [Scalar] that wraps a value or a function that returns a value.
///
/// This class provides a way to create a [Scalar] object from either a direct value
/// or a function that returns a value.
///
/// Example:
/// ```dart
/// // From a direct value
/// final scalar1 = ScalarOf.fromValue(42);
/// print(scalar1.value()); // Prints: 42
///
/// // From a function
/// final scalar2 = ScalarOf(() => 42);
/// print(scalar2.value()); // Prints: 42
/// ```
final class ScalarOf<Value> extends ScalarEnvelope<Value> {
  /// Creates a new [ScalarOf] from a direct value.
  ///
  /// The [value] parameter is the value to be wrapped.
  ScalarOf.fromValue(Value value) : this(() => value);

  /// Creates a new [ScalarOf] from a function that returns a value.
  ///
  /// The [scalar] parameter is the function that returns the value.
  ScalarOf(Value Function() scalar) : super(scalar: scalar);
}
