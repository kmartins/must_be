import 'package:must_be/must_be.dart';
import 'package:test/test.dart';

void main() {
  group('validate', () {
    test(
        'return a default error message when catches '
        'a ConstraintException and the function if not valid is null', () {
      final errorMessage = validate(
        () => requireThat(10).mustBeGreaterThan(10),
      );
      expect(errorMessage, 'Must be greater than 10');
    });

    test('calls ifNotValid function if catches ConstraintException', () {
      const errorMessage = 'error message';
      final error = validate(
        () => requireThat(10).mustBeGreaterThan(10),
        ifNotValid: (_) => errorMessage,
      );
      expect(error, errorMessage);
    });

    test('returns null when there is not ConstraintException', () {
      final errorMessage = validate(
        () => requireThat(10).mustBeGreaterThan(0),
      );
      expect(errorMessage, isNull);
    });

    test(
        'not calls ifNotValid function '
        'when there is not ConstraintException', () {
      const errorMessage = 'error message';
      final error = validate(
        () => requireThat(10).mustBeGreaterThan(0),
        ifNotValid: (_) => errorMessage,
      );
      expect(error, isNot(errorMessage));
    });

    test('not catches an exception when different of ConstraintException', () {
      expect(
        () => validate(() => throw Exception()),
        throwsException,
      );
    });
  });
}
