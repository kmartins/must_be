//Credits: CPF/CNPJ Validators
//https://github.com/leonardocaldas/flutter-cpf-cnpj-validator

/// Class for validating Brazilian CNPJ.
class CnpjValidator {
  const CnpjValidator._();
  static const List<String> _blockList = [
    '00000000000000',
    '11111111111111',
    '22222222222222',
    '33333333333333',
    '44444444444444',
    '55555555555555',
    '66666666666666',
    '77777777777777',
    '88888888888888',
    '99999999999999',
  ];

  static const _stipRegex = r'[^\d]';

  // Compute the Verifier Digit (or 'Dígito Verificador (DV)' in PT-BR).
  // You can learn more about the algorithm on [wikipedia (pt-br)](https://pt.wikipedia.org/wiki/D%C3%ADgito_verificador)
  static int _verifierDigit(String cnpj) {
    var index = 2;

    final reverse = cnpj.split('').map(int.parse).toList().reversed.toList();

    var sum = 0;

    for (final number in reverse) {
      sum += number * index;
      index = (index == 9 ? 2 : index + 1);
    }

    final mod = sum % 11;

    return (mod < 2 ? 0 : 11 - mod);
  }

  static String _strip(String? cnpj) {
    final regex = RegExp(_stipRegex);

    return cnpj?.replaceAll(regex, '') ?? '';
  }

  /// Validates a Brazilian CNPJ.
  ///
  /// Returns `true` if the cnpj is valid, otherwise `false`.
  static bool validate(String? cnpj, {bool stripBeforeValidation = true}) {
    var newCnpj = cnpj;
    if (stripBeforeValidation) {
      newCnpj = _strip(newCnpj);
    }

    // cnpj must be defined
    if (newCnpj == null || newCnpj.isEmpty) {
      return false;
    }

    // cnpj must have 14 chars
    if (newCnpj.length != 14) {
      return false;
    }

    // cnpj can't be blacklisted
    if (_blockList.contains(cnpj)) {
      return false;
    }

    var numbers = newCnpj.substring(0, 12);
    numbers += _verifierDigit(numbers).toString();
    numbers += _verifierDigit(numbers).toString();

    return numbers.substring(numbers.length - 2) ==
        newCnpj.substring(newCnpj.length - 2);
  }
}
