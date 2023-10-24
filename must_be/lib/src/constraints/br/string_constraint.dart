import 'package:must_be/must_be.dart';

/// {@template blank}
/// Represents the constraint when a [String]
/// must be a valid brazilian CEP.
/// {@endtemplate}
final class Cep extends Constraint {
  /// {@macro blank}
  const Cep([String? message])
      : super(
          message ?? 'Must be a valid brazilian CEP',
        );
}

/// {@template blank}
/// Represents the constraint when a [String]
/// must be a valid brazilian CPF.
/// {@endtemplate}
final class Cpf extends Constraint {
  /// {@macro blank}
  const Cpf([String? message])
      : super(
          message ?? 'Must be a valid brazilian CPF',
        );
}

/// {@template blank}
/// Represents the constraint when a [String]
/// must be a valid brazilian CNPJ.
/// {@endtemplate}
final class Cnpj extends Constraint {
  /// {@macro blank}
  const Cnpj([String? message])
      : super(
          message ?? 'Must be a valid brazilian CNPJ',
        );
}

/// {@template blank}
/// Represents the constraint when a [String]
/// must be a valid brazilian RG.
/// {@endtemplate}
final class Rg extends Constraint {
  /// {@macro blank}
  const Rg([String? message])
      : super(
          message ?? 'Must be a valid brazilian Rg',
        );
}

/// {@template blank}
/// Represents the constraint when a [String]
/// must be a valid brazilian Pis Pasep.
/// {@endtemplate}
final class PisPasep extends Constraint {
  /// {@macro blank}
  const PisPasep([String? message])
      : super(
          message ?? 'Must be a valid brazilian Pis Pasep',
        );
}

/// {@template blank}
/// Represents the constraint when a [String]
/// must be a valid brazilian mobile landline phone number.
/// {@endtemplate}
final class BrLandlinePhoneNumber extends Constraint {
  /// {@macro blank}
  const BrLandlinePhoneNumber([String? message])
      : super(
          message ?? 'Must be a valid brazilian landline phone number',
        );
}

/// {@template blank}
/// Represents the constraint when a [String]
/// must be a valid brazilian mobile phone number.
/// {@endtemplate}
final class BrPhoneNumber extends Constraint {
  /// {@macro blank}
  const BrPhoneNumber([String? message])
      : super(
          message ?? 'Must be a valid brazilian phone number',
        );
}

/// {@template blank}
/// Represents the constraint when a [String]
/// must be a valid brazilian CNH.
/// {@endtemplate}
final class Cnh extends Constraint {
  /// {@macro blank}
  const Cnh([String? message])
      : super(
          message ?? 'Must be a valid brazilian CNH',
        );
}
