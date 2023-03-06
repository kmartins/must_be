import 'package:must_be/src/constraints/constraint.dart';

/// {@template same_day}
/// Represents the constraint when a [DateTime]
/// must have the same day the other [DateTime].
/// {@endtemplate}
class SameDay extends Constraint {
  /// {@macro same_day}
  const SameDay(this.date, [String? message]) : super(message);

  /// The day that the value must be.
  final DateTime date;
}

/// {@template not_same_day}
/// Represents the constraint when a [DateTime]
/// not must have the same day the other [DateTime].
/// {@endtemplate}
class NotSameDay extends Constraint {
  /// {@macro not_same_day}
  const NotSameDay(this.date, [String? message]) : super(message);

  /// The day that the value not must be.
  final DateTime date;
}
