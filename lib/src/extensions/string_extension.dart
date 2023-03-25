part of 'package:must_be/src/require.dart';

final RegExp _emailRegex = RegExp(
  r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$',
);

final RegExp _numberRegex = RegExp(r'^-?[0-9]+$');

/// Extension for the validation of the [String] type.
/// If the [value] is null, then an exception never will throw.
extension RequireString<T extends String> on Require<T?> {
  /// Verifies if the [String] is empty.
  void mustBeEmpty([String? message]) =>
      mustBe(value?.isEmpty ?? true, Empty(message));

  /// Verifies if the [String] is not empty.
  void mustBeNotEmpty([String? message]) =>
      mustBe(value?.isNotEmpty ?? true, NotEmpty(message));

  /// Verifies if the [String] is blank.
  void mustBeBlank([String? message]) =>
      mustBe(value?.trimLeft().isEmpty ?? true, Blank(message));

  /// Verifies if the [String] is not empty.
  void mustBeNotBlank([String? message]) =>
      mustBe(value?.trimLeft().isNotEmpty ?? true, NotBlank(message));

  /// Verifies if the [String] length is greater than [maxLength].
  void mustBeGreaterThan(int maxLength, [String? message]) =>
      _mustBeGreaterThan(value?.length, maxLength, message);

  /// Verifies if the [String] length is greater or equal to [maxLength].
  void mustBeGreaterThanOrEqualTo(int maxLength, [String? message]) =>
      _mustBeGreaterThanOrEqualTo(value?.length, maxLength, message);

  /// Verifies if the [String] length is less than [minLength].
  void mustBeLessThan(int minLength, [String? message]) =>
      _mustBeLessThan(value?.length, minLength, message);

  /// Verifies if the [String] length is less or equal to [minLength].
  void mustBeLessThanOrEqualTo(int minLength, [String? message]) =>
      _mustBeLessThanOrEqualTo(value?.length, minLength, message);

  /// Verifies if the [String] is equal a [compare] ignoring case sensitive.
  void mustBeEqualToIgnoringCase(String compare, [String? message]) => mustBe(
        value == null || value!.toLowerCase() == compare.toLowerCase(),
        Equal(compare, message ?? 'Must be equal to $compare ignoring case'),
      );

  /// Verifies if the [String] is not equal a [compare] ignoring case sensitive.
  void mustBeNotEqualToIgnoringCase(String compare, [String? message]) =>
      mustBe(
        value == null || value!.toLowerCase() != compare.toLowerCase(),
        NotEqual(
          compare,
          message ?? 'Must be not equal to $compare ignoring case',
        ),
      );

  /// Verifies if the [String] has match a [regex].
  void mustBeRegexMatch(RegExp regex, [String? message]) =>
      _mustMatch(regex, Match(regex, message));

  /// Verifies if the [String] is an email.
  void mustBeEmail([String? message]) =>
      _mustMatch(_emailRegex, Email(message));

  /// Verifies if the [String] has only numbers.
  void mustBeOnlyNumbers([String? message]) =>
      _mustMatch(_numberRegex, OnlyNumbers(message));

  void _mustMatch(RegExp regex, Constraint constraint) =>
      mustBe(value == null || regex.hasMatch(value!), constraint);

  /// Verifies if the [String] starts with [start].
  void mustBeStartedWith(String start, [String? message]) => mustBe(
        value?.startsWith(start) ?? true,
        StartedWith(start, message),
      );

  /// Verifies if the [String] ends with [end].
  void mustBeEndedWith(String end, [String? message]) => mustBe(
        value?.endsWith(end) ?? true,
        EndedWith(end, message),
      );
}
