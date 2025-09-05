import '../../abstractions/scalar_envelope.dart';

final class Length extends ScalarEnvelope<int> {
  Length.ofMap(Map map) : super(scalar: () => map.length);

  Length.ofString(String value) : super(scalar: () => value.length);

  Length.ofIterable(Iterable value) : super(scalar: () => value.length);
}
