import 'dart:io';

import 'package:must_be/must_be.dart';

void main() {
  ValidationsLocalization.on<Blank>(
    (_) => 'Wrong, there is no correct answer',
  );

  while (true) {
    stdout.writeln("What's your name");
    final name = stdin.readLineSync();
    final msg = validate(
      () => requireThat(name)
        ..mustBeGreaterThanOrEqualTo(3)
        ..mustBeLessThanOrEqualTo(10),
      ifNotValid: (constraint) => switch (constraint.constraintViolation) {
        GreaterThanOrEqualTo(min: final min) =>
          'name must have at least $min characters',
        LessThan(max: final max) => 'name must be up to $max characters',
        _ => null,
      },
    );
    if (msg == null) {
      break;
    }
    stdout.writeln(msg);
  }

  while (true) {
    stdout.writeln('How old are you?');
    final age = int.parse(stdin.readLineSync() ?? '0');
    try {
      requireThat(age, name: 'age').mustBeGreaterThanOrEqualTo(
        18,
        'You are young, it is necessary that you are 18 years old at least',
      );
      break;
    } on ConstraintException catch (exception) {
      stdout.writeln(exception.constraintViolation.message);
    }
  }

  stdout.writeln("What's the better state manager?");
  final stateManager = stdin.readLineSync();
  final notCorrectAnswer =
      validate(() => requireThat(stateManager).mustBeBlank());
  stdout.writeln(notCorrectAnswer ?? 'Yeahhh!!!');
}
