import 'package:must_be/must_be.dart';
import 'package:test/test.dart';

void main() {
  final today = DateTime(2022);
  final date2023 = DateTime(2023);
  final date2022 = DateTime(2022);
  final date2021 = DateTime(2021);
  final date2020 = DateTime(2020);
  final date2019 = DateTime(2019);

  RequireDate.mockCurrentDateTime = today;

  String formattedDate(DateTime dateTime) =>
      "${dateTime.year}-${dateTime.month.toString().padLeft(2, '0')}-"
      "${dateTime.day.toString().padLeft(2, '0')}";

  group('RequireDate', () {
    group('greater', () {
      test(
          'if the date is null, '
          'then an exception will not be thrown', () {
        DateTime? date;
        expect(
          () => requireThat(date).mustBeGreaterThan(today),
          returnsNormally,
        );
      });

      test(
        'if the date is greater than the minimum, '
        'then an exception will not be thrown',
        () => expect(
          () => requireThat(date2021).mustBeGreaterThan(date2020),
          returnsNormally,
        ),
      );

      test(
          'if the date is less or equal than the minimum, '
          'then an exception is thrown', () {
        expect(
          () => requireThat(date2022).mustBeGreaterThan(date2023),
          throwsConstraintException<GreaterThan>(),
        );
        expect(
          () => requireThat(date2022).mustBeGreaterThan(date2022),
          throwsConstraintException<GreaterThan>(
            constraintMessage:
                'Must be greater than ${formattedDate(date2022)}',
          ),
        );
      });

      test(
          'if the date is less or equal than the minimum, '
          'then an exception is thrown - Custom Message', () {
        expect(
          () => requireThat(date2022)
              .mustBeGreaterThan(date2023, 'must be greater than'),
          throwsConstraintException<GreaterThan>(
            constraintMessage: 'must be greater than',
          ),
        );
      });

      group('today', () {
        test(
            'if the date is null, '
            'then an exception will not be thrown', () {
          DateTime? date;
          expect(
            () => requireThat(date).mustBeGreaterThanToday(),
            returnsNormally,
          );
        });

        test(
          'if the date is greater than today, '
          'then an exception will not be thrown',
          () => expect(
            () => requireThat(today.add(const Duration(days: 1)))
                .mustBeGreaterThanToday(),
            returnsNormally,
          ),
        );

        test(
            'if the date is less or equal than today, '
            'then an exception is thrown', () {
          expect(
            () => requireThat(date2021).mustBeGreaterThanToday(),
            throwsConstraintException<GreaterThanToday>(),
          );
          expect(
            () => requireThat(date2021).mustBeGreaterThanToday(),
            throwsConstraintException<GreaterThanToday>(
              constraintMessage:
                  'Must be greater than today, ${formattedDate(today)}',
            ),
          );
        });

        test(
            'if the date is less or equal than today, '
            'then an exception is thrown - Custom Message', () {
          expect(
            () => requireThat(date2021)
                .mustBeGreaterThanToday('must be greater than today'),
            throwsConstraintException<GreaterThanToday>(
              constraintMessage: 'must be greater than today',
            ),
          );
        });
      });
    });
    group('greater than or equal to', () {
      test(
          'if the date is null, '
          'then an exception will not be thrown', () {
        DateTime? date;
        expect(
          () => requireThat(date).mustBeGreaterThanOrEqualTo(date2021),
          returnsNormally,
        );
      });

      test(
          'if the date is greater or equal to the minimum, '
          'then an exception will not be thrown', () {
        expect(
          () => requireThat(date2022).mustBeGreaterThanOrEqualTo(date2020),
          returnsNormally,
        );
        expect(
          () => requireThat(date2022).mustBeGreaterThanOrEqualTo(date2022),
          returnsNormally,
        );
      });

      test(
          'if the date is less than the minimum, '
          'then an exception is thrown', () {
        expect(
          () => requireThat(date2022).mustBeGreaterThanOrEqualTo(date2023),
          throwsConstraintException<GreaterThanOrEqualTo>(),
        );
        expect(
          () => requireThat(date2020).mustBeGreaterThanOrEqualTo(date2022),
          throwsConstraintException<GreaterThanOrEqualTo>(
            constraintMessage:
                'Must be greater than or equal to ${formattedDate(date2022)}',
          ),
        );
      });

      test(
          'if the date is less than the minimum, '
          'then an exception is thrown - Custom Message', () {
        expect(
          () => requireThat(DateTime(2001)).mustBeGreaterThanOrEqualTo(
            date2022,
            'must be greater than or equal to',
          ),
          throwsConstraintException<GreaterThanOrEqualTo>(
            constraintMessage: 'must be greater than or equal to',
          ),
        );
      });

      group('today', () {
        test(
            'if the date is null, '
            'then an exception will not be thrown', () {
          DateTime? date;
          expect(
            () => requireThat(date).mustBeGreaterThanOrEqualToToday(),
            returnsNormally,
          );
        });

        test(
            'if the date is greater than or equal to today, '
            'then an exception will not be thrown', () {
          expect(
            () => requireThat(date2023).mustBeGreaterThanOrEqualToToday(),
            returnsNormally,
          );
          expect(
            () => requireThat(today).mustBeGreaterThanOrEqualToToday(),
            returnsNormally,
          );
        });

        test(
            'if the date is less than today, '
            'then an exception is thrown', () {
          expect(
            () => requireThat(date2021).mustBeGreaterThanOrEqualToToday(),
            throwsConstraintException<GreaterThanOrEqualToToday>(),
          );
          expect(
            () => requireThat(date2020).mustBeGreaterThanOrEqualToToday(),
            throwsConstraintException<GreaterThanOrEqualToToday>(
              constraintMessage: 'Must be greater than or equal today, '
                  '${formattedDate(today)}',
            ),
          );
        });

        test(
            'if the date is less than today, '
            'then an exception is thrown - Custom Message', () {
          expect(
            () => requireThat(date2021).mustBeGreaterThanOrEqualToToday(
              'must be greater than or equal to today',
            ),
            throwsConstraintException<GreaterThanOrEqualToToday>(
              constraintMessage: 'must be greater than or equal to today',
            ),
          );
        });
      });
    });

    group('less', () {
      test(
          'if the date is null, '
          'then an exception will not be thrown', () {
        DateTime? date;
        expect(() => requireThat(date).mustBeLessThan(today), returnsNormally);
      });

      test(
        'if the date is less than the maximum, '
        'then an exception will not be thrown',
        () => expect(
          () => requireThat(date2022).mustBeLessThan(DateTime(2025)),
          returnsNormally,
        ),
      );

      test(
          'if the date is greater or equal than the maximum, '
          'then an exception is thrown', () {
        expect(
          () => requireThat(date2022).mustBeLessThan(date2021),
          throwsConstraintException<LessThan>(),
        );
        expect(
          () => requireThat(date2021).mustBeLessThan(date2019),
          throwsConstraintException<LessThan>(
            constraintMessage: 'Must be less than ${formattedDate(date2019)}',
          ),
        );
      });

      test(
          'if the date is greater or equal than the maximum, '
          'then an exception is thrown - Custom Message', () {
        expect(
          () => requireThat(date2019)
              .mustBeLessThan(date2019, 'must be less than'),
          throwsConstraintException<LessThan>(
            constraintMessage: 'must be less than',
          ),
        );
      });

      group('today', () {
        test(
            'if the date is null, '
            'then an exception will not be thrown', () {
          DateTime? date;
          expect(
            () => requireThat(date).mustBeLessThanToday(),
            returnsNormally,
          );
        });

        test(
          'if the date is less than today, '
          'then an exception will not be thrown',
          () => expect(
            () => requireThat(date2019).mustBeLessThanToday(),
            returnsNormally,
          ),
        );

        test(
            'if the date is greater than or equal to today, '
            'then an exception is thrown', () {
          expect(
            () => requireThat(date2023).mustBeLessThanToday(),
            throwsConstraintException<LessThanToday>(),
          );
          expect(
            () => requireThat(today).mustBeLessThanToday(),
            throwsConstraintException<LessThanToday>(
              constraintMessage:
                  'Must be less than today, ${formattedDate(today)}',
            ),
          );
        });

        test(
            'if the date is greater than or equal to today, '
            'then an exception is thrown - Custom Message', () {
          expect(
            () => requireThat(today)
                .mustBeLessThanToday('must be less than today'),
            throwsConstraintException<LessThanToday>(
              constraintMessage: 'must be less than today',
            ),
          );
        });
      });
    });
    group('less or equal', () {
      test(
          'if the date is null, '
          'then an exception will not be thrown', () {
        DateTime? date;
        expect(
          () => requireThat(date).mustBeLessThanOrEqualTo(today),
          returnsNormally,
        );
      });

      test(
          'if the date is less or equal to the maximum, '
          'then an exception will not be thrown', () {
        expect(
          () => requireThat(date2019).mustBeLessThanOrEqualTo(date2020),
          returnsNormally,
        );
        expect(
          () => requireThat(date2022).mustBeLessThanOrEqualTo(date2022),
          returnsNormally,
        );
      });

      test(
          'if the date is greater than the maximum, '
          'then an exception is thrown', () {
        expect(
          () => requireThat(date2022).mustBeLessThanOrEqualTo(date2021),
          throwsConstraintException<LessThanOrEqualTo>(),
        );
        expect(
          () => requireThat(date2020).mustBeLessThanOrEqualTo(date2019),
          throwsConstraintException<LessThanOrEqualTo>(
            constraintMessage:
                'Must be less than or equal to ${formattedDate(date2019)}',
          ),
        );
      });

      test(
          'if the date is greater than the maximum, '
          'then an exception is thrown - Custom Message', () {
        expect(
          () => requireThat(date2020).mustBeLessThanOrEqualTo(
            date2019,
            'must be less than or equal to',
          ),
          throwsConstraintException<LessThanOrEqualTo>(
            constraintMessage: 'must be less than or equal to',
          ),
        );
      });

      group('today', () {
        test(
            'if the date is null, '
            'then an exception will not be thrown', () {
          DateTime? date;
          expect(
            () => requireThat(date).mustBeLessThanOrEqualToToday(),
            returnsNormally,
          );
        });

        test(
            'if the date is less or equal than today, '
            'then an exception will not be thrown', () {
          expect(
            () => requireThat(date2019).mustBeLessThanOrEqualToToday(),
            returnsNormally,
          );
          expect(
            () => requireThat(today).mustBeLessThanOrEqualToToday(),
            returnsNormally,
          );
        });

        test(
            'if the date is less than today, '
            'then an exception is thrown', () {
          expect(
            () => requireThat(date2023).mustBeLessThanOrEqualToToday(),
            throwsConstraintException<LessThanOrEqualToToday>(),
          );
          expect(
            () => requireThat(date2023).mustBeLessThanOrEqualToToday(),
            throwsConstraintException<LessThanOrEqualToToday>(
              constraintMessage:
                  'Must be less than or equal to today, ${formattedDate(today)}',
            ),
          );
        });

        test(
            'if the date is less than today, '
            'then an exception is thrown - Custom Message', () {
          expect(
            () => requireThat(date2023)
                .mustBeLessThanOrEqualToToday('less or equal today'),
            throwsConstraintException<LessThanOrEqualToToday>(
              constraintMessage: 'less or equal today',
            ),
          );
        });
      });
    });

    group('same day', () {
      test(
          'if the date is null, '
          'then an exception will not be thrown', () {
        DateTime? date;
        expect(() => requireThat(date).mustBeSameDay(today), returnsNormally);
      });

      test(
          'if the date is the same, '
          'then an exception will not be thrown', () {
        expect(
          () => requireThat(date2020).mustBeSameDay(date2020),
          returnsNormally,
        );
        expect(
          () => requireThat(date2022).mustBeSameDay(date2022),
          returnsNormally,
        );
      });

      test(
          'if the day is different '
          'then an exception is thrown', () {
        expect(
          () => requireThat(date2022).mustBeSameDay(date2021),
          throwsConstraintException<SameDay>(),
        );
        expect(
          () => requireThat(date2020).mustBeSameDay(date2019),
          throwsConstraintException<SameDay>(
            constraintMessage:
                'Must be the same as the day, ${formattedDate(date2019)}',
          ),
        );
      });

      test(
          'if the date is greater than the maximum, '
          'then an exception is thrown - Custom Message', () {
        expect(
          () => requireThat(date2020).mustBeSameDay(date2019, 'same day'),
          throwsConstraintException<SameDay>(
            constraintMessage: 'same day',
          ),
        );
      });

      group('not same day', () {
        test(
            'if the date is null, '
            'then an exception will not be thrown', () {
          DateTime? date;
          expect(
            () => requireThat(date).mustBeNotSameDay(today),
            returnsNormally,
          );
        });

        test(
            'if the date is not the same, '
            'then an exception will not be thrown', () {
          expect(
            () => requireThat(date2020).mustBeNotSameDay(date2021),
            returnsNormally,
          );
          expect(
            () => requireThat(date2022).mustBeNotSameDay(date2021),
            returnsNormally,
          );
        });

        test(
            'if the day is the same '
            'then an exception is thrown', () {
          expect(
            () => requireThat(date2022).mustBeNotSameDay(date2022),
            throwsConstraintException<NotSameDay>(),
          );
          expect(
            () => requireThat(date2020).mustBeNotSameDay(date2020),
            throwsConstraintException<NotSameDay>(
              constraintMessage:
                  'Must be not the same as the day, ${formattedDate(date2020)}',
            ),
          );
        });

        test(
            'if the day is the same, '
            'then an exception is thrown - Custom Message', () {
          expect(
            () => requireThat(date2019).mustBeNotSameDay(
              date2019,
              'is not the same day',
            ),
            throwsConstraintException<NotSameDay>(
              constraintMessage: 'is not the same day',
            ),
          );
        });

        group('today', () {
          test(
              'if the date is null, '
              'then an exception will not be thrown', () {
            DateTime? date;
            expect(() => requireThat(date).mustBeSameToday(), returnsNormally);
          });

          test(
              'if the date is the same as today, '
              'then an exception will not be thrown', () {
            expect(() => requireThat(today).mustBeSameToday(), returnsNormally);
          });

          test(
              'if the date is different as today, '
              'then an exception is thrown', () {
            expect(
              () => requireThat(date2021).mustBeSameToday(),
              throwsConstraintException<SameToday>(),
            );
            expect(
              () => requireThat(date2023).mustBeSameToday(),
              throwsConstraintException<SameToday>(
                constraintMessage: 'Must be the same date as the today, '
                    '${formattedDate(today)}',
              ),
            );
          });

          test(
              'if the date is different as today, '
              'then an exception is thrown - Custom Message', () {
            expect(
              () => requireThat(date2021).mustBeSameToday('same today'),
              throwsConstraintException<SameToday>(
                constraintMessage: 'same today',
              ),
            );
          });
        });

        group('not today', () {
          test(
              'if the date is null, '
              'then an exception will not be thrown', () {
            DateTime? date;
            expect(
              () => requireThat(date).mustBeNotSameToday(),
              returnsNormally,
            );
          });

          test(
              'if the date is not the same as today, '
              'then an exception will not be thrown', () {
            expect(
              () => requireThat(date2021).mustBeNotSameToday(),
              returnsNormally,
            );
          });

          test(
              'if the date is the same today, '
              'then an exception is thrown', () {
            expect(
              () => requireThat(today).mustBeNotSameToday(),
              throwsConstraintException<NotSameToday>(),
            );
            expect(
              () => requireThat(today).mustBeNotSameToday(),
              throwsConstraintException<NotSameToday>(
                constraintMessage: 'Must be not the same date as the today, '
                    '${formattedDate(today)}',
              ),
            );
          });

          test(
              'if the date is the same today, '
              'then an exception is thrown - Custom Message', () {
            expect(
              () => requireThat(today)
                  .mustBeNotSameToday('is not the same today'),
              throwsConstraintException<NotSameToday>(
                constraintMessage: 'is not the same today',
              ),
            );
          });
        });
      });
    });
  });
}
