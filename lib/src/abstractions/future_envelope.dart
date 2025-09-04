import 'dart:async';

/// An envelope for [Future] objects that provides a consistent interface for asynchronous operations.
///
/// This abstract class implements the [Future] interface and delegates all methods
/// to the future returned by the [_future] function. It serves as a base class for
/// all future-based implementations in the library.
///
/// Example:
/// ```dart
/// class MyFuture extends FutureEnvelope<int> {
///   MyFuture() : super(future: () async => 42);
/// }
/// ```
abstract class FutureEnvelope<Value> implements Future<Value> {
  /// Creates a new [FutureEnvelope] with the given future function.
  ///
  /// The [future] function is called when any of the [Future] methods are invoked.
  FutureEnvelope({required Future<Value> Function() future}) : _future = future;

  /// The function that returns the future wrapped by this envelope.
  final Future<Value> Function() _future;

  /// Converts this future to a [Stream] containing a single value.
  @override
  Stream<Value> asStream() => _future().asStream();

  /// Handles errors emitted by this future.
  @override
  Future<Value> catchError(
    Function onError, {
    bool Function(Object error)? test,
  }) async => await _future().catchError(onError, test: test);

  /// Registers callbacks to be called when this future completes.
  @override
  Future<R> then<R>(
    FutureOr<R> Function(Value value) onValue, {
    Function? onError,
  }) async => await _future().then(onValue, onError: onError);

  /// Completes this future with an error if it doesn't complete within the given time limit.
  @override
  Future<Value> timeout(
    Duration timeLimit, {
    FutureOr<Value> Function()? onTimeout,
  }) async => await _future().timeout(timeLimit, onTimeout: onTimeout);

  /// Registers a function to be called when this future completes.
  @override
  Future<Value> whenComplete(FutureOr<void> Function() action) async =>
      await _future().whenComplete(action);
}
