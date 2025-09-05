import '../../abstractions/iterable_envelope.dart';

/// A filtered iterable that only includes elements matching a given condition.
///
/// This class wraps an existing iterable and filters its elements based on
/// a provided predicate function. Only elements for which the condition
/// returns true will be included in the resulting iterable.
///
/// Example:
/// ```dart
/// final numbers = [1, 2, 3, 4, 5];
/// final evenNumbers = Filtered(numbers, condition: (n) => n % 2 == 0);
/// print(evenNumbers.toList()); // [2, 4]
/// ```
final class Filtered<E> extends IterableEnvelope<E> {
  /// Creates a new [Filtered] iterable.
  ///
  /// The [src] iterable will be filtered using the provided [condition] function.
  ///
  /// Parameters:
  /// - [src]: The iterable to be filtered.
  /// - [condition]: A function that takes an element of type [E] and returns a boolean.
  ///   Only elements for which this function returns true will be included in the filtered iterable.
  Filtered(Iterable<E> src, {required bool Function(E) condition})
    : super(elements: () => src.where(condition));
}
