import '../../abstractions/scalar_envelope.dart';

final class LastOf<E> extends ScalarEnvelope<E> {
  LastOf(Iterable<E> elements, {required E defaultValue})
    : super(scalar: () => elements.lastOrNull ?? defaultValue);
}
