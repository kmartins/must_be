import 'package:must_be/must_be.dart';
import 'package:test/test.dart';

void main() {
  group('String', () {
    group('not empty', () {
      test(
          'if the value is null, '
          'then an exception will not be thrown', () {
        String? value;
        expect(() => requireThat(value).mustBeNotEmpty(), returnsNormally);
      });

      test(
          'if the value is not empty, '
          'then an exception will not be thrown', () {
        expect(
          () => requireThat('value').mustBeNotEmpty(),
          returnsNormally,
        );
        expect(
          () => requireThat('  ').mustBeNotEmpty(),
          returnsNormally,
        );
      });

      test(
          'if the value is empty, '
          'then an exception is thrown', () {
        expect(
          () => requireThat('').mustBeNotEmpty(),
          throwsConstraintException<NotEmpty>(),
        );
        expect(
          () => requireThat('').mustBeNotEmpty(),
          throwsConstraintException<NotEmpty>(
            constraintMessage: 'Must not be empty',
          ),
        );
      });

      test(
          'if the value is empty, '
          'then an exception is thrown - Custom Message', () {
        expect(
          () => requireThat('').mustBeNotEmpty('must not be empty'),
          throwsConstraintException<NotEmpty>(
            constraintMessage: 'must not be empty',
          ),
        );
      });
    });
    group('empty', () {
      test(
          'if the value is null, '
          'then an exception will not be thrown', () {
        String? value;
        expect(() => requireThat(value).mustBeEmpty(), returnsNormally);
      });

      test(
        'if the value is empty, '
        'then an exception will not be thrown',
        () => expect(
          () => requireThat('').mustBeEmpty(),
          returnsNormally,
        ),
      );

      test(
          'if the value is not empty, '
          'then an exception is thrown', () {
        expect(
          () => requireThat('value').mustBeEmpty(),
          throwsConstraintException<Empty>(),
        );
        expect(
          () => requireThat(' ').mustBeEmpty(),
          throwsConstraintException<Empty>(),
        );
        expect(
          () => requireThat('value').mustBeEmpty(),
          throwsConstraintException<Empty>(
            constraintMessage: 'Must be empty',
          ),
        );
      });

      test(
          'if the value is not empty, '
          'then an exception is thrown - Custom Message', () {
        expect(
          () => requireThat('value').mustBeEmpty('must be empty'),
          throwsConstraintException<Empty>(
            constraintMessage: 'must be empty',
          ),
        );
      });
    });

    group('not blank', () {
      test(
          'if the value is null, '
          'then an exception will not be thrown', () {
        String? value;
        expect(() => requireThat(value).mustBeNotBlank(), returnsNormally);
      });

      test(
          'if the value is not blank '
          'then an exception will not be thrown', () {
        expect(
          () => requireThat('value').mustBeNotBlank(),
          returnsNormally,
        );
      });

      test(
          'if the value is blank, '
          'then an exception is thrown', () {
        expect(
          () => requireThat('').mustBeNotBlank(),
          throwsConstraintException<NotBlank>(),
        );
        expect(
          () => requireThat('   ').mustBeNotBlank(),
          throwsConstraintException<NotBlank>(),
        );
        expect(
          () => requireThat('   ').mustBeNotBlank(),
          throwsConstraintException<NotBlank>(
            constraintMessage: 'Must not be blank',
          ),
        );
      });

      test(
          'if the value is blank, '
          'then an exception is thrown - Custom Message', () {
        expect(
          () => requireThat('  ').mustBeNotBlank('must not be blank'),
          throwsConstraintException<NotBlank>(
            constraintMessage: 'must not be blank',
          ),
        );
      });
    });
    group('blank', () {
      test(
          'if the value is null, '
          'then an exception will not be thrown', () {
        String? value;
        expect(() => requireThat(value).mustBeBlank(), returnsNormally);
      });

      test(
          'if the value is blank, '
          'then an exception will not be thrown', () {
        expect(
          () => requireThat('').mustBeBlank(),
          returnsNormally,
        );
        expect(
          () => requireThat('  ').mustBeBlank(),
          returnsNormally,
        );
      });

      test(
          'if the value is not blank, '
          'then an exception is thrown', () {
        expect(
          () => requireThat('value').mustBeBlank(),
          throwsConstraintException<Blank>(),
        );
        expect(
          () => requireThat('value').mustBeBlank(),
          throwsConstraintException<Blank>(
            constraintMessage: 'Must be blank',
          ),
        );
      });

      test(
          'if the value is not blank, '
          'then an exception is thrown - Custom Message', () {
        expect(
          () => requireThat('value').mustBeBlank('must be blank'),
          throwsConstraintException<Blank>(
            constraintMessage: 'must be blank',
          ),
        );
      });
    });

    group('greater', () {
      test(
          'if the value is null, '
          'then an exception will not be thrown', () {
        String? value;
        expect(() => requireThat(value).mustBeGreaterThan(0), returnsNormally);
      });

      test(
        'if the length is greater than the minimum, '
        'then an exception will not be thrown',
        () => expect(
          () => requireThat('value').mustBeGreaterThan(2),
          returnsNormally,
        ),
      );

      test(
          'if the length is less or equal than the minimum, '
          'then an exception is thrown', () {
        expect(
          () => requireThat('value').mustBeGreaterThan(6),
          throwsConstraintException<GreaterThan>(),
        );
        expect(
          () => requireThat('value').mustBeGreaterThan(5),
          throwsConstraintException<GreaterThan>(
            constraintMessage: 'Must be greater than 5',
          ),
        );
      });

      test(
          'if the length is less or equal than the minimum, '
          'then an exception is thrown - Custom Message', () {
        expect(
          () =>
              requireThat('value').mustBeGreaterThan(5, 'must be greater than'),
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
        String? value;
        expect(
          () => requireThat(value).mustBeGreaterThanOrEqualTo(0),
          returnsNormally,
        );
      });

      test(
          'if length is greater or equal to the minimum, '
          'then an exception will not be thrown', () {
        expect(
          () => requireThat('value').mustBeGreaterThanOrEqualTo(3),
          returnsNormally,
        );
        expect(
          () => requireThat('value').mustBeGreaterThanOrEqualTo(5),
          returnsNormally,
        );
      });

      test(
          'if the length is less than the minimum, '
          'then an exception is thrown', () {
        expect(
          () => requireThat('value').mustBeGreaterThanOrEqualTo(6),
          throwsConstraintException<GreaterThanOrEqualTo>(),
        );
        expect(
          () => requireThat('value').mustBeGreaterThanOrEqualTo(10),
          throwsConstraintException<GreaterThanOrEqualTo>(
            constraintMessage: 'Must be greater than or equal to 10',
          ),
        );
      });

      test(
          'if the length is less than the minimum, '
          'then an exception is thrown - Custom Message', () {
        expect(
          () => requireThat('value').mustBeGreaterThanOrEqualTo(
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
          'if the value is null, '
          'then an exception will not be thrown', () {
        String? value;
        expect(() => requireThat(value).mustBeLessThan(0), returnsNormally);
      });

      test(
        'if the length is less than the maximum, '
        'then an exception will not be thrown',
        () => expect(
          () => requireThat('value').mustBeLessThan(10),
          returnsNormally,
        ),
      );

      test(
          'if the length is greater or equal than the maximum, '
          'then an exception is thrown', () {
        expect(
          () => requireThat('value').mustBeLessThan(3),
          throwsConstraintException<LessThan>(),
        );
        expect(
          () => requireThat('value').mustBeLessThan(5),
          throwsConstraintException<LessThan>(
            constraintMessage: 'Must be less than 5',
          ),
        );
      });

      test(
          'if the length is greater or equal than the maximum, '
          'then an exception is thrown - Custom Message', () {
        expect(
          () => requireThat('value').mustBeLessThan(2, 'must be less than'),
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
        String? value;
        expect(
          () => requireThat(value).mustBeLessThanOrEqualTo(0),
          returnsNormally,
        );
      });

      test(
          'if the length is less or equal to the maximum, '
          'then an exception will not be thrown', () {
        expect(
          () => requireThat('value').mustBeLessThanOrEqualTo(10),
          returnsNormally,
        );
        expect(
          () => requireThat('value').mustBeLessThanOrEqualTo(5),
          returnsNormally,
        );
      });

      test(
          'if the length is greater than the maximum, '
          'then an exception is thrown', () {
        expect(
          () => requireThat('value').mustBeLessThanOrEqualTo(4),
          throwsConstraintException<LessThanOrEqualTo>(),
        );
        expect(
          () => requireThat('value').mustBeLessThanOrEqualTo(3),
          throwsConstraintException<LessThanOrEqualTo>(
            constraintMessage: 'Must be less than or equal to 3',
          ),
        );
      });

      test(
          'if the length is greater than the maximum, '
          'then an exception is thrown - Custom Message', () {
        expect(
          () => requireThat('value')
              .mustBeLessThanOrEqualTo(1, 'must be less than or equal to'),
          throwsConstraintException<LessThanOrEqualTo>(
            constraintMessage: 'must be less than or equal to',
          ),
        );
      });
    });
    group('equal - ignore case', () {
      test(
          'if the value is null, '
          'then an exception will not be thrown', () {
        String? value;
        expect(
          () => requireThat(value).mustBeEqualToIgnoringCase('value'),
          returnsNormally,
        );
      });

      test(
          'if the value is the same ignoring case, '
          'then an exception will not be thrown', () {
        expect(
          () => requireThat('value').mustBeEqualToIgnoringCase('value'),
          returnsNormally,
        );
        expect(
          () => requireThat('VALUE').mustBeEqualToIgnoringCase('value'),
          returnsNormally,
        );
        expect(
          () => requireThat('VaLuE').mustBeEqualToIgnoringCase('VALUE'),
          returnsNormally,
        );
      });

      test(
          'if the value is not the same ignoring case, '
          'then an exception is thrown', () {
        expect(
          () => requireThat('value').mustBeEqualToIgnoringCase('valueTest'),
          throwsConstraintException<Equal>(),
        );
        expect(
          () => requireThat('value').mustBeEqualToIgnoringCase('value1'),
          throwsConstraintException<Equal>(
            constraintMessage: 'Must be equal to value1 ignoring case',
          ),
        );
      });

      test(
          'if the value is the same ignoring case, '
          'then an exception is thrown - Custom Message', () {
        expect(
          () => requireThat('value')
              .mustBeEqualToIgnoringCase('value1', 'not the same'),
          throwsConstraintException<Equal>(
            constraintMessage: 'not the same',
          ),
        );
      });
    });
    group('not equal - ignore case', () {
      test(
          'if the value is null, '
          'then an exception will not be thrown', () {
        String? value;
        expect(
          () => requireThat(value).mustBeNotEqualToIgnoringCase('value'),
          returnsNormally,
        );
      });

      test(
          'if the value is the not same ignoring case, '
          'then an exception will not be thrown', () {
        expect(
          () => requireThat('value').mustBeNotEqualToIgnoringCase('value1'),
          returnsNormally,
        );
        expect(
          () => requireThat('VALUE').mustBeNotEqualToIgnoringCase('value2'),
          returnsNormally,
        );
        expect(
          () => requireThat('VaLuE').mustBeNotEqualToIgnoringCase('VALUE@'),
          returnsNormally,
        );
      });

      test(
          'if the value is the same ignoring case, '
          'then an exception is thrown', () {
        expect(
          () => requireThat('value').mustBeNotEqualToIgnoringCase('value'),
          throwsConstraintException<NotEqual>(),
        );
        expect(
          () => requireThat('value').mustBeNotEqualToIgnoringCase('VALUE'),
          throwsConstraintException<NotEqual>(
            constraintMessage: 'Must be not equal to VALUE ignoring case',
          ),
        );
      });

      test(
          'if the value is same ignoring case, '
          'then an exception is thrown - Custom Message', () {
        expect(
          () => requireThat('value')
              .mustBeNotEqualToIgnoringCase('value', 'same'),
          throwsConstraintException<NotEqual>(constraintMessage: 'same'),
        );
      });
    });
    group('match', () {
      final letterRegex = RegExp('[a-zA-Z]');

      test(
          'if the value is null, '
          'then an exception will not be thrown', () {
        String? value;
        expect(
          () => requireThat(value).mustBeRegexMatch(letterRegex),
          returnsNormally,
        );
      });

      test(
          'if the value matches, '
          'then an exception will not be thrown', () {
        expect(
          () => requireThat('value').mustBeRegexMatch(letterRegex),
          returnsNormally,
        );
        expect(
          () =>
              requireThat('value@flutter.com.br').mustBeRegexMatch(letterRegex),
          returnsNormally,
        );
      });

      test(
          'if the value not matches, '
          'then an exception is thrown', () {
        expect(
          () => requireThat('123').mustBeRegexMatch(letterRegex),
          throwsConstraintException<Match>(),
        );
        expect(
          () => requireThat('@@').mustBeRegexMatch(letterRegex),
          throwsConstraintException<Match>(
            constraintMessage: 'Must be a regex(${letterRegex.pattern}) match',
          ),
        );
      });

      test(
          'if the value not matches, '
          'then an exception is thrown - Custom Message', () {
        expect(
          () => requireThat('@@').mustBeRegexMatch(letterRegex, 'match'),
          throwsConstraintException<Match>(constraintMessage: 'match'),
        );
      });
    });
    group('email', () {
      test(
          'if the value is null, '
          'then an exception will not be thrown', () {
        String? value;
        expect(() => requireThat(value).mustBeEmail(), returnsNormally);
      });

      test(
          'if the value is an email, '
          'then an exception will not be thrown', () {
        expect(
          () => requireThat('test@test.com.br').mustBeEmail(),
          returnsNormally,
        );
        expect(
          () => requireThat('email@google.com').mustBeEmail(),
          returnsNormally,
        );
      });

      test(
          'if the value is not an email, '
          'then an exception is thrown', () {
        expect(
          () => requireThat('test').mustBeEmail(),
          throwsConstraintException<Email>(
            constraintMessage: 'Must be an email',
          ),
        );
      });

      test(
          'if the value is not an email, '
          'then an exception is thrown - Custom Message', () {
        expect(
          () => requireThat('test').mustBeEmail('email'),
          throwsConstraintException<Email>(constraintMessage: 'email'),
        );
      });
    });

    group('only numbers', () {
      test(
          'if the value is null, '
          'then an exception will not be thrown', () {
        String? value;
        expect(() => requireThat(value).mustBeOnlyNumbers(), returnsNormally);
      });

      test(
          'if the value has only numbers, '
          'then an exception will not be thrown', () {
        expect(() => requireThat('458').mustBeOnlyNumbers(), returnsNormally);
        expect(() => requireThat('89458').mustBeOnlyNumbers(), returnsNormally);
      });

      test(
          'if the value has not only numbers, '
          'then an exception is thrown', () {
        expect(
          () => requireThat('1test123').mustBeOnlyNumbers(),
          throwsConstraintException<OnlyNumbers>(
            constraintMessage: 'Must be only numbers',
          ),
        );
      });

      test(
          'if the value has not only numbers, '
          'then an exception is thrown - Custom Message', () {
        expect(
          () => requireThat('1n').mustBeOnlyNumbers('must be only numbers'),
          throwsConstraintException<OnlyNumbers>(
            constraintMessage: 'must be only numbers',
          ),
        );
      });
    });

    group('started with', () {
      test(
          'if the value is null, '
          'then an exception will not be thrown', () {
        String? value;
        expect(
          () => requireThat(value).mustBeStartedWith('value'),
          returnsNormally,
        );
      });

      test(
        'if the String is started with the value, '
        'then an exception will not be thrown',
        () => expect(
          () => requireThat('123').mustBeStartedWith('1'),
          returnsNormally,
        ),
      );

      test(
          'if the String is not started with the value, '
          'then an exception is thrown', () {
        expect(
          () => requireThat('value').mustBeStartedWith('1'),
          throwsConstraintException<StartedWith>(),
        );
        expect(
          () => requireThat('value').mustBeStartedWith('lue'),
          throwsConstraintException<StartedWith>(
            constraintMessage: 'Must be started with lue',
          ),
        );
      });

      test(
          'if the String is not started with the value, '
          'then an exception is thrown - Custom Message', () {
        expect(
          () => requireThat('value')
              .mustBeStartedWith('lue', 'must be started with lue'),
          throwsConstraintException<StartedWith>(
            constraintMessage: 'must be started with lue',
          ),
        );
      });
    });

    group('end with', () {
      test(
          'if the value is null, '
          'then an exception will not be thrown', () {
        String? value;
        expect(
          () => requireThat(value).mustBeEndedWith('value'),
          returnsNormally,
        );
      });

      test(
        'if the String is ended with the value, '
        'then an exception will not be thrown',
        () => expect(
          () => requireThat('123').mustBeEndedWith('23'),
          returnsNormally,
        ),
      );

      test(
          'if the String is not ended with the value, '
          'then an exception is thrown', () {
        expect(
          () => requireThat('value').mustBeEndedWith('1'),
          throwsConstraintException<EndedWith>(),
        );
        expect(
          () => requireThat('value').mustBeEndedWith('valu'),
          throwsConstraintException<EndedWith>(
            constraintMessage: 'Must be ended with valu',
          ),
        );
      });

      test(
          'if the String is not ended with the value, '
          'then an exception is thrown - Custom Message', () {
        expect(
          () => requireThat('value')
              .mustBeEndedWith('valu', 'must be ended with valu'),
          throwsConstraintException<EndedWith>(
            constraintMessage: 'must be ended with valu',
          ),
        );
      });
    });
  });
}
