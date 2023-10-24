part of 'constraint.dart';

/// {@template blank}
/// Represents the constraint when a [String]
/// must be blank.
/// {@endtemplate}
final class Blank extends Constraint {
  /// {@macro blank}
  const Blank([String? message]) : super(message ?? 'Must be blank');
}

/// {@template not_blank}
/// Represents the constraint when a [String]
/// must be not blank.
/// {@endtemplate}
final class NotBlank extends Constraint {
  /// {@macro not_blank}
  const NotBlank([String? message]) : super(message ?? 'Must not be blank');
}

/// {@template match}
/// Represents the constraint when a [String]
/// must have a match with a regex.
/// {@endtemplate}
final class Match extends Constraint {
  /// {@macro match}
  Match(this.regex, [String? message])
      : super(message ?? 'Must be a regex(${regex.pattern}) match');

  /// Regex that the value must be match.
  final RegExp regex;
}

/// {@template email}
/// Represents the constraint when a [String]
/// must be an email.
/// {@endtemplate}
final class Email extends Constraint {
  /// {@macro email}
  const Email([String? message]) : super(message ?? 'Must be an email');
}

/// {@template url}
/// Represents the constraint when a [String]
/// must be a url.
/// {@endtemplate}
final class Url extends Constraint {
  /// {@macro url}
  const Url([String? message]) : super(message ?? 'Must be a url');
}

/// {@template only_numbers}
/// Represents the constraint when a [String]
/// must have only numbers.
/// {@endtemplate}
final class OnlyNumbers extends Constraint {
  /// {@macro only_numbers}
  const OnlyNumbers([String? message])
      : super(message ?? 'Must be only numbers');
}

/// {@template started_with}
/// Represents the constraint when a [String]
/// must be started with the [start].
/// {@endtemplate}
final class StartedWith extends Constraint {
  /// {@macro started_with}
  const StartedWith(this.start, [String? message])
      : super(message ?? 'Must be started with $start');

  /// The value that must be started.
  final String start;
}

/// {@template ended_with}
/// Represents the constraint when a [String]
/// must be ended with the [end].
/// {@endtemplate}
final class EndedWith extends Constraint {
  /// {@macro ended_with}
  const EndedWith(this.end, [String? message])
      : super(message ?? 'Must be ended with $end');

  /// The value that must be ended.
  final String end;
}
