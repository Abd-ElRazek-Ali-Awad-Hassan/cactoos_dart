import '../../../interfaces/scalar.dart';
import '../../../abstractions/scalar_envelope.dart';

/// A [Scalar] implementation that checks if one numeric scalar value is greater than another.
///
/// This class compares two numeric scalar values using the greater than operator (>).
///
/// Example:
/// ```dart
/// final age = ScalarOf(() => 25);
/// final minimumAge = ScalarOf(() => 18);
/// final isAdult = GreaterThan(age, minimumAge);
/// 
/// if (isAdult.value()) {
///   // Handle case when age is greater than minimum age
/// }
/// ```
final class GreaterThan extends ScalarEnvelope<bool> {
  /// Creates a new [GreaterThan] that compares two numeric scalar values.
  ///
  /// Returns true if [value] is greater than [other] when evaluated.
  GreaterThan(Scalar<num> value, Scalar<num> other)
    : super(scalar: () => value.value() > other.value());
}

/// Extension methods for [Scalar<num>] objects to provide greater than comparison functionality.
///
/// Example:
/// ```dart
/// final age = ScalarOf(() => 25);
/// final minimumAge = ScalarOf(() => 18);
/// final isAdult = age.greaterThan(minimumAge);
/// ```
extension GreaterThanScalar on Scalar<num> {
  /// Returns a new [Scalar<bool>] that checks if this scalar is greater than [other].
  Scalar<bool> greaterThan(Scalar<num> other) => GreaterThan(this, other);
}
