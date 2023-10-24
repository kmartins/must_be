part of 'package:must_be/src/require.dart';

final RegExp _emailRegex = RegExp(
  r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$',
);

// https://github.com/agungnursatria/regexpattern
// https://github.com/dartoos-dev/formdator
final _urlRegex = RegExp(
  r"^((((H|h)(T|t)|(F|f))(T|t)(P|p)((S|s)?))\://)?(www.|[a-zA-Z0-9].)[a-zA-Z0-9\-\.]+\.[a-zA-Z]{2,6}(\:[0-9]{1,5})*(/($|[a-zA-Z0-9\.\,\;\?\'\\\+&amp;%\$#\=~_\-@]+))*$",
);

final _onlyNumbers = RegExp('[^0-9]+');

final _zipCode = RegExp(r'[0-9]{2}\.?[0-9]{3}-?[0-9]{3}', caseSensitive: false);

final _creditCard = RegExp(
  r'^(?:4[0-9]{12}(?:[0-9]{3})?|5[1-5][0-9]{14}|6(?:011|5[0-9][0-9])[0-9]{12}|3[47][0-9]{13}|3(?:0[0-5]|[68][0-9])[0-9]{11}|(?:2131|1800|35\d{3})\d{11})$',
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

  /// Verifies if the [String] is an email.
  void mustBeUrl([String? message]) => _mustMatch(_urlRegex, Url(message));

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

  /// Verifies if the [String] is a valid credit card.
  void mustBeCreditCard([String? message]) {
    final valueSanitized = value?.replaceAll(_onlyNumbers, '');
    mustBe(
      valueSanitized == null || _creditCard.hasMatch(valueSanitized),
      CreditCard(message),
    );
  }

  /// Verifies if the [String] is a valid zip code.
  void mustBeZipCode([String? message]) {
    final length = value?.trim().length ?? 0;
    mustBe(
      length >= 8 && length <= 10 && _zipCode.hasMatch(value ?? ''),
      ZipCode(message),
    );
  }
}
