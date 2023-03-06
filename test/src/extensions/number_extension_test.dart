import 'package:must_be/must_be.dart';
import 'package:test/test.dart';

void main() {
  group('RequireNumber', () {
    group('greater', () {
      test(
          'if the value is null, '
          'then an exception will not be thrown', () {
        int? intValue;
        double? doubleValue;
        num? numValue;
        expect(
          () => requireThat(intValue).mustBeGreaterThan(0),
          returnsNormally,
        );
        expect(
          () => requireThat(doubleValue).mustBeGreaterThan(0),
          returnsNormally,
        );
        expect(
          () => requireThat(numValue).mustBeGreaterThan(0),
          returnsNormally,
        );
      });

      test(
          'if the value is greater than the minimum, '
          'then an exception will not be thrown', () {
        const num numValue = 100;
        expect(
          () => requireThat(100).mustBeGreaterThan(10),
          returnsNormally,
        );
        expect(
          () => requireThat(100.10).mustBeGreaterThan(10),
          returnsNormally,
        );
        expect(
          () => requireThat(numValue).mustBeGreaterThan(10),
          returnsNormally,
        );
      });

      test(
          'if the value is less or equal than the minimum, '
          'then an exception is thrown', () {
        const num numValue = 2;
        expect(
          () => requireThat(2).mustBeGreaterThan(10),
          throwsConstraintException<GreaterThan>(),
        );
        expect(
          () => requireThat(2).mustBeGreaterThan(2),
          throwsConstraintException<GreaterThan>(
            constraintMessage: 'Must be greater than 2',
          ),
        );
        expect(
          () => requireThat(2.40).mustBeGreaterThan(10),
          throwsConstraintException<GreaterThan>(),
        );
        expect(
          // ignore: prefer_int_literals
          () => requireThat(2.00).mustBeGreaterThan(2),
          throwsConstraintException<GreaterThan>(
            constraintMessage: 'Must be greater than 2.0',
          ),
        );
        expect(
          () => requireThat(numValue).mustBeGreaterThan(10),
          throwsConstraintException<GreaterThan>(),
        );
        expect(
          () => requireThat(numValue).mustBeGreaterThan(2),
          throwsConstraintException<GreaterThan>(
            constraintMessage: 'Must be greater than 2',
          ),
        );
      });

      test(
          'if the value is less or equal than the minimum, '
          'then an exception is thrown - Custom Message', () {
        const num numValue = 2;
        expect(
          () => requireThat(2).mustBeGreaterThan(2, 'must be greater than'),
          throwsConstraintException<GreaterThan>(
            constraintMessage: 'must be greater than',
          ),
        );
        expect(
          () => requireThat(1.99).mustBeGreaterThan(2, 'must be greater than'),
          throwsConstraintException<GreaterThan>(
            constraintMessage: 'must be greater than',
          ),
        );
        expect(
          () => requireThat(numValue)
              .mustBeGreaterThan(2, 'must be greater than'),
          throwsConstraintException<GreaterThan>(
            constraintMessage: 'must be greater than',
          ),
        );
      });
    });
    group('greater than or equal to', () {
      test(
          'if the value is null, '
          'then an exception will not be thrown', () {
        int? intValue;
        double? doubleValue;
        num? numValue;
        expect(
          () => requireThat(intValue).mustBeGreaterThanOrEqualTo(0),
          returnsNormally,
        );
        expect(
          () => requireThat(doubleValue).mustBeGreaterThanOrEqualTo(0),
          returnsNormally,
        );
        expect(
          () => requireThat(numValue).mustBeGreaterThanOrEqualTo(0),
          returnsNormally,
        );
      });

      test(
          'if the value is greater or equal to the minimum, '
          'then an exception will not be thrown', () {
        const num numValue = 100;
        expect(
          () => requireThat(100).mustBeGreaterThanOrEqualTo(10),
          returnsNormally,
        );
        expect(
          () => requireThat(100).mustBeGreaterThanOrEqualTo(100),
          returnsNormally,
        );
        expect(
          () => requireThat(100.50).mustBeGreaterThanOrEqualTo(10),
          returnsNormally,
        );
        expect(
          // ignore: prefer_int_literals
          () => requireThat(100.00).mustBeGreaterThanOrEqualTo(100),
          returnsNormally,
        );
        expect(
          () => requireThat(numValue).mustBeGreaterThanOrEqualTo(10),
          returnsNormally,
        );
        expect(
          () => requireThat(numValue).mustBeGreaterThanOrEqualTo(100),
          returnsNormally,
        );
      });

      test(
          'if the value is less than the minimum, '
          'then an exception is thrown', () {
        const num numValue = 2;
        expect(
          () => requireThat(2).mustBeGreaterThanOrEqualTo(10),
          throwsConstraintException<GreaterThanOrEqualTo>(),
        );
        expect(
          () => requireThat(2).mustBeGreaterThanOrEqualTo(10),
          throwsConstraintException<GreaterThanOrEqualTo>(
            constraintMessage: 'Must be greater than or equal to 10',
          ),
        );
        expect(
          () => requireThat(2.99).mustBeGreaterThanOrEqualTo(10),
          throwsConstraintException<GreaterThanOrEqualTo>(),
        );
        expect(
          () => requireThat(2.50).mustBeGreaterThanOrEqualTo(10),
          throwsConstraintException<GreaterThanOrEqualTo>(
            constraintMessage: 'Must be greater than or equal to 10.0',
          ),
        );
        expect(
          () => requireThat(numValue).mustBeGreaterThanOrEqualTo(10),
          throwsConstraintException<GreaterThanOrEqualTo>(),
        );
        expect(
          () => requireThat(numValue).mustBeGreaterThanOrEqualTo(10),
          throwsConstraintException<GreaterThanOrEqualTo>(
            constraintMessage: 'Must be greater than or equal to 10',
          ),
        );
      });

      test(
          'if the value is less than the minimum, '
          'then an exception is thrown - Custom Message', () {
        const num numValue = 2;
        expect(
          () => requireThat(2).mustBeGreaterThanOrEqualTo(
            3,
            'must be greater than or equal to',
          ),
          throwsConstraintException<GreaterThanOrEqualTo>(
            constraintMessage: 'must be greater than or equal to',
          ),
        );
        expect(
          () => requireThat(2.50).mustBeGreaterThanOrEqualTo(
            3,
            'must be greater than or equal to',
          ),
          throwsConstraintException<GreaterThanOrEqualTo>(
            constraintMessage: 'must be greater than or equal to',
          ),
        );
        expect(
          () => requireThat(numValue).mustBeGreaterThanOrEqualTo(
            3,
            'must be greater than or equal to',
          ),
          throwsConstraintException<GreaterThanOrEqualTo>(
            constraintMessage: 'must be greater than or equal to',
          ),
        );
      });
    });

    group('less', () {
      test(
          'if the value is null, '
          'then an exception will not be thrown', () {
        int? intValue;
        double? doubleValue;
        num? numValue;
        expect(() => requireThat(intValue).mustBeLessThan(0), returnsNormally);
        expect(
          () => requireThat(doubleValue).mustBeLessThan(0),
          returnsNormally,
        );
        expect(() => requireThat(numValue).mustBeLessThan(0), returnsNormally);
      });

      test(
          'if the value is less than the maximum, '
          'then an exception will not be thrown', () {
        const num numValue = 10;
        expect(
          () => requireThat(10).mustBeLessThan(100),
          returnsNormally,
        );
        expect(
          () => requireThat(10.89).mustBeLessThan(100),
          returnsNormally,
        );
        expect(
          () => requireThat(numValue).mustBeLessThan(100),
          returnsNormally,
        );
      });

      test(
          'if the value is greater or equal than the maximum, '
          'then an exception is thrown', () {
        const num numValue = 20;
        expect(
          () => requireThat(20).mustBeLessThan(10),
          throwsConstraintException<LessThan>(),
        );
        expect(
          () => requireThat(2).mustBeLessThan(2),
          throwsConstraintException<LessThan>(
            constraintMessage: 'Must be less than 2',
          ),
        );
        expect(
          () => requireThat(20.99).mustBeLessThan(10),
          throwsConstraintException<LessThan>(),
        );
        expect(
          // ignore: prefer_int_literals
          () => requireThat(2.00).mustBeLessThan(2),
          throwsConstraintException<LessThan>(
            constraintMessage: 'Must be less than 2.0',
          ),
        );
        expect(
          () => requireThat(numValue).mustBeLessThan(10),
          throwsConstraintException<LessThan>(),
        );
        expect(
          () => requireThat(numValue).mustBeLessThan(20),
          throwsConstraintException<LessThan>(
            constraintMessage: 'Must be less than 20',
          ),
        );
      });

      test(
          'if the value is greater or equal than the maximum, '
          'then an exception is thrown - Custom Message', () {
        const num numValue = 2;
        expect(
          () => requireThat(2).mustBeLessThan(2, 'must be less than'),
          throwsConstraintException<LessThan>(
            constraintMessage: 'must be less than',
          ),
        );
        expect(
          // ignore: prefer_int_literals
          () => requireThat(2.00).mustBeLessThan(2, 'must be less than'),
          throwsConstraintException<LessThan>(
            constraintMessage: 'must be less than',
          ),
        );
        expect(
          () => requireThat(numValue).mustBeLessThan(2, 'must be less than'),
          throwsConstraintException<LessThan>(
            constraintMessage: 'must be less than',
          ),
        );
      });
    });
    group('less or equal', () {
      test(
          'if the value is null, '
          'then an exception will not be thrown', () {
        int? intValue;
        double? doubleValue;
        num? numValue;
        expect(
          () => requireThat(intValue).mustBeLessThanOrEqualTo(0),
          returnsNormally,
        );
        expect(
          () => requireThat(doubleValue).mustBeLessThanOrEqualTo(0),
          returnsNormally,
        );
        expect(
          () => requireThat(numValue).mustBeLessThanOrEqualTo(0),
          returnsNormally,
        );
      });

      test(
          'if the value is less or equal to the maximum, '
          'then an exception will not be thrown', () {
        const num numValue = 100;
        expect(
          () => requireThat(99).mustBeLessThanOrEqualTo(100),
          returnsNormally,
        );
        expect(
          () => requireThat(100).mustBeLessThanOrEqualTo(100),
          returnsNormally,
        );
        expect(
          () => requireThat(99.99).mustBeLessThanOrEqualTo(100),
          returnsNormally,
        );
        expect(
          // ignore: prefer_int_literals
          () => requireThat(100.00).mustBeLessThanOrEqualTo(100),
          returnsNormally,
        );
        expect(
          () => requireThat(numValue).mustBeLessThanOrEqualTo(101),
          returnsNormally,
        );
        expect(
          () => requireThat(numValue).mustBeLessThanOrEqualTo(100),
          returnsNormally,
        );
      });

      test(
          'if the value is greater than the maximum, '
          'then an exception is thrown', () {
        const num numValue = 11;
        expect(
          () => requireThat(11).mustBeLessThanOrEqualTo(10),
          throwsConstraintException<LessThanOrEqualTo>(),
        );
        expect(
          () => requireThat(11).mustBeLessThanOrEqualTo(10),
          throwsConstraintException<LessThanOrEqualTo>(
            constraintMessage: 'Must be less than or equal to 10',
          ),
        );
        expect(
          () => requireThat(10.01).mustBeLessThanOrEqualTo(10),
          throwsConstraintException<LessThanOrEqualTo>(),
        );
        expect(
          () => requireThat(11.99).mustBeLessThanOrEqualTo(10),
          throwsConstraintException<LessThanOrEqualTo>(
            constraintMessage: 'Must be less than or equal to 10.0',
          ),
        );
        expect(
          () => requireThat(numValue).mustBeLessThanOrEqualTo(10),
          throwsConstraintException<LessThanOrEqualTo>(),
        );
        expect(
          () => requireThat(numValue).mustBeLessThanOrEqualTo(10),
          throwsConstraintException<LessThanOrEqualTo>(
            constraintMessage: 'Must be less than or equal to 10',
          ),
        );
      });

      test(
          'if the value is greater than the maximum, '
          'then an exception is thrown - Custom Message', () {
        const num numValue = 11;
        expect(
          () => requireThat(11)
              .mustBeLessThanOrEqualTo(10, 'must be less than or equal to'),
          throwsConstraintException<LessThanOrEqualTo>(
            constraintMessage: 'must be less than or equal to',
          ),
        );
        expect(
          () => requireThat(10.01)
              .mustBeLessThanOrEqualTo(10, 'must be less than or equal to'),
          throwsConstraintException<LessThanOrEqualTo>(
            constraintMessage: 'must be less than or equal to',
          ),
        );
        expect(
          () => requireThat(numValue)
              .mustBeLessThanOrEqualTo(10, 'must be less than or equal to'),
          throwsConstraintException<LessThanOrEqualTo>(
            constraintMessage: 'must be less than or equal to',
          ),
        );
      });
    });
  });
}
