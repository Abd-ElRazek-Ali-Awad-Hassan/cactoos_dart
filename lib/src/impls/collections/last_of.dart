import '../../abstractions/scalar_envelope.dart';
import '../../interfaces/scalar.dart';

/// A [Scalar] that returns the last element of the [elements] iterable, or [defaultValue] if the iterable is empty.
///
/// This class wraps an iterable of elements and provides a way to retrieve the last element of the iterable.
/// If the iterable is empty, [defaultValue] is returned instead.
final class LastOf<E> extends ScalarEnvelope<E> {
  /// Creates a new [LastOf] scalar that returns the last element of [elements], or [defaultValue] if the iterable is empty.
  ///
  /// The [elements] parameter is the iterable of elements to be wrapped.
  /// The [defaultValue] parameter is a [Scalar] of [E] to be returned if the iterable is empty.
  LastOf(Iterable<E> elements, {required Scalar<E> defaultValue})
    : super(scalar: () => elements.lastOrNull ?? defaultValue.value());
}
