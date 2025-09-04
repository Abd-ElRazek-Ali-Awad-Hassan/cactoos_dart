# Cactoos Dart

## إحدي المشروعات التي أحتسبها صدقة عن والدي رحمات الله تتنزل عليه وسائر المسلمين

## Getting started

### Installation
Add the following to your `pubspec.yaml` file:
```yaml
dependencies:
  cactoos_dart: ^1.0.0
```

### Import
Add the following to your Dart file:
```dart
import 'package:cactoos_dart/cactoos_dart.dart';
```

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Documentation

Cactoos Dart is a collection of object-oriented primitives for Dart, inspired by the [Cactoos](https://github.com/yegor256/cactoos) library for Java. It provides a set of abstractions and implementations that follow object-oriented design principles.

### Core Interfaces

#### Scalar

`Scalar<Value>` is an interface that represents a value of type `Value` that can be retrieved.

```dart
abstract interface class Scalar<Value> {
  Value value();
}
```

#### Text

`Text` is an interface that represents a string value that can be converted to a string.

```dart
abstract interface class Text {
  @override
  String toString();
}
```

### Abstractions

#### ScalarEnvelope

`ScalarEnvelope<Value>` is an abstract class that implements the `Scalar<Value>` interface and provides a base implementation for scalar values. It uses the [Equatable](https://pub.dev/packages/equatable) package for equality comparison.

```dart
abstract class ScalarEnvelope<Value> extends Equatable implements Scalar<Value> {
  ScalarEnvelope({required Value Function() scalar}) : _value = scalar;

  final Value Function() _value;

  @override
  Value value() => _value();

  @override
  List<Object?> get props => [value()];
}
```

#### TextEnvelope

`TextEnvelope` is an abstract class that implements the `Text` interface and provides a base implementation for text values. It also uses the [Equatable](https://pub.dev/packages/equatable) package for equality comparison.

```dart
abstract class TextEnvelope extends Equatable implements Text {
  TextEnvelope(this._text);

  final String Function() _text;

  @override
  String toString() => _text();

  @override
  List<Object?> get props => [toString()];
}
```

#### FutureEnvelope

`FutureEnvelope<Value>` is an abstract class that implements the `Future<Value>` interface and provides a base implementation for asynchronous operations.

```dart
abstract class FutureEnvelope<Value> implements Future<Value> {
  FutureEnvelope({required Future<Value> Function() future}) : _future = future;

  final Future<Value> Function() _future;

  // Implements all Future methods
}
```

### Implementations

#### Boolean Values

##### True

`True` is a class that extends `ScalarEnvelope<bool>` and always returns `true`.

```dart
final class True extends ScalarEnvelope<bool> {
  True() : super(scalar: () => true);
}
```

##### False

Similar to `True`, but always returns `false`.

#### IO

##### TextOfFile

`TextOfFile` is a class that extends `FutureEnvelope<String>` and reads the contents of a file as a string.

```dart
final class TextOfFile extends FutureEnvelope<String> {
  TextOfFile.from(String path, {Encoding encoding = utf8})
    : this(File(path), encoding: encoding);

  TextOfFile(File file, {Encoding encoding = utf8})
    : super(future: () async => await file.readAsString(encoding: encoding));
}
```

##### JsonOfFile

`JsonOfFile` is a class that extends `FutureEnvelope<Map<String, dynamic>>` and reads the contents of a file as a JSON object.

```dart
final class JsonOfFile extends FutureEnvelope<Map<String, dynamic>> {
  JsonOfFile.from(String path, {Encoding encoding = utf8})
    : this(File(path), encoding: encoding);

  JsonOfFile(File file, {Encoding encoding = utf8})
    : super(
        future:
            () async => jsonDecode(await TextOfFile(file, encoding: encoding)),
      );
}
```

##### BytesOfFile

Reads the contents of a file as bytes.

#### MappedFuture

`MappedFuture<Target, Source>` is a class that extends `FutureEnvelope<Target>` and maps the result of a future from one type to another.

```dart
final class MappedFuture<Target, Source> extends FutureEnvelope<Target> {
  MappedFuture({
    required Future<Source> Function() src,
    required Target Function(Source s) map,
  }) : super(future: () async => map(await src()));
}
```

#### Number

`Number` is a class that extends `ScalarEnvelope<num>` and provides various constructors for creating number values.

```dart
final class Number extends ScalarEnvelope<num> {
  Number.zero() : this._(() => 0);

  Number(num value) : this._(() => value);

  Number.negative(num value) : this._(() => -value);

  Number.parse(String numAsString) : this._(() => int.parse(numAsString));

  Number._(num Function() scalar) : super(scalar: scalar);
}
```

It also provides extension methods for performing arithmetic operations on `Scalar<num>` values.

##### Number Operations

The library includes several classes for performing arithmetic operations on numbers:

- `Sum`: Calculates the sum of a collection of numbers.

```dart
final class Sum extends ScalarEnvelope<num> {
  Sum.of(num number, num other) : this([Number(number), Number(other)]);

  Sum.ofNumbers(Iterable<num> numbers) : this(numbers.map((e) => Number(e)));

  Sum([Iterable<Scalar<num>> numbers = const []])
    : super(scalar: () => numbers.fold(0, (v, e) => v + e.value()));
}
```

- `Diff`: Calculates the difference between two numbers.
- `Mul`: Calculates the product of two numbers.
- `Div`: Calculates the division of two numbers.

#### ScalarOf

`ScalarOf<Value>` is a class that extends `ScalarEnvelope<Value>` and provides a simple way to create scalar values.

```dart
final class ScalarOf<Value> extends ScalarEnvelope<Value> {
  ScalarOf.fromValue(Value value) : this(() => value);

  ScalarOf(Value Function() scalar) : super(scalar: scalar);
}
```

#### Ternary

`Ternary<Result>` is a class that extends `ScalarEnvelope<Result>` and provides a way to create conditional expressions.

```dart
final class Ternary<Result> extends ScalarEnvelope<Result> {
  Ternary.when({
    required bool Function() condition,
    required Result Function() left,
    required Result Function() right,
  }) : this(
         condition: ScalarOf(condition),
         left: ScalarOf(left),
         right: ScalarOf(right),
       );

  Ternary({
    required Scalar<bool> condition,
    required Scalar<Result> left,
    required Scalar<Result> right,
  }) : super(scalar: () => condition.value() ? left.value() : right.value());
}
```

#### Text

##### PlainText

`PlainText` is a class that extends `TextEnvelope` and represents a simple text value.

```dart
final class PlainText extends TextEnvelope {
  PlainText(String text) : super(() => text);
}
```

##### UpperCaseText

`UpperCaseText` is a class that extends `TextEnvelope` and converts a text value to uppercase.

```dart
final class UpperCaseText extends TextEnvelope {
  UpperCaseText(Text text) : super(() => '$text'.toUpperCase());
}
```

##### LowerCaseText

Converts a text value to lowercase.

##### CapitalizedText

Capitalizes the first letter of a text value.

##### TrimmedText

Removes leading and trailing whitespace from a text value.
