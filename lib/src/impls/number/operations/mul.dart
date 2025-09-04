import '../../../interfaces/scalar.dart';
import '../../../abstractions/scalar_envelope.dart';
import '../number.dart';

/// A [Scalar] implementation that represents the product of two numbers.
///
/// This class calculates the result of multiplying one number by another.
///
/// Example:
/// ```dart
/// final a = Number(5);
/// final b = Number(3);
/// final product = Mul(a, b);
/// print(product.value()); // Prints: 15
///
/// // Using convenience constructor
/// final product2 = Mul.forNumber(5, 3);
/// print(product2.value()); // Prints: 15
/// ```
final class Mul extends ScalarEnvelope<num> {
  /// Creates a new [Mul] from two numeric values.
  ///
  /// The result will be [number] * [mulitplier].
  Mul.forNumber(num number, num mulitplier)
    : this(Number(number), Number(mulitplier));

  /// Creates a new [Mul] from two [Scalar<num>] objects.
  ///
  /// The result will be [number].value() * [mulitplier].value().
  Mul(Scalar<num> number, Scalar<num> mulitplier)
    : super(scalar: () => number.value() * mulitplier.value());
}
