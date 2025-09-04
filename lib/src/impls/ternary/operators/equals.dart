import '../../../interfaces/scalar.dart';
import '../../../abstractions/scalar_envelope.dart';

/// A [Scalar] implementation that checks if two scalar values are equal.
///
/// This class compares the values of two scalars using the equality operator (==).
///
/// Example:
/// ```dart
/// final age = ScalarOf(() => 25);
/// final requiredAge = ScalarOf(() => 18);
/// final isOldEnough = Equals(age, requiredAge);
///
/// if (isOldEnough.value()) {
///   // Handle case when age equals required age
/// }
/// ```
final class Equals extends ScalarEnvelope<bool> {
  /// Creates a new [Equals] that compares two scalar values.
  ///
  /// Returns true if [value] equals [other] when evaluated.
  Equals(Scalar value, Scalar other)
    : super(scalar: () => value.value() == other.value());
}

/// Extension methods for [Scalar] objects to provide equality comparison functionality.
///
/// Example:
/// ```dart
/// final age = ScalarOf(() => 25);
/// final requiredAge = ScalarOf(() => 18);
/// final isOldEnough = age.equals(requiredAge);
/// ```
extension EqualsScalar on Scalar {
  /// Returns a new [Scalar<bool>] that checks if this scalar equals [other].
  Scalar<bool> equals(Scalar other) => Equals(this, other);
}
