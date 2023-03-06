part of 'package:must_be/src/require.dart';

/// Extension for the validation of the [DateTime] type.
/// if the [value] is null, then an exception never will throw.
extension RequireDate<T extends DateTime> on Require<T?> {
  static DateTime? _mockDateTime;

  DateTime get _currentDateTime => _mockDateTime ?? DateTime.now();

  @visibleForTesting
  static set mockCurrentDateTime(DateTime dateTime) => _mockDateTime = dateTime;

  String _formattedDate(DateTime dateTime) =>
      '${dateTime.year}-${dateTime.month.toString().padLeft(2, '0')}'
      '-${dateTime.day.toString().padLeft(2, '0')}';

  DateTime _convertedDate(DateTime dateTime) =>
      DateTime(dateTime.year, dateTime.month, dateTime.day);

  bool _sameDay(DateTime dateTime) =>
      (value?.year ?? dateTime.year) == dateTime.year &&
      (value?.month ?? dateTime.month) == dateTime.month &&
      (value?.day ?? dateTime.day) == dateTime.day;

  /// Verifies if [DateTime] is greater than other [minDate].
  void mustBeGreaterThan(DateTime minDate, [String? message]) {
    late final date = _convertedDate(minDate);
    mustBe(
      value == null || _convertedDate(value!).isAfter(date),
      GreaterThan<DateTime>(
        date,
        message ?? 'Must be greater than ${_formattedDate(minDate)}',
      ),
    );
  }

  /// Verifies if [DateTime] is greater than today [DateTime.now].
  void mustBeGreaterThanToday([String? message]) =>
      mustBeGreaterThan(_currentDateTime, message);

  /// Verifies if [DateTime] is greater or equal to other [minDate].
  void mustBeGreaterThanOrEqualTo(DateTime minDate, [String? message]) {
    late final date = _convertedDate(minDate);
    mustBe(
      value == null || _convertedDate(value!).isAfter(date) || _sameDay(date),
      GreaterThanOrEqualTo<DateTime>(
        minDate,
        message ??
            'Must be greater than or equal to ${_formattedDate(minDate)}',
      ),
    );
  }

  /// Verifies if [DateTime] is greater or equal to today [DateTime.now].
  void mustBeGreaterThanOrEqualToToday([String? message]) =>
      mustBeGreaterThanOrEqualTo(_currentDateTime, message);

  /// Verifies if [DateTime] is less than other [maxDate].
  void mustBeLessThan(DateTime maxDate, [String? message]) {
    late final date = _convertedDate(maxDate);
    mustBe(
      value == null || _convertedDate(value!).isBefore(date),
      LessThan<DateTime>(
        maxDate,
        message ?? 'Must be less than ${_formattedDate(maxDate)}',
      ),
    );
  }

  /// Verifies if [DateTime] is less than today [DateTime.now].
  void mustBeLessThanToday([String? message]) =>
      mustBeLessThan(_currentDateTime, message);

  /// Verifies if [DateTime] is less or equal to other [maxDate].
  void mustBeLessThanOrEqualTo(DateTime maxDate, [String? message]) {
    late final date = _convertedDate(maxDate);
    mustBe(
      value == null || _convertedDate(value!).isBefore(date) || _sameDay(date),
      LessThanOrEqualTo<DateTime>(
        maxDate,
        message ?? 'Must be less than or equal to ${_formattedDate(maxDate)}',
      ),
    );
  }

  /// Verifies if [DateTime] is less or equal to other [DateTime].
  void mustBeLessThanOrEqualToToday([String? message]) =>
      mustBeLessThanOrEqualTo(_currentDateTime, message);

  /// Verifies if [DateTime] is the same day that [sameDay].
  void mustBeSameDay(DateTime sameDay, [String? message]) => mustBe(
        _sameDay(sameDay),
        SameDay(
          sameDay,
          message ?? 'Must be the same as the day, ${_formattedDate(sameDay)}',
        ),
      );

  /// Verifies if [DateTime] is the same that today [DateTime.now];
  void mustBeSameToday([String? message]) =>
      mustBeSameDay(_currentDateTime, message);

  /// Verifies if [DateTime] is not the same day that [sameDay].
  void mustBeNotSameDay(DateTime sameDay, [String? message]) => mustBe(
        value == null || !_sameDay(sameDay),
        NotSameDay(
          sameDay,
          message ??
              'Must be not the same as the day, ${_formattedDate(sameDay)}',
        ),
      );

  /// Verifies if [DateTime] is not the same that today [DateTime.now];
  void mustBeNotSameToday([String? message]) =>
      mustBeNotSameDay(_currentDateTime, message);
}
