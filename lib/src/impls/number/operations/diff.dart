import '../number.dart';
import '../../../interfaces/scalar.dart';
import '../../../abstractions/scalar_envelope.dart';

/// A [Scalar] implementation that represents the difference between two numbers.
///
/// This class calculates the result of subtracting one number from another.
///
/// Example:
/// ```dart
/// final a = Number(10);
/// final b = Number(3);
/// final diff = Diff(a, b);
/// print(diff.value()); // Prints: 7
///
/// // Using convenience constructor
/// final diff2 = Diff.betweenNumbers(10, 3);
/// print(diff2.value()); // Prints: 7
/// ```
final class Diff extends ScalarEnvelope<num> {
  /// Creates a new [Diff] from two numeric values.
  ///
  /// The result will be [number] - [other].
  Diff.betweenNumbers(num number, num other)
    : this(Number(number), Number(other));

  /// Creates a new [Diff] from two [Scalar<num>] objects.
  ///
  /// The result will be [number].value() - [other].value().
  Diff(Scalar<num> number, Scalar<num> other)
    : super(scalar: () => number.value() - other.value());
}
