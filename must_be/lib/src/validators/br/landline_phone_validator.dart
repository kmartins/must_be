/// Class for validating Brazilian landline phone numbers.
class LandlinePhoneValidator {
  const LandlinePhoneValidator._();

  /// Validates a Brazilian landline phone number.
  ///
  /// The landline phone number should be a string consisting of 8 digits.
  /// It may include non-digit characters, which will be removed before
  /// validation.
  ///
  /// Returns `true` if the landline phone number is valid, otherwise `false`.
  static bool validate(String? landlinePhone) {
    final phone = landlinePhone?.replaceAll(RegExp(r'[^\d]'), '') ?? '';

    if (phone.length != 8) {
      return false;
    }

    final firstDigit = int.parse(phone[0]);

    if (firstDigit < 2 || firstDigit > 5) {
      return false;
    }

    return true;
  }
}
