part of 'constraint.dart';

/// {@template not_null}
/// Represents the constraint when a value
/// is must be not null.
/// {@endtemplate}
final class NotNull extends Constraint {
  /// {@macro not_null}
  const NotNull([String? message]) : super(message ?? 'Must be not null');
}

/// {@template null}
/// Represents the constraint when a value
/// must be null.
/// {@endtemplate}
final class Null extends Constraint {
  /// {@macro null}
  const Null([String? message]) : super(message ?? 'Must be null');
}

/// {@template greater_than}
/// Represents the constraint when a value
/// must be greater than another value.
/// {@endtemplate}
final class GreaterThan<T extends Object> extends Constraint {
  /// {@macro greater_than}
  const GreaterThan(this.min, [String? message])
      : super(message ?? 'Must be greater than $min');

  /// The min value that the [T] must be.
  final T min;
}

/// {@template greater_than_equal_to}
/// Represents the constraint when a value
/// must be greater than or equal to another value.
/// {@endtemplate}
final class GreaterThanOrEqualTo<T extends Object> extends Constraint {
  /// {@macro greater_than_equal_to}
  const GreaterThanOrEqualTo(this.min, [String? message])
      : super(message ?? 'Must be greater than or equal to $min');

  /// The min or equal value that the [T] must be.
  final T min;
}

/// {@template less_than}
/// Represents the constraint when a value
/// must be less than another value.
/// {@endtemplate}
final class LessThan<T extends Object> extends Constraint {
  /// {@macro less_than}
  const LessThan(this.max, [String? message])
      : super(message ?? 'Must be less than $max');

  /// The max value that the [T] must be.
  final T max;
}

/// {@template less_than_equal_to}
/// Represents the constraint when a value
/// must be less than or equal to another value.
/// {@endtemplate}
final class LessThanOrEqualTo<T extends Object> extends Constraint {
  /// {@macro less_than_equal_to}
  const LessThanOrEqualTo(this.max, [String? message])
      : super(message ?? 'Must be less than or equal to $max');

  /// The max or equal value that the [T] must be.
  final T max;
}

/// {@template equal}
/// Represents the constraint when a value
/// must be equal to another value.
/// {@endtemplate}
final class Equal<T extends Object> extends Constraint {
  /// {@macro equal}
  const Equal(this.equal, [String? message])
      : super(message ?? 'Must be equal to $equal');

  /// The equal value that the [T] must be.
  final T equal;
}

/// {@template not_equal}
/// Represents the constraint when a value
/// must be not equal to another value.
/// {@endtemplate}
final class NotEqual<T extends Object> extends Constraint {
  /// {@macro not_equal}
  const NotEqual(this.equal, [String? message])
      : super(message ?? 'Must be not equal to $equal');

  /// The not equal value that the [T] must be.
  final T equal;
}

/// {@template empty}
/// Represents the constraint when a value
/// must be empty.
/// {@endtemplate}
final class Empty extends Constraint {
  /// {@macro empty}
  const Empty([String? message]) : super(message ?? 'Must be empty');
}

/// {@template not_empty}
/// Represents the constraint when a value
/// must be not empty.
/// {@endtemplate}
final class NotEmpty extends Constraint {
  /// {@macro not_empty}
  const NotEmpty([String? message]) : super(message ?? 'Must not be empty');
}

/// {@template blank}
/// Represents the constraint when a [String]
/// must be a valid credit card.
/// {@endtemplate}
final class CreditCard extends Constraint {
  /// {@macro blank}
  const CreditCard([String? message])
      : super(
          message ?? 'Must be a valid credit card',
        );
}

/// {@template blank}
/// Represents the constraint when a [String]
/// must be a valid zip code.
/// {@endtemplate}
final class ZipCode extends Constraint {
  /// {@macro blank}
  const ZipCode([String? message])
      : super(
          message ?? 'Must be a valid zip code',
        );
}
