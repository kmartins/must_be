import 'package:meta/meta.dart';
import 'package:must_be/src/constraints/constraints.dart';

/// Function used for the customizes the constraint message.
typedef OnConstraintException = String Function(
  ConstraintException constraintException,
);

///Translate constraint message when called validate function.
@immutable
final class ValidationsLocalization {
  const ValidationsLocalization._(); // coverage:ignore-line
  static final _map = <String, OnConstraintException>{};

  /// Calls when validate the data, if null,
  /// then the default is returns the violation constraint message.
  static String translate(
    ConstraintException constraintException,
  ) {
    final constraint = constraintException.constraintViolation;
    return _map[constraint.runtimeType.toString()] == null
        ? constraint.message!
        : _map[constraint.runtimeType.toString()]!(constraintException);
  }

  /// Customizes the constraint message.
  static void on<T extends Constraint>(
    OnConstraintException onConstraintException,
  ) =>
      _map[T.toString()] = onConstraintException;

  /// Clear all the translations.
  @visibleForTesting
  static void clear() => _map.clear();
}
