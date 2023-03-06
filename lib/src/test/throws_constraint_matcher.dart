import 'package:meta/meta.dart';
import 'package:must_be/src/constraints/constraint.dart';
import 'package:must_be/src/constraints/constraint_exception.dart';
import 'package:test/test.dart';

/// Helper function to test the [ConstraintException] thrown.
@visibleForTesting
Matcher throwsConstraintException<T extends Constraint>({
  String? name,
  String? constraintMessage,
  Object? value,
}) {
  return throwsA(
    isA<ConstraintException>()
        .having(
          (ex) => ex.constraintViolation,
          'constraint violation',
          isA<T>(),
        )
        .having(
          (ex) =>
              constraintMessage == null ? null : ex.constraintViolation.message,
          'message',
          constraintMessage,
        )
        .having(
          (ex) => name == null ? null : ex.name,
          'name',
          name,
        )
        .having(
          (ex) => value == null ? null : ex.value,
          'value',
          value,
        ),
  );
}
