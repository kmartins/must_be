import 'package:meta/meta.dart';
import 'package:must_be/src/constraints/constraint.dart';

/// Verifies type
typedef WhenCheck = bool Function(Constraint constraint);

/// Verifies if the constraint is the same type that [V].
// ignore: library_private_types_in_public_api
WhenCheck isType<V extends Constraint>() => (constraint) => constraint is V;

/// {@template constraint_exception}
/// Exception thrown when a [value] violates a constraint.
/// Use a [name] to name the value.
/// {@endtemplate}
@sealed
@immutable
class ConstraintException implements Exception {
  /// {@macro constraint_exception}
  const ConstraintException(this.constraintViolation, [this.name, this.value]);

  /// {@macro constraint}
  final Constraint constraintViolation;

  /// Name of the invalid argument, if available.
  final String? name;

  /// The value that violated the constraint.
  final Object? value;

  /// Verifies if the [constraintViolation] type contains in the [branches],
  /// if yes, then calls the function and returns its value,
  /// otherwise throw an [ArgumentError].
  V when<V>(
    // ignore: library_private_types_in_public_api
    Map<WhenCheck, V Function(Constraint constraint)> branches,
  ) {
    final when = whenOrNull(branches);
    if (when != null) {
      return when;
    }
    throw ArgumentError(
      'The constraint ${constraintViolation.runtimeType} must be passed',
    );
  }

  /// Verifies if the [constraintViolation] type contains in the [branches],
  /// if yes, then calls the function and returns its value,
  /// otherwise returns null.
  V? whenOrNull<V>(
    // ignore: library_private_types_in_public_api
    Map<WhenCheck, V Function(Constraint constraint)> branches,
  ) {
    assert(
      branches.isNotEmpty,
      'must be pass at least one value for the branches',
    );

    for (final key in branches.keys) {
      if (key(constraintViolation)) {
        final branch = branches[key];
        if (branch != null) {
          return branch(constraintViolation);
        }
      }
    }
    return null;
  }

  @override
  String toString() {
    final formattedName = name != null ? ' ($name)' : '';
    final valueToSafeString = Error.safeToString(value);
    final formattedValue = value != null ? ': $valueToSafeString' : '';
    return 'ConstraintException$formattedName: '
        '$constraintViolation$formattedValue';
  }
}
