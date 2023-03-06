import 'package:must_be/must_be.dart';
import 'package:test/test.dart';

void main() {
  group('ConstraintException', () {
    test('create without a name and value', () {
      const exception = ConstraintException(GreaterThan(0));
      expect(exception.constraintViolation, isA<GreaterThan>());
      expect(exception.name, isNull);
    });

    test('create with a name and value', () {
      const exception = ConstraintException(Invalid(), 'value', 0);
      expect(exception.constraintViolation, isA<Invalid>());
      expect(exception.name, 'value');
      expect(exception.value, 0);
    });

    test('toString without a name and value', () {
      const constraint = GreaterThan(0);
      const exception = ConstraintException(constraint);
      expect(exception.toString(), 'ConstraintException: $constraint');
    });

    test('toString with a name', () {
      const constraint = GreaterThan(0);
      const exception = ConstraintException(constraint, 'value');
      expect(
        exception.toString(),
        'ConstraintException (value): $constraint',
      );
    });

    test('toString with a name and value', () {
      const constraint = GreaterThan(0);
      const exception = ConstraintException(constraint, 'value', 0);
      expect(
        exception.toString(),
        'ConstraintException (value): $constraint: 0',
      );
    });

    group('whenConstraint', () {
      test('calls function when the map contains the constraint', () {
        const exception = ConstraintException(GreaterThan(0));
        final expectedValue = exception.when({
          isType<LessThan>(): (_) => 'less',
          isType<GreaterThan>(): (_) => 'greater',
        });
        expect(expectedValue, 'greater');
      });

      test('throws AssertError when the map is empty', () {
        const exception = ConstraintException(GreaterThan(0));
        expect(
          () => exception.when({}),
          throwsA(isA<AssertionError>()),
        );
      });

      test('throws ArgumentError when the map does not contain the constraint ',
          () {
        const exception = ConstraintException(GreaterThan(0));
        expect(
          () => exception.when({
            isType<LessThan>(): (_) => 'less',
          }),
          throwsArgumentError,
        );
      });

      test(
          'returns null when the map does not '
          'contain the constraint - whenConstrainsOrNull', () {
        const exception = ConstraintException(GreaterThan(0));
        String? expectedValue;
        exception.whenOrNull({
          isType<LessThan>(): (_) => expectedValue = 'less',
        });
        expect(expectedValue, isNull);
      });
    });
  });
}
