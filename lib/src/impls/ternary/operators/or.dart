import '../../scalar_of/scalar_of.dart';
import '../../../interfaces/scalar.dart';
import '../../../abstractions/scalar_envelope.dart';

/// A [Scalar] implementation that represents the logical OR of two boolean conditions.
///
/// This class evaluates two boolean conditions and returns true if either one is true.
///
/// Example:
/// ```dart
/// final hasAdminRole = ScalarOf(() => userRole == 'admin');
/// final hasModeratorRole = ScalarOf(() => userRole == 'moderator');
/// final canModerate = Or(hasAdminRole, hasModeratorRole);
///
/// if (canModerate.value()) {
///   // Allow moderation if user is either an admin OR a moderator
/// }
/// ```
final class Or extends ScalarEnvelope<bool> {
  /// Creates a new [Or] from two boolean functions.
  ///
  /// Returns true if either [leftCond] or [rightCond] returns true.
  Or.of(bool Function() leftCond, bool Function() rightCond)
    : this._([ScalarOf(leftCond), ScalarOf(rightCond)]);

  /// Creates a new [Or] from two [Scalar<bool>] objects.
  ///
  /// Returns true if either [leftCond] or [rightCond] evaluates to true.
  Or(Scalar<bool> leftCond, Scalar<bool> rightCond)
    : this._([leftCond, rightCond]);

  /// Internal constructor that takes an iterable of boolean conditions.
  ///
  /// Returns true if any of the conditions evaluate to true.
  Or._(Iterable<Scalar<bool>> conditions)
    : super(
        scalar: () {
          assert(conditions.isNotEmpty, 'conditions must not be empty');

          return conditions.fold(false, (prev, e) => prev || e.value());
        },
      );
}

/// Extension methods for [Scalar<bool>] to add the [or] operator.
extension OrScalar on Scalar<bool> {
  /// Creates a new [Or] from this [Scalar<bool>] and another [Scalar<bool>].
  Scalar<bool> or(Scalar<bool> other) => Or(this, other);
}
