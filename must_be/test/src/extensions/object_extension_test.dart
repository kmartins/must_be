import 'package:must_be/must_be.dart';
import 'package:test/test.dart';

void main() {
  group('RequiredObject', () {
    group('Equal', () {
      test(
          'if the value is equal, '
          'then an exception will not be thrown', () {
        expect(
          () => requireThat('value').mustBeEqualTo('value'),
          returnsNormally,
        );
      });

      test(
          'if the value is not equal, '
          'then an exception will be thrown', () {
        expect(
          () => requireThat('value').mustBeEqualTo(''),
          throwsConstraintException<Equal>(),
        );
        expect(
          () => requireThat('value').mustBeEqualTo(''),
          throwsConstraintException<Equal>(
            constraintMessage: 'Must be equal to ',
          ),
        );
        expect(
          () => requireThat('value').mustBeEqualTo('', 'not equal'),
          throwsConstraintException<Equal>(constraintMessage: 'not equal'),
        );
      });
    });

    group('Not Equal', () {
      test(
          'if the value is not equal, '
          'then an exception will not be thrown', () {
        expect(
          () => requireThat('value').mustBeNotEqualTo(''),
          returnsNormally,
        );
      });

      test(
          'if the value is equal, '
          'then an exception will be thrown', () {
        expect(
          () => requireThat('value').mustBeNotEqualTo('value'),
          throwsConstraintException<NotEqual>(),
        );
        expect(
          () => requireThat('value').mustBeNotEqualTo('value'),
          throwsConstraintException<NotEqual>(
            constraintMessage: 'Must be not equal to value',
          ),
        );
        expect(
          () => requireThat('value').mustBeNotEqualTo('value', 'equal'),
          throwsConstraintException<NotEqual>(constraintMessage: 'equal'),
        );
      });
    });

    group('Not Null', () {
      test(
          'if the value is not null, '
          'then an exception will not be thrown', () {
        expect(
          () => requireThat('value').mustBeNotNull(),
          returnsNormally,
        );
      });

      test(
          'if the value is null, '
          'then an exception will be thrown', () {
        expect(
          () => requireThat(null).mustBeNotNull(),
          throwsConstraintException<NotNull>(),
        );
        expect(
          () => requireThat(null).mustBeNotNull(),
          throwsConstraintException<NotNull>(
            constraintMessage: 'Must be not null',
          ),
        );
        expect(
          () => requireThat(null).mustBeNotNull('not null'),
          throwsConstraintException<NotNull>(constraintMessage: 'not null'),
        );
      });
    });

    group('Null', () {
      test(
          'if the value is null, '
          'then an exception will not be thrown', () {
        expect(
          () => requireThat(null).mustBeNull(),
          returnsNormally,
        );
      });

      test(
          'if the value is not null, '
          'then an exception will be thrown', () {
        expect(
          () => requireThat('value').mustBeNull(),
          throwsConstraintException<Null>(),
        );
        expect(
          () => requireThat('value').mustBeNull(),
          throwsConstraintException<Null>(
            constraintMessage: 'Must be null',
          ),
        );
        expect(
          () => requireThat('value').mustBeNull('null'),
          throwsConstraintException<Null>(constraintMessage: 'null'),
        );
      });
    });
  });
}
