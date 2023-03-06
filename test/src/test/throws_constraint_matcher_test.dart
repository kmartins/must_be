import 'package:must_be/must_be.dart';
import 'package:test/test.dart';

void main() {
  group('throwsConstraintException', () {
    test('should be true when the constraint type is equal', () {
      expect(
        () => requireThat(2).mustBeGreaterThan(2),
        throwsConstraintException<GreaterThan>(),
      );
    });

    test('should be true when the message is equals', () {
      expect(
        () => requireThat(2).mustBeGreaterThan(2),
        throwsConstraintException<GreaterThan>(
          constraintMessage: 'Must be greater than 2',
        ),
      );
    });

    test('should be true when the name is equals', () {
      expect(
        () => requireThat(2, name: 'number').mustBeGreaterThan(2),
        throwsConstraintException<GreaterThan>(name: 'number'),
      );
    });

    test('should be true when the value is equals', () {
      expect(
        () => requireThat(2).mustBeGreaterThan(2),
        throwsConstraintException<GreaterThan>(value: 2),
      );
    });

    test('should be true when the type, message, name, and value is equals',
        () {
      expect(
        () => requireThat(2, name: 'number').mustBeGreaterThan(2),
        throwsConstraintException<GreaterThan>(
          constraintMessage: 'Must be greater than 2',
          name: 'number',
          value: 2,
        ),
      );
    });
  });
}
