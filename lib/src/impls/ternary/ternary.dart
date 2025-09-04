import '../../abstractions/scalar_envelope.dart';
import '../../interfaces/scalar.dart';
import '../scalar_of/scalar_of.dart';

/// A [Scalar] implementation that provides conditional logic (ternary operation).
///
/// This class evaluates a condition and returns one of two values based on the result.
/// It's similar to the ternary operator (`condition ? left : right`) in Dart.
///
/// Example:
/// ```dart
/// final isEven = ScalarOf(() => number % 2 == 0);
/// final result = Ternary(
///   condition: isEven,
///   left: ScalarOf.fromValue('Even'),
///   right: ScalarOf.fromValue('Odd'),
/// );
/// print(result.value()); // Prints: 'Even' or 'Odd' depending on the number
/// ```
final class Ternary<Result> extends ScalarEnvelope<Result> {
  /// Creates a new [Ternary] from functions.
  ///
  /// The [condition] function determines which value to return.
  /// If it returns `true`, the [left] function's result is returned.
  /// If it returns `false`, the [right] function's result is returned.
  Ternary.when({
    required bool Function() condition,
    required Result Function() left,
    required Result Function() right,
  }) : this(
         condition: ScalarOf(condition),
         left: ScalarOf(left),
         right: ScalarOf(right),
       );

  /// Creates a new [Ternary] from [Scalar] objects.
  ///
  /// The [condition] scalar determines which value to return.
  /// If it returns `true`, the [left] scalar's value is returned.
  /// If it returns `false`, the [right] scalar's value is returned.
  Ternary({
    required Scalar<bool> condition,
    required Scalar<Result> left,
    required Scalar<Result> right,
  }) : super(scalar: () => condition.value() ? left.value() : right.value());
}
