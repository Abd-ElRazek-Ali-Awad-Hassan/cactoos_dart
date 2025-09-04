import 'number.dart';
import 'dart:math' as math;
import '../../interfaces/scalar.dart';
import '../../abstractions/scalar_envelope.dart';

/// A [Scalar] implementation that finds the maximum value among a collection of numbers.
///
/// This class calculates the maximum value from a collection of numeric scalars.
///
/// Example:
/// ```dart
/// final a = Number(10);
/// final b = Number(5);
/// final c = Number(15);
/// final maximum = Max([a, b, c]);
/// print(maximum.value()); // Prints: 15
///
/// // Using convenience constructors
/// final max1 = Max.ofTwoNumbers(10, 5);
/// print(max1.value()); // Prints: 10
///
/// final max2 = Max.ofNumbers([10, 5, 15]);
/// print(max2.value()); // Prints: 15
/// ```
final class Max extends ScalarEnvelope<num> {
  /// Creates a new [Max] from two numeric values.
  ///
  /// Returns the maximum of [number] and [other].
  Max.ofTwoNumbers(num number, num other)
    : this([Number(number), Number(other)]);

  /// Creates a new [Max] from an iterable of numeric values.
  ///
  /// Returns the maximum value in [numbers].
  Max.ofNumbers(Iterable<num> numbers) : this(numbers.map((e) => Number(e)));

  /// Creates a new [Max] from an iterable of [Scalar<num>] objects.
  ///
  /// Returns the maximum value among all the scalars.
  /// Asserts that [scalars] is not empty.
  Max(Iterable<Scalar<num>> scalars)
    : super(
        scalar: () {
          assert(scalars.isNotEmpty, 'Scalars must not be empty');

          return _maxOf(scalars);
        },
      );

  /// Internal method to find the maximum value in a collection of scalars.
  static num _maxOf(Iterable<Scalar<num>> scalars) {
    var max = scalars.first.value();

    for (final e in scalars.skip(1)) {
      max = math.max(max, e.value());
    }

    return max;
  }
}
