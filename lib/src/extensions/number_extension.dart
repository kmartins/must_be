part of 'package:must_be/src/require.dart';

/// Extension for the validation of the [int] type.
/// if the [value] is null, then an exception never will throw.
extension RequireInt<T extends int> on Require<T?> {
  /// Verifies if the number is greater than [min].
  void mustBeGreaterThan(T min, [String? message]) =>
      _mustBeGreaterThan(value, min, message);

  /// Verifies if the number is greater or equal to [min].
  void mustBeGreaterThanOrEqualTo(T min, [String? message]) =>
      _mustBeGreaterThanOrEqualTo(value, min, message);

  /// Verifies if the number is less than [max].
  void mustBeLessThan(T max, [String? message]) =>
      _mustBeLessThan(value, max, message);

  /// Verifies if the number is less or equal to [max].
  void mustBeLessThanOrEqualTo(T max, [String? message]) =>
      _mustBeLessThanOrEqualTo(value, max, message);
}

/// Extension for the validation of the [double] type.
/// if the [value] is null, then an exception never will throw.
extension RequireDouble<T extends double> on Require<T?> {
  /// Verifies if the number is greater than [min].
  void mustBeGreaterThan(T min, [String? message]) =>
      _mustBeGreaterThan(value, min, message);

  /// Verifies if the number is greater or equal to [min].
  void mustBeGreaterThanOrEqualTo(T min, [String? message]) =>
      _mustBeGreaterThanOrEqualTo(value, min, message);

  /// Verifies if the number is less than [max].
  void mustBeLessThan(T max, [String? message]) =>
      _mustBeLessThan(value, max, message);

  /// Verifies if the number is less or equal to [max].
  void mustBeLessThanOrEqualTo(T max, [String? message]) =>
      _mustBeLessThanOrEqualTo(value, max, message);
}

/// Extension for the validation of the [num] type.
/// if the [value] is null, then an exception never will throw.
extension RequireNumber<T extends num> on Require<T?> {
  /// Verifies if the number is greater than [min].
  void mustBeGreaterThan(T min, [String? message]) =>
      _mustBeGreaterThan(value, min, message);

  /// Verifies if the number is greater or equal to [min].
  void mustBeGreaterThanOrEqualTo(T min, [String? message]) =>
      _mustBeGreaterThanOrEqualTo(value, min, message);

  /// Verifies if the number is less than [max].
  void mustBeLessThan(T max, [String? message]) =>
      _mustBeLessThan(value, max, message);

  /// Verifies if the number is less or equal to [max].
  void mustBeLessThanOrEqualTo(T max, [String? message]) =>
      _mustBeLessThanOrEqualTo(value, max, message);
}
