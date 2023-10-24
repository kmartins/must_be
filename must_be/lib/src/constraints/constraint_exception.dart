import 'package:meta/meta.dart';
import 'package:must_be/src/constraints/constraint.dart';

/// {@template constraint_exception}
/// Exception thrown when a [value] violates a constraint.
/// Use a [name] to name the value.
/// {@endtemplate}
@immutable
final class ConstraintException implements Exception {
  /// {@macro constraint_exception}
  const ConstraintException(this.constraintViolation, [this.name, this.value]);

  /// {@macro constraint}
  final Constraint constraintViolation;

  /// Name of the invalid argument, if available.
  final String? name;

  /// The value that violated the constraint.
  final Object? value;

  @override
  String toString() {
    final formattedName = name != null ? ' ($name)' : '';
    final valueToSafeString = Error.safeToString(value);
    final formattedValue = value != null ? ': $valueToSafeString' : '';
    return 'ConstraintException$formattedName: '
        '$constraintViolation$formattedValue';
  }
}
