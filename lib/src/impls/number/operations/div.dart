import '../number.dart';
import '../../../interfaces/scalar.dart';
import '../../../abstractions/scalar_envelope.dart';

/// A [Scalar] implementation that represents the division of two numbers.
///
/// This class calculates the result of dividing one number by another.
/// It asserts that the divisor is greater than 0 to avoid division by zero.
///
/// Example:
/// ```dart
/// final a = Number(10);
/// final b = Number(2);
/// final quotient = Div(a, b);
/// print(quotient.value()); // Prints: 5
///
/// // Using convenience constructor
/// final quotient2 = Div.betweenNumbers(10, 2);
/// print(quotient2.value()); // Prints: 5
/// ```
final class Div extends ScalarEnvelope<num> {
  /// Creates a new [Div] from two numeric values.
  ///
  /// The result will be [dividend] / [divisor].
  /// Asserts that [divisor] is greater than 0.
  Div.betweenNumbers(num dividend, num divisor)
    : this(Number(dividend), Number(divisor));

  /// Creates a new [Div] from two [Scalar<num>] objects.
  ///
  /// The result will be [dividend].value() / [divisor].value().
  /// Asserts that [divisor].value() is greater than 0.
  Div(Scalar<num> dividend, Scalar<num> divisor)
    : super(
        scalar: () {
          assert(divisor.value() > 0, 'divisor must be greater than 0');
          return dividend.value() / divisor.value();
        },
      );
}
