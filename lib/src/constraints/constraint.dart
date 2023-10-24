// ignore_for_file: no_runtimetype_tostring

import 'package:meta/meta.dart';

part 'common_constraint.dart';
part 'date_constraint.dart';
part 'string_constraint.dart';

/// {@template constraint}
/// Represents the type of constraint the value is violating.
/// The [message] describes the constraint details.
/// {@endtemplate}
@immutable
class Constraint {
  /// {@macro constraint}
  const Constraint([this.message]);

  /// Message describing the constraint.
  final String? message;

  @override
  String toString() {
    if (message == null) {
      return 'Constraint violation: $runtimeType';
    }
    return message!;
  }
}

/// {@template constraint}
/// Default constraint.
/// {@endtemplate}
final class Invalid extends Constraint {
  /// {@macro invalid}
  const Invalid([super.message]);
}
