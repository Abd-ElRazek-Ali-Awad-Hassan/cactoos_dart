import 'dart:collection';

/// A lazy map that is unmodifiable.
///
/// The map is initialized when it is first accessed.
///
/// Example:
/// ```dart
/// final map = UnmodifiableLazyMap(
///   [1, 2, 3],
///   key: (e) => e,
///   value: (e) => e.toString(),
/// );
/// ```
///
/// The [UnmodifiableLazyMap] class is useful when you want to create a map that is
/// initialized only when it is first accessed. This can be useful when the map is
/// expensive to create or when you want to delay the creation of the map until it is
/// actually needed.
///
final class UnmodifiableLazyMap<K, V, E> extends UnmodifiableMapBase<K, V> {
  /// Creates a new [UnmodifiableLazyMap] with the given [elements].
  ///
  /// The [elements] parameter is the iterable of elements to be wrapped, it must be unmodifiable.
  /// because you know changing elements can be possible before first access.
  ///
  /// The [key] parameter is the function that returns the key of an element.
  ///
  /// The [value] parameter is the function that returns the value of an element.
  factory UnmodifiableLazyMap(
    /// The iterable of elements to be wrapped, it must be unmodifiable.
    /// because you know changing elements can be possible before first access.
    Iterable<E> elements, {

    /// The function that returns the key of an element.
    required K Function(E e) key,

    /// The function that returns the value of an element.
    required V Function(E e) value,
  }) {
    final map = <K, V>{};

    final elementsAttached = [false];

    return UnmodifiableLazyMap._(() {
      if (!elementsAttached.first) {
        map.addAll({for (final e in elements) key(e): value(e)});

        elementsAttached[0] = true;
      }

      return map;
    });
  }

  UnmodifiableLazyMap._(this._map);

  final Map<K, V> Function() _map;

  @override
  V? operator [](Object? key) => _map()[key];

  @override
  Iterable<K> get keys => _map().keys;
}
