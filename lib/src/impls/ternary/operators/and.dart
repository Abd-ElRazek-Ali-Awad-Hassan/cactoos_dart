import '../../scalar_of/scalar_of.dart';
import '../../../interfaces/scalar.dart';
import '../../../abstractions/scalar_envelope.dart';

/// A [Scalar] implementation that represents the logical AND of two boolean conditions.
///
/// This class evaluates two boolean conditions and returns true only if both are true.
///
/// Example:
/// ```dart
/// final isAdult = ScalarOf(() => age >= 18);
/// final hasPermission = ScalarOf(() => userHasPermission);
/// final canAccess = And(isAdult, hasPermission);
///
/// if (canAccess.value()) {
///   // Allow access only if user is an adult AND has permission
/// }
/// ```
final class And extends ScalarEnvelope<bool> {
  /// Creates a new [And] from two boolean functions.
  ///
  /// Returns true only if both [leftCond] and [rightCond] return true.
  And.of(bool Function() leftCond, bool Function() rightCond)
    : this._([ScalarOf(leftCond), ScalarOf(rightCond)]);

  /// Creates a new [And] from two [Scalar<bool>] objects.
  ///
  /// Returns true only if both [leftCond] and [rightCond] evaluate to true.
  And(Scalar<bool> leftCond, Scalar<bool> rightCond)
    : this._([leftCond, rightCond]);

  /// Internal constructor that takes an iterable of boolean conditions.
  ///
  /// Returns true only if all conditions evaluate to true.
  And._(Iterable<Scalar<bool>> conditions)
    : super(
        scalar: () {
          assert(conditions.isNotEmpty, 'conditions must not be empty');

          return conditions.fold(true, (prev, e) => prev && e.value());
        },
      );
}

/// Extension methods for [Scalar<bool>] to add the [and] operator.
extension AndScalar on Scalar<bool> {
  /// Creates a new [And] from this [Scalar<bool>] and another [Scalar<bool>].
  Scalar<bool> and(Scalar<bool> other) => And(this, other);
}
