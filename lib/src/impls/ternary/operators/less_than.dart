import '../../../interfaces/scalar.dart';
import '../../../abstractions/scalar_envelope.dart';

/// A [Scalar] implementation that checks if one numeric scalar value is less than another.
///
/// This class compares two numeric scalar values using the less than operator (<).
///
/// Example:
/// ```dart
/// final age = ScalarOf(() => 15);
/// final adultAge = ScalarOf(() => 18);
/// final isMinor = LessThan(age, adultAge);
/// 
/// if (isMinor.value()) {
///   // Handle case when age is less than adult age
/// }
/// ```
final class LessThan extends ScalarEnvelope<bool> {
  /// Creates a new [LessThan] that compares two numeric scalar values.
  ///
  /// Returns true if [value] is less than [other] when evaluated.
  LessThan(Scalar<num> value, Scalar<num> other)
    : super(scalar: () => value.value() < other.value());
}

/// Extension methods for [Scalar<num>] objects to provide less than comparison functionality.
///
/// Example:
/// ```dart
/// final age = ScalarOf(() => 15);
/// final adultAge = ScalarOf(() => 18);
/// final isMinor = age.lessThan(adultAge);
/// ```
extension LessThanScalar on Scalar<num> {
  /// Returns a new [Scalar<bool>] that checks if this scalar is less than [other].
  Scalar<bool> lessThan(Scalar<num> other) => LessThan(this, other);
}
