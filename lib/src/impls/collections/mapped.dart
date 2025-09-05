import '../../abstractions/iterable_envelope.dart';

/// An iterable that maps each element of the source iterable to a new value.
final class Mapped<E, T> extends IterableEnvelope<T> {
  /// Creates a new [Mapped] iterable that maps each element of [src] to a new value using [elementMapped].
  ///
  /// The [src] parameter is the iterable to be mapped.
  /// The [elementMapped] parameter is the function that maps each element of [src] to a new value.
  Mapped(Iterable<E> src, {required T Function(E) elementMapped})
    : super(elements: () => src.map(elementMapped));
}
