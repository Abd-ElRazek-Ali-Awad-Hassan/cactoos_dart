import 'dart:async';

import '../../abstractions/future_envelope.dart';

/// A [Future] implementation that maps the result of another future to a different type.
///
/// This class wraps a future that returns a value of type [Source] and applies a mapping
/// function to transform it into a value of type [Target].
///
/// Example:
/// ```dart
/// final sourceFuture = Future.value(42);
/// final mappedFuture = MappedFuture(
///   src: () => sourceFuture,
///   map: (int value) => value.toString(),
/// );
/// print(await mappedFuture); // Prints: 42
/// ```
final class MappedFuture<Target, Source> extends FutureEnvelope<Target> {
  /// Creates a new [MappedFuture] that transforms the result of another future.
  ///
  /// The [src] function returns the source future of type [Source].
  /// The [map] function transforms the result of the source future from type [Source] to type [Target].
  MappedFuture({
    required Future<Source> Function() src,
    required Target Function(Source s) map,
  }) : super(future: () async => map(await src()));
}
