import 'number.dart';
import 'dart:math' as math;
import '../../interfaces/scalar.dart';
import '../../abstractions/scalar_envelope.dart';

/// A [Scalar] implementation that finds the minimum value among a collection of numbers.
///
/// This class calculates the minimum value from a collection of numeric scalars.
///
/// Example:
/// ```dart
/// final a = Number(10);
/// final b = Number(5);
/// final c = Number(15);
/// final minimum = Min([a, b, c]);
/// print(minimum.value()); // Prints: 5
///
/// // Using convenience constructors
/// final min1 = Min.ofTwoNumbers(10, 5);
/// print(min1.value()); // Prints: 5
///
/// final min2 = Min.ofNumbers([10, 5, 15]);
/// print(min2.value()); // Prints: 5
/// ```
final class Min extends ScalarEnvelope<num> {
  /// Creates a new [Min] from two numeric values.
  ///
  /// Returns the minimum of [number] and [other].
  Min.ofTwoNumbers(num number, num other)
    : this([Number(number), Number(other)]);

  /// Creates a new [Min] from an iterable of numeric values.
  ///
  /// Returns the minimum value in [numbers].
  Min.ofNumbers(Iterable<num> numbers) : this(numbers.map((e) => Number(e)));

  /// Creates a new [Min] from an iterable of [Scalar<num>] objects.
  ///
  /// Returns the minimum value among all the scalars.
  /// Asserts that [scalars] is not empty.
  Min(Iterable<Scalar<num>> scalars)
    : super(
        scalar: () {
          assert(scalars.isNotEmpty, 'Scalars must not be empty');

          return _minOf(scalars);
        },
      );

  /// Internal method to find the minimum value in a collection of scalars.
  static num _minOf(Iterable<Scalar<num>> scalars) {
    var min = scalars.first.value();

    for (final e in scalars.skip(1)) {
      min = math.min(min, e.value());
    }

    return min;
  }
}
