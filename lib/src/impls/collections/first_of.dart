import '../../abstractions/scalar_envelope.dart';

/// A [Scalar] that returns the first element of the [values] iterable, or [defaultValue] if the iterable is empty.
///
/// This class wraps an iterable of elements and provides a way to retrieve the first element of the iterable.
/// If the iterable is empty, [defaultValue] is returned instead.
final class FirstOf<E> extends ScalarEnvelope<E> {
  /// Creates a new [FirstOf] scalar that returns the first element of [values], or [defaultValue] if the iterable is empty.
  ///
  /// The [values] parameter is the iterable of elements to be wrapped.
  /// The [defaultValue] parameter is the value to be returned if the iterable is empty.
  FirstOf(Iterable<E> values, {required E defaultValue})
    : super(scalar: () => values.firstOrNull ?? defaultValue);
}
