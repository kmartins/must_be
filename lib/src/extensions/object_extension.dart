part of 'package:must_be/src/require.dart';

/// Extension for the validation of the [Object] type.
/// if the [value] is null, then an exception never will throw.
extension RequireAll<T extends Object> on Require<T?> {
  /// Verifies if [Object] is equal to other object [compare].
  void mustBeEqualTo(T compare, [String? message]) =>
      mustBe(value == null || value == compare, Equal<T>(compare, message));

  /// Verifies if [Object] is not equal to other object [compare].
  void mustBeNotEqualTo(T compare, [String? message]) =>
      mustBe(value == null || value != compare, NotEqual<T>(compare, message));
}

/// Extension for the validation of the `null` type.
extension RequireNotNull<T extends Object?> on Require<T?> {
  /// Verifies if [Object] is not null.
  void mustBeNotNull([String? message]) =>
      mustBe(value != null, NotNull(message));

  /// Verifies if [Object] is null.
  void mustBeNull([String? message]) => mustBe(value == null, Null(message));
}
