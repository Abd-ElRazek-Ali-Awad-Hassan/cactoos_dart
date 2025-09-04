import '../../scalar_of/scalar_of.dart';
import '../../../interfaces/scalar.dart';
import '../../../abstractions/scalar_envelope.dart';

/// A [Scalar] implementation that represents the logical NOT of a boolean condition.
///
/// This class negates the value of another boolean condition.
///
/// Example:
/// ```dart
/// final isAdult = ScalarOf(() => age >= 18);
/// final isMinor = Not(isAdult);
///
/// if (isMinor.value()) {
///   // Handle case for minors
/// }
/// ```
final class Not extends ScalarEnvelope<bool> {
  /// Creates a new [Not] from a boolean function.
  ///
  /// Returns the negation of the result of [callback].
  Not.of(bool Function() callback) : this(ScalarOf(callback));

  /// Creates a new [Not] from a [Scalar<bool>] object.
  ///
  /// Returns the negation of the value of [condition].
  Not(Scalar<bool> condition) : super(scalar: () => !condition.value());
}

/// Extension methods for [Scalar<bool>] objects to provide negation functionality.
///
/// Example:
/// ```dart
/// final isAdult = ScalarOf(() => age >= 18);
/// final isMinor = isAdult.negate();
/// ```
extension NotScalar on Scalar<bool> {
  /// Returns a new [Scalar<bool>] that is the negation of this scalar.
  Scalar<bool> negate() => Not(this);
}
