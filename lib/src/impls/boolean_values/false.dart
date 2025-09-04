import '../../abstractions/scalar_envelope.dart';

/// A [Scalar] that always returns `false`.
///
/// This class provides a simple way to create a boolean scalar with a constant value of `false`.
///
/// Example:
/// ```dart
/// final falseValue = False();
/// print(falseValue.value()); // Prints: false
/// ```
final class False extends ScalarEnvelope<bool> {
  /// Creates a new [False] scalar.
  False() : super(scalar: () => false);
}
