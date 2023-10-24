//Credits: CPF/CNPJ Validators
//https://github.com/leonardocaldas/flutter-cpf-cnpj-validator

/// Class for validating Brazilian CPF.
class CpfValidator {
  const CpfValidator._();

  static const List<String> _blockList = [
    '00000000000',
    '11111111111',
    '22222222222',
    '33333333333',
    '44444444444',
    '55555555555',
    '66666666666',
    '77777777777',
    '88888888888',
    '99999999999',
    '12345678909',
  ];

  static const _stipRegex = r'[^\d]';

  // Compute the Verifier Digit (or 'Dígito Verificador (DV)' in PT-BR).
  // You can learn more about the algorithm on [wikipedia (pt-br)](https://pt.wikipedia.org/wiki/D%C3%ADgito_verificador)
  static int _verifierDigit(String cpf) {
    final numbers =
        cpf.split('').map((number) => int.parse(number, radix: 10)).toList();

    final modulus = numbers.length + 1;

    final multiplied = <int>[];

    for (var i = 0; i < numbers.length; i++) {
      multiplied.add(numbers[i] * (modulus - i));
    }

    final mod = multiplied.reduce((buffer, number) => buffer + number) % 11;

    return (mod < 2 ? 0 : 11 - mod);
  }

  static String _strip(String? cpf) {
    final regExp = RegExp(_stipRegex);

    return cpf?.replaceAll(regExp, '') ?? '';
  }

  /// Validates a Brazilian CPF.
  ///
  /// Returns `true` if the cpf is valid, otherwise `false`.
  static bool validate(String? cpf, {bool stripBeforeValidation = true}) {
    var newCpf = cpf;
    if (stripBeforeValidation) {
      newCpf = _strip(newCpf);
    }

    // CPF must be defined
    if (newCpf == null || newCpf.isEmpty) {
      return false;
    }

    // CPF must have 11 chars
    if (newCpf.length != 11) {
      return false;
    }

    // CPF can't be blacklisted
    if (_blockList.contains(cpf)) {
      return false;
    }

    var numbers = newCpf.substring(0, 9);
    numbers += _verifierDigit(numbers).toString();
    numbers += _verifierDigit(numbers).toString();

    return numbers.substring(numbers.length - 2) ==
        newCpf.substring(newCpf.length - 2);
  }
}
