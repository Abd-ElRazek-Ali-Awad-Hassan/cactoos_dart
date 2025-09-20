import 'dart:collection';

/// Lazily evaluated list.
///
/// The list is evaluated only once, and then the result is cached.
///
/// For more information, see [LazyList].
final class LazyList<T> extends ListBase<T> {
  /// Creates a lazy list.
  ///
  /// The [src] is a function that returns the list of elements.
  ///
  /// The [src] function is called only once, and then the result is cached.
  factory LazyList({required List<T> Function() src}) {
    final elements = <T>[];

    final elementsAttached = [false];

    return LazyList._(
      list: () {
        if (!elementsAttached.first) {
          elements.addAll(src());

          elementsAttached[0] = true;
        }

        return elements;
      },
    );
  }

  /// Creates a lazy list.
  ///
  /// The [list] is a function that returns the list of elements.
  ///
  /// The [list] function is called only once, and then the result is cached.
  LazyList._({required List<T> Function() list}) : _list = list;

  final List<T> Function() _list;

  @override
  int get length => _list().length;

  @override
  set length(int value) => _list().length = value;

  @override
  T operator [](int index) => _list()[index];

  @override
  void operator []=(int index, T value) => _list()[index] = value;
}
