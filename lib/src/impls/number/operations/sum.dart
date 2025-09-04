import '../number.dart';
import '../../../interfaces/scalar.dart';
import '../../../abstractions/scalar_envelope.dart';

/// A [Scalar] implementation that represents the sum of multiple numbers.
///
/// This class calculates the sum of a collection of [Scalar<num>] objects.
///
/// Example:
/// ```dart
/// final a = Number(10);
/// final b = Number(20);
/// final sum = Sum([a, b]);
/// print(sum.value()); // Prints: 30
///
/// // Using convenience constructors
/// final sum2 = Sum.of(10, 20);
/// print(sum2.value()); // Prints: 30
///
/// final sum3 = Sum.ofNumbers([10, 20, 30]);
/// print(sum3.value()); // Prints: 60
/// ```
final class Sum extends ScalarEnvelope<num> {
  /// Creates a new [Sum] from two numeric values.
  ///
  /// The [number] and [other] parameters are the numbers to be summed.
  Sum.of(num number, num other) : this([Number(number), Number(other)]);

  /// Creates a new [Sum] from an iterable of numeric values.
  ///
  /// The [numbers] parameter is the collection of numbers to be summed.
  Sum.ofNumbers(Iterable<num> numbers) : this(numbers.map((e) => Number(e)));

  /// Creates a new [Sum] from an iterable of [Scalar<num>] objects.
  ///
  /// The [numbers] parameter is the collection of scalar numbers to be summed.
  /// If empty, the sum will be 0.
  Sum([Iterable<Scalar<num>> numbers = const []])
    : super(scalar: () => numbers.fold(0, (v, e) => v + e.value()));
}
