// ignore_for_file: avoid_positional_boolean_parameters

part of 'package:must_be/src/require.dart';

final _cep = RegExp(r'[0-9]{2}\.?[0-9]{3}-?[0-9]{3}', caseSensitive: false);

final _rg = RegExp(r'(^\d{1,2}).?(\d{3}).?(\d{3})-?(\d{1}|X|x$)');

/// Extension for the validation of the [String] type.
extension RequireBrString<T extends String> on Require<T?> {
  /// Verifies if the [String] is a valid Brazilian CEP.
  void mustBeCep([String? message]) {
    final cep = value?.trim();
    final len = cep?.length ?? 0;
    mustBe(
      cep == null || len >= 8 && len <= 10 && _cep.hasMatch(cep),
      Cep(message),
    );
  }

  /// Verifies if the [String] is a valid Brazilian CPF.
  void mustBeCpf([String? message]) => mustBe(
        value == null || CpfValidator.validate(value),
        Cpf(message),
      );

  /// Verifies if the [String] is a valid Brazilian CNPJ.
  void mustBeCnpj([String? message]) => mustBe(
        value == null || CnpjValidator.validate(value),
        Cnpj(message),
      );

  /// Verifies if the [String] is a valid Brazilian Pis Pasep.
  void mustBePisPasep([String? message]) => mustBe(
        value == null || PisPasepValidator.validate(value),
        PisPasep(message),
      );

  /// Verifies if the [String] is a valid Brazilian phone number.
  void mustBeBrPhoneNumber([String? message]) => mustBe(
        value == null || PhoneNumberValidator.validate(value),
        BrPhoneNumber(message),
      );

  /// Verifies if the [String] is a valid Brazilian landline phone number.
  void mustBeBrLandlinePhoneNumber([String? message]) => mustBe(
        value == null || LandlinePhoneValidator.validate(value),
        BrLandlinePhoneNumber(message),
      );

  /// Verifies if the [String] is a valid Brazilian RG.
  void mustBeRg([String? message]) =>
      mustBe(value == null || _rg.hasMatch(value!), Rg(message));

  /// Verifies if the [String] is a valid Brazilian CNH.
  void mustBeCnh([String? message]) =>
      mustBe(value == null || CnhValidator.validate(value!), Cnh(message));
}
