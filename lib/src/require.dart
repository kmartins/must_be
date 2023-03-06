import 'package:meta/meta.dart';
import 'package:must_be/src/constraints/common_constraint.dart';
import 'package:must_be/src/constraints/constraint.dart';
import 'package:must_be/src/constraints/constraint_exception.dart';
import 'package:must_be/src/constraints/date_constraint.dart';
import 'package:must_be/src/constraints/string_constraint.dart';

part 'extensions/date_time_extension.dart';
part 'extensions/list_extension.dart';
part 'extensions/number_extension.dart';
part 'extensions/object_extension.dart';
part 'extensions/string_extension.dart';

/// Class to create a requirement of how a [value] must be [mustBe].
@sealed
@immutable
class Require<T> {
  const Require._(this.value, [this.name]);

  /// The value that should follow the requirement of how must be.
  final T value;

  /// Name of value, it is passed to [ConstraintException]
  /// as an invalid argument name.
  final String? name;

  /// How value must be, if [isValid] is `true` then the value
  /// not violation none constraint, otherwise,
  /// the [constraint] will be throwing with the [ConstraintException],
  /// with the [value] and  the [name].
  ///
  // ignore: avoid_positional_boolean_parameters
  void mustBe(bool isValid, [Constraint? constraint]) {
    if (!isValid) {
      throw ConstraintException(constraint ?? const Invalid(), name, value);
    }
  }

  void _mustBeGreaterThan<V extends num>(V? value, V max, [String? message]) =>
      mustBe(value == null || value > max, GreaterThan(max, message));

  void _mustBeGreaterThanOrEqualTo<V extends num>(
    V? value,
    V max, [
    String? message,
  ]) =>
      mustBe(
        value == null || value >= max,
        GreaterThanOrEqualTo<V>(max, message),
      );

  void _mustBeLessThan<V extends num>(V? value, V min, [String? message]) =>
      mustBe(value == null || value < min, LessThan<V>(min, message));

  void _mustBeLessThanOrEqualTo<V extends num>(
    V? value,
    V min, [
    String? message,
  ]) =>
      mustBe(value == null || value <= min, LessThanOrEqualTo<V>(min, message));

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Require<T> && other.value == value && other.name == name;
  }

  @override
  int get hashCode => value.hashCode ^ name.hashCode;
}

/// Descriptive way to create a [Require].
Require<T> requireThat<T>(T value, {String? name}) => Require._(value, name);
