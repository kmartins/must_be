import 'package:must_be/src/constraints/constraint_exception.dart';
import 'package:must_be/src/validations_localization.dart';

/// Calls validation function and if thrown an [ConstraintException]
/// then the [ifNotValid] function is called if null then
/// the translation is called, otherwise, nothing occurs.
///
/// Use when validating data:
///
/// ```dart
///void validateEmail(String email) {
///  requireThat(email).mustBeEmail();
///}
///void main() {
///  validate(
///     validation: () => validateEmail('test'),
///     ifNotValid: (constraintException) {},
/// );
///}
/// ```
String? validate(
  void Function() validation, {
  String? Function(ConstraintException constraintError)? ifNotValid,
}) {
  try {
    validation();
  } on ConstraintException catch (constraintException) {
    return ifNotValid?.call(constraintException) ??
        ValidationsLocalization.translate(constraintException);
  }
  return null;
}
