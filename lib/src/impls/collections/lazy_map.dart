import 'dart:collection';

/// A map that is lazy-initialized.
///
/// The map is initialized when an element is accessed or modified.
///
/// Example:
/// ```dart
/// final map = LazyMap(
///   [1, 2, 3],
///   key: (e) => e,
///   value: (e) => '$e',
/// );
/// ```
///
/// See also:
///   - [UnmodifiableLazyMap]
final class LazyMap<K, V, E> extends MapBase<K, V> {
  /// Creates a new [LazyMap] that wraps the given [elements].
  ///
  /// The [key] function is used to convert each element of [elements] to a key.
  /// The [value] function is used to convert each element of [elements] to a value.
  ///
  /// The [elements] are not evaluated until an element is accessed or modified.
  LazyMap.fromIterable(
    Iterable<E> elements, {
    required K Function(E e) key,
    required V Function(E e) value,
  }) : this(src: () => {for (final e in elements) key(e): value(e)});

  /// Creates a new [LazyMap] given a [src] function.
  /// The [src] are not evaluated or called until an element is accessed or modified.
  LazyMap({required Map<K, V> Function() src})
    : _src = src,
      __map = <K, V>{},
      _srcAttached = [false];

  final Map<K, V> __map;
  final List<bool> _srcAttached;
  final Map<K, V> Function() _src;

  @override
  V? operator [](Object? key) => _map[key];

  @override
  void operator []=(K key, V value) => _map[key] = value;

  @override
  void clear() => _map.clear();

  @override
  Iterable<K> get keys => _map.keys;

  @override
  V? remove(Object? key) => _map.remove(key);

  Map<K, V> get _map {
    if (!_srcAttached.first) {
      __map.addAll(_src());

      _srcAttached[0] = true;
    }

    return __map;
  }
}
