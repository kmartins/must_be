import 'package:must_be/src/constraints/constraint.dart';

/// {@template same_day}
/// Represents the constraint when a [DateTime]
/// must have the same day as the other [DateTime].
/// {@endtemplate}
class SameDay extends Constraint {
  /// {@macro same_day}
  const SameDay(this.date, [String? message]) : super(message);

  /// The day that the value must be.
  final DateTime date;
}

/// {@template not_same_day}
/// Represents the constraint when a [DateTime]
/// not must have the same day as the other [DateTime].
/// {@endtemplate}
class NotSameDay extends Constraint {
  /// {@macro not_same_day}
  const NotSameDay(this.date, [String? message]) : super(message);

  /// The day that the value not must be.
  final DateTime date;
}

/// {@template same_today}
/// Represents the constraint when a [DateTime]
/// must be the same day as the current date[DateTime.now].
/// {@endtemplate}
class SameToday extends Constraint {
  /// {@macro same_today}
  const SameToday(this.date, [String? message]) : super(message);

  /// The day that the value must be.
  final DateTime date;
}

/// {@template not_same_today}
/// Represents the constraint when a [DateTime]
/// must not be the same day as the current date.
/// {@endtemplate}
class NotSameToday extends Constraint {
  /// {@macro not_same_today}
  const NotSameToday(this.date, [String? message]) : super(message);

  /// The day that the value not must be.
  final DateTime date;
}

/// {@template greater_than_today}
/// Represents the constraint when a [DateTime]
/// must be greater than today [DateTime.now].
/// {@endtemplate}
class GreaterThanToday extends Constraint {
  /// {@macro greater_than_today}
  const GreaterThanToday(this.date, [String? message]) : super(message);

  /// The day that the value not must be.
  final DateTime date;
}

/// {@template greater_than_or_equal_to_today}
/// Represents the constraint when a [DateTime]
/// must be greater or equal to today [DateTime.now].
/// {@endtemplate}
class GreaterThanOrEqualToToday extends Constraint {
  /// {@macro greater_than_or_equal_to_today}
  const GreaterThanOrEqualToToday(this.date, [String? message])
      : super(message);

  /// The day that the value not must be.
  final DateTime date;
}

/// {@template less_than_today}
/// Represents the constraint when a [DateTime]
/// must be less that today [DateTime.now].
/// {@endtemplate}
class LessThanToday extends Constraint {
  /// {@macro less_than_today}
  const LessThanToday(this.date, [String? message]) : super(message);

  /// The day that the value not must be.
  final DateTime date;
}

/// {@template less_than_or_equal_to_today}
/// Represents the constraint when a [DateTime]
/// must be less or equal to today [DateTime.now].
/// {@endtemplate}
class LessThanOrEqualToToday extends Constraint {
  /// {@macroless_than_or_equal_to_today}
  const LessThanOrEqualToToday(this.date, [String? message]) : super(message);

  /// The day that the value not must be.
  final DateTime date;
}
