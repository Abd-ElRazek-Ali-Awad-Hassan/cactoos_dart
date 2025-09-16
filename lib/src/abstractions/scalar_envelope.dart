import '../interfaces/scalar.dart';
import 'package:equatable/equatable.dart';

/// An envelope for [Scalar] objects that provides equality comparison.
///
/// This abstract class implements the [Scalar] interface and extends [Equatable]
/// to provide equality comparison based on the value returned by [value()].
/// It serves as a base class for all scalar implementations in the library.
///
/// Example:
/// ```dart
/// class MyScalar extends ScalarEnvelope<int> {
///   MyScalar(int value) : super(scalar: () => value);
/// }
/// ```
abstract class ScalarEnvelope<Value> extends Equatable
    implements Scalar<Value> {
  /// Creates a new [ScalarEnvelope] with the given scalar function.
  ///
  /// The [scalar] function is called when [value()] is invoked.
  const ScalarEnvelope({required Value Function() scalar}) : _value = scalar;

  /// The function that returns the value of this scalar.
  final Value Function() _value;

  @override
  Value value() => _value();

  /// Returns a list containing the value of this scalar for equality comparison.
  @override
  List<Object?> get props => [value()];
}
