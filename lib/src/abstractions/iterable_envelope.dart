abstract class IterableEnvelope<E> extends Iterable<E> {
  final Iterable<E> Function() _elements;

  IterableEnvelope({required Iterable<E> Function() elements})
    : _elements = elements;

  @override
  Iterator<E> get iterator => _elements().iterator;
}
