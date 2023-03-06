part of 'package:must_be/src/require.dart';

/// Extension for the validation of the [List] type.
/// if the [value] is null, then an exception never will throw.
extension RequireList<T extends List<Object?>> on Require<T?> {
  /// Verifies if the [List] is empty.
  void mustBeEmpty([String? message]) =>
      mustBe(value?.isEmpty ?? true, Empty(message));

  /// Verifies if the [List] is not empty.
  void mustBeNotEmpty([String? message]) =>
      mustBe(value?.isNotEmpty ?? true, NotEmpty(message));

  /// Verifies if the length [List] is greater than [minLength].
  void mustBeGreaterThan(int minLength, [String? message]) =>
      _mustBeGreaterThan(value?.length, minLength, message);

  /// Verifies if the length [List] is greater or equal to[minLength].
  void mustBeGreaterThanOrEqualTo(int minLength, [String? message]) =>
      _mustBeGreaterThanOrEqualTo(value?.length, minLength, message);

  /// Verifies if the length [List] is less than [maxLength].
  void mustBeLessThan(int maxLength, [String? message]) =>
      _mustBeLessThan(value?.length, maxLength, message);

  /// Verifies if the length [List] is less or equal to [maxLength].
  void mustBeLessThanOrEqualTo(int maxLength, [String? message]) =>
      _mustBeLessThanOrEqualTo(value?.length, maxLength, message);
}
