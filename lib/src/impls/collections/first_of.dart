import '../../abstractions/scalar_envelope.dart';

final class FirstOf<E> extends ScalarEnvelope<E> {
  FirstOf(Iterable<E> values, {required E defaultValue})
    : super(scalar: () => values.firstOrNull ?? defaultValue);
}
