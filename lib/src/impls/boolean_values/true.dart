import '../../abstractions/scalar_envelope.dart';

/// A [Scalar] that always returns `true`.
///
/// This class provides a simple way to create a boolean scalar with a constant value of `true`.
///
/// Example:
/// ```dart
/// final trueValue = True();
/// print(trueValue.value()); // Prints: true
/// ```
final class True extends ScalarEnvelope<bool> {
  /// Creates a new [True] scalar.
  True() : super(scalar: () => true);
}
