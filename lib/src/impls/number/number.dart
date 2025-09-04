import 'operations/div.dart';
import 'operations/mul.dart';
import 'operations/sum.dart';
import 'operations/diff.dart';
import '../../interfaces/scalar.dart';
import '../../abstractions/scalar_envelope.dart';

/// A [Scalar] implementation that represents a numeric value.
///
/// This class provides various constructors for creating number instances
/// and serves as a base for numeric operations.
///
/// Example:
/// ```dart
/// final number = Number(42);
/// print(number.value()); // Prints: 42
///
/// final zero = Number.zero();
/// print(zero.value()); // Prints: 0
///
/// final negative = Number.negative(42);
/// print(negative.value()); // Prints: -42
///
/// final parsed = Number.parse('42');
/// print(parsed.value()); // Prints: 42
/// ```
final class Number extends ScalarEnvelope<num> {
  /// Creates a new [Number] with a value of zero.
  Number.zero() : this._(() => 0);

  /// Creates a new [Number] with the given value.
  Number(num value) : this._(() => value);

  /// Creates a new [Number] with the negative of the given value.
  Number.negative(num value) : this._(() => -value);

  /// Creates a new [Number] by parsing the given string as an integer.
  Number.parse(String numAsString) : this._(() => int.parse(numAsString));

  /// Internal constructor that takes a function returning a numeric value.
  Number._(num Function() scalar) : super(scalar: scalar);
}

/// Extension methods for performing arithmetic operations on [Scalar<num>] objects.
///
/// These methods allow for fluent chaining of arithmetic operations on scalar numbers.
///
/// Example:
/// ```dart
/// final a = Number(10);
/// final b = Number(5);
/// final result = a.plus(b).div(Number(3));
/// print(result.value()); // Prints: 5
/// ```
extension SmartScalarNumOps on Scalar<num> {
  /// Returns the difference between this scalar and another.
  Scalar<num> min(Scalar<num> other) => Diff(this, other);

  /// Returns the sum of this scalar and another.
  Scalar<num> plus(Scalar<num> other) => Sum([this, other]);

  /// Returns the result of dividing this scalar by another.
  Scalar<num> div(Scalar<num> divisor) => Div(this, divisor);

  /// Returns the result of multiplying this scalar by another.
  Scalar<num> mul(Scalar<num> multiplier) => Mul(this, multiplier);
}
