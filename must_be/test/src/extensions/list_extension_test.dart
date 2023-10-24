import 'package:must_be/must_be.dart';
import 'package:test/test.dart';

void main() {
  group('RequireList', () {
    group('empty', () {
      test(
          'if the list is null, '
          'then an exception will not be thrown', () {
        List<int>? value;
        expect(() => requireThat(value).mustBeEmpty(), returnsNormally);
      });

      test(
        'if the list is empty, '
        'then an exception will not be thrown',
        () => expect(
          () => requireThat(<int>[]).mustBeEmpty(),
          returnsNormally,
        ),
      );

      test(
          'if the list is not empty '
          'then an exception is thrown', () {
        expect(
          () => requireThat([0, 1, 2, 3]).mustBeEmpty(),
          throwsConstraintException<Empty>(),
        );
        expect(
          () => requireThat([0, 1, 2, 3]).mustBeEmpty(),
          throwsConstraintException<Empty>(
            constraintMessage: 'Must be empty',
          ),
        );
      });

      test(
          'if the list is not empty, '
          'then an exception is thrown - Custom Message', () {
        expect(
          () => requireThat([0, 1, 2, 3]).mustBeEmpty('must be empty'),
          throwsConstraintException<Empty>(
            constraintMessage: 'must be empty',
          ),
        );
      });
    });

    group('not empty', () {
      test(
          'if the list is null, '
          'then an exception will not be thrown', () {
        List<int>? value;
        expect(() => requireThat(value).mustBeNotEmpty(), returnsNormally);
      });

      test(
        'if the list is not empty, '
        'then an exception will not be thrown',
        () => expect(
          () => requireThat([1, 2, 3, 4, 5]).mustBeNotEmpty(),
          returnsNormally,
        ),
      );

      test(
          'if the list is empty '
          'then an exception is thrown', () {
        expect(
          () => requireThat(<int>[]).mustBeNotEmpty(),
          throwsConstraintException<NotEmpty>(),
        );
        expect(
          () => requireThat(<int>[]).mustBeNotEmpty(),
          throwsConstraintException<NotEmpty>(
            constraintMessage: 'Must not be empty',
          ),
        );
      });

      test(
          'if the list is empty, '
          'then an exception is thrown - Custom Message', () {
        expect(
          () => requireThat(<int>[]).mustBeNotEmpty('must not be empty'),
          throwsConstraintException<NotEmpty>(
            constraintMessage: 'must not be empty',
          ),
        );
      });
    });

    group('greater', () {
      test(
          'if the list is null, '
          'then an exception will not be thrown', () {
        List<int>? value;
        expect(() => requireThat(value).mustBeGreaterThan(0), returnsNormally);
      });

      test(
        'if the list length is greater than the minimum, '
        'then an exception will not be thrown',
        () => expect(
          () => requireThat([0, 1, 2, 3]).mustBeGreaterThan(2),
          returnsNormally,
        ),
      );

      test(
          'if the list length is less or equal than the minimum, '
          'then an exception is thrown', () {
        expect(
          () => requireThat([0, 1, 2, 3]).mustBeGreaterThan(10),
          throwsConstraintException<GreaterThan>(),
        );
        expect(
          () => requireThat([0, 1, 2, 3]).mustBeGreaterThan(4),
          throwsConstraintException<GreaterThan>(
            constraintMessage: 'Must be greater than 4',
          ),
        );
      });

      test(
          'if the list length is less or equal than the minimum, '
          'then an exception is thrown - Custom Message', () {
        expect(
          () => requireThat([0, 1, 2, 3])
              .mustBeGreaterThan(4, 'must be greater than'),
          throwsConstraintException<GreaterThan>(
            constraintMessage: 'must be greater than',
          ),
        );
      });
    });
    group('greater than or equal to', () {
      test(
          'if the list is null, '
          'then an exception will not be thrown', () {
        List<int>? value;
        expect(
          () => requireThat(value).mustBeGreaterThanOrEqualTo(0),
          returnsNormally,
        );
      });

      test(
          'if the list length is greater or equal to the minimum, '
          'then an exception will not be thrown', () {
        expect(
          () => requireThat([0, 1, 2]).mustBeGreaterThanOrEqualTo(3),
          returnsNormally,
        );
        expect(
          () => requireThat([0, 1, 2]).mustBeGreaterThanOrEqualTo(1),
          returnsNormally,
        );
      });

      test(
          'if the list length is less than the minimum, '
          'then an exception is thrown', () {
        expect(
          () => requireThat([0, 1, 2]).mustBeGreaterThanOrEqualTo(10),
          throwsConstraintException<GreaterThanOrEqualTo>(),
        );
        expect(
          () => requireThat([0, 1, 2]).mustBeGreaterThanOrEqualTo(10),
          throwsConstraintException<GreaterThanOrEqualTo>(
            constraintMessage: 'Must be greater than or equal to 10',
          ),
        );
      });

      test(
          'if the list length is less than the minimum, '
          'then an exception is thrown - Custom Message', () {
        expect(
          () => requireThat([0, 1, 2]).mustBeGreaterThanOrEqualTo(
            10,
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
          'if the list is null, '
          'then an exception will not be thrown', () {
        List<int>? value;
        expect(() => requireThat(value).mustBeLessThan(0), returnsNormally);
      });

      test(
        'if the list length is less than the maximum, '
        'then an exception will not be thrown',
        () => expect(
          () => requireThat([0, 1, 2]).mustBeLessThan(10),
          returnsNormally,
        ),
      );

      test(
          'if the list length is greater or equal than the maximum, '
          'then an exception is thrown', () {
        expect(
          () => requireThat([0, 1, 2]).mustBeLessThan(3),
          throwsConstraintException<LessThan>(),
        );
        expect(
          () => requireThat([0, 1, 2]).mustBeLessThan(3),
          throwsConstraintException<LessThan>(
            constraintMessage: 'Must be less than 3',
          ),
        );
      });

      test(
          'if the list length is greater or equal than the maximum, '
          'then an exception is thrown - Custom Message', () {
        expect(
          () => requireThat([0, 1, 2]).mustBeLessThan(3, 'must be less than'),
          throwsConstraintException<LessThan>(
            constraintMessage: 'must be less than',
          ),
        );
      });
    });
    group('less or equal', () {
      test(
          'if the list is null, '
          'then an exception will not be thrown', () {
        List<int>? value;
        expect(
          () => requireThat(value).mustBeLessThanOrEqualTo(0),
          returnsNormally,
        );
      });

      test(
          'if the list length is less or equal to the maximum, '
          'then an exception will not be thrown', () {
        expect(
          () => requireThat([0, 1, 2]).mustBeLessThanOrEqualTo(10),
          returnsNormally,
        );
        expect(
          () => requireThat([0, 1, 2]).mustBeLessThanOrEqualTo(3),
          returnsNormally,
        );
      });

      test(
          'if the list length is greater than the maximum, '
          'then an exception is thrown', () {
        expect(
          () => requireThat([0, 1, 2]).mustBeLessThanOrEqualTo(2),
          throwsConstraintException<LessThanOrEqualTo>(),
        );
        expect(
          () => requireThat([0, 1, 2]).mustBeLessThanOrEqualTo(2),
          throwsConstraintException<LessThanOrEqualTo>(
            constraintMessage: 'Must be less than or equal to 2',
          ),
        );
      });

      test(
          'if the list length is greater than the maximum, '
          'then an exception is thrown - Custom Message', () {
        expect(
          () => requireThat([0, 1, 2])
              .mustBeLessThanOrEqualTo(1, 'must be less than or equal to'),
          throwsConstraintException<LessThanOrEqualTo>(
            constraintMessage: 'must be less than or equal to',
          ),
        );
      });
    });
  });
}
