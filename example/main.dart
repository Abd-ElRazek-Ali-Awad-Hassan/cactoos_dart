import 'package:cactoos_dart/cactoos_dart.dart';

void main() async {
  print('###################### Text ######################');

  print(UpperCaseText(PlainText('hello world'))); // prints: HELLO WORLD.

  print(LowerCaseText(PlainText('HELLO WORLD'))); // prints: hello world.

  print(CapitalizedText(PlainText('hello world'))); // prints: Hello World.

  print(TrimmedText(PlainText('  hello world  '))); // prints: hello world.

  print('###################### Boolean Values ######################');

  print(True().value()); // prints true.

  print(False().value()); // prints false.

  print('###################### Ternary ######################');

  print(
    Ternary(
      condition: Number(1).greaterThan(Number.zero()),
      left: Number(1),
      right: Number.zero(),
    ).value(),
  ); // prints 1.

  print(
    Ternary(
      condition: Number(1).lessThan(Number.zero()),
      left: Number(1),
      right: Number.zero(),
    ).value(),
  ); // prints 0.

  print('###################### Mapped Future ######################');

  print(
    await MappedFuture(
      src:
          () => MappedFuture(
            src: () => Future.value('  hello world  '),
            map: (text) => TrimmedText(PlainText(text)),
          ),
      map: (text) => '${UpperCaseText(text)}',
    ),
  ); // prints HELLO WORLD.
}
