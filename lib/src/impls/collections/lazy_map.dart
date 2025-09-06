import 'dart:collection';

final class LazyMap<K, V, E> extends MapBase<K, V> {
  LazyMap(
    Iterable<E> elements, {
    required K Function(E e) key,
    required V Function(E e) value,
  }) : this._(() => {for (final e in elements) key(e): value(e)});

  LazyMap._(this._src) : __map = <K, V>{}, _srcAttached = [false];

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
