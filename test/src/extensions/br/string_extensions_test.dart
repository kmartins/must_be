import 'package:must_be/must_be.dart';
import 'package:must_be/src/constraints/br/string_constraint.dart';
import 'package:test/test.dart';

void main() {
  group('cep', () {
    test(
        'if the value is null, '
        'then an exception will not be thrown', () {
      String? value;
      expect(
        () => requireThat(value).mustBeCep(),
        returnsNormally,
      );
    });

    test(
        'if the String is a valid brazilian CEP, '
        'then an exception will not be thrown', () {
      expect(
        () => requireThat('65092-276').mustBeCep(),
        returnsNormally,
      );
      expect(
        () => requireThat('65092276').mustBeCep(),
        returnsNormally,
      );
      expect(
        () => requireThat('65.092-276').mustBeCep(),
        returnsNormally,
      );
    });

    test(
        'if the String is not a valid brazilian CEP, '
        'then an exception is thrown', () {
      expect(
        () => requireThat('650.922.76').mustBeCep(),
        throwsConstraintException<Cep>(),
      );
      expect(
        () => requireThat('650.922').mustBeCep(),
        throwsConstraintException<Cep>(),
      );
      expect(
        () => requireThat('65').mustBeCep(),
        throwsConstraintException<Cep>(),
      );
      expect(
        () => requireThat('6ç.321-321').mustBeCep(),
        throwsConstraintException<Cep>(),
      );
      expect(
        () => requireThat('62.6321-3261').mustBeCep(),
        throwsConstraintException<Cep>(),
      );
      expect(
        () => requireThat('1234567').mustBeCep(),
        throwsConstraintException<Cep>(),
      );
      expect(
        () => requireThat('12345678910').mustBeCep(),
        throwsConstraintException<Cep>(),
      );
    });

    test(
        'if the String is not a valid brazilian CEP, '
        'then an exception is thrown - Custom Message', () {
      expect(
        () => requireThat('12345678910').mustBeCep('not cep'),
        throwsConstraintException<Cep>(
          constraintMessage: 'not cep',
        ),
      );
    });

    group('RG', () {
      test(
          'if the value is null, '
          'then an exception will not be thrown', () {
        String? value;
        expect(
          () => requireThat(value).mustBeRg(),
          returnsNormally,
        );
      });

      test(
          'if the String is valid, '
          'then an exception will not be thrown', () {
        expect(
          () => requireThat('222733822').mustBeRg(),
          returnsNormally,
        );
        expect(
          () => requireThat('29.385.462-2').mustBeRg(),
          returnsNormally,
        );
        expect(
          () => requireThat('65092276').mustBeRg(),
          returnsNormally,
        );
      });

      test(
          'if the String is not valid '
          'then an exception is thrown', () {
        expect(
          () => requireThat('992.864.791-742').mustBeRg(),
          throwsConstraintException<Rg>(),
        );
        expect(
          () => requireThat('1111').mustBeRg(),
          throwsConstraintException<Rg>(),
        );
        expect(
          () => requireThat('aaaaa').mustBeRg(),
          throwsConstraintException<Rg>(),
        );
      });

      test(
          'if the String is not valid, '
          'then an exception is thrown - Custom Message', () {
        expect(
          () => requireThat('aaaaa0').mustBeRg('not rg'),
          throwsConstraintException<Rg>(
            constraintMessage: 'not rg',
          ),
        );
      });
    });

    group('CPF', () {
      test(
          'if the value is null, '
          'then an exception will not be thrown', () {
        String? value;
        expect(
          () => requireThat(value).mustBeCpf(),
          returnsNormally,
        );
      });

      test(
          'if the String is valid, '
          'then an exception will not be thrown', () {
        expect(
          () => requireThat('99286479174').mustBeCpf(),
          returnsNormally,
        );
        expect(
          () => requireThat('992.864.791-74').mustBeCpf(),
          returnsNormally,
        );
      });

      test(
          'if the String is not valid, '
          'then an exception is thrown', () {
        expect(
          () => requireThat('222733822').mustBeCpf(),
          throwsConstraintException<Cpf>(),
        );
        expect(
          () => requireThat('29.385.462-2').mustBeCpf(),
          throwsConstraintException<Cpf>(),
        );
        expect(
          () => requireThat('65092276').mustBeCpf(),
          throwsConstraintException<Cpf>(),
        );
        expect(
          () => requireThat('1111').mustBeCpf(),
          throwsConstraintException<Cpf>(),
        );
        expect(
          () => requireThat('aaaa').mustBeCpf(),
          throwsConstraintException<Cpf>(),
        );
      });

      test(
          'if the String is not valid, '
          'then an exception is thrown - Custom Message', () {
        expect(
          () => requireThat('12345678910').mustBeCpf('not cpf'),
          throwsConstraintException<Cpf>(
            constraintMessage: 'not cpf',
          ),
        );
      });
    });

    group('CNPJ', () {
      test(
          'if the value is null, '
          'then an exception will not be thrown', () {
        String? value;
        expect(
          () => requireThat(value).mustBeCnpj(),
          returnsNormally,
        );
      });

      test(
          'if the String is valid, '
          'then an exception will not be thrown', () {
        expect(
          () => requireThat('69.404.688/0001-71').mustBeCnpj(),
          returnsNormally,
        );
        expect(
          () => requireThat('95385916000113').mustBeCnpj(),
          returnsNormally,
        );
      });

      test(
          'if the String is not valid, '
          'then an exception is thrown', () {
        expect(
          () => requireThat('12345678000191').mustBeCnpj(),
          throwsConstraintException<Cnpj>(),
        );
        expect(
          () => requireThat('12.345.678/0001-91').mustBeCnpj(),
          throwsConstraintException<Cnpj>(),
        );
        expect(
          () => requireThat('123').mustBeCnpj(),
          throwsConstraintException<Cnpj>(),
        );
      });

      test(
          'if the String is not valid, '
          'then an exception is thrown - Custom Message', () {
        expect(
          () => requireThat('12345678910').mustBeCnpj('not cnpj'),
          throwsConstraintException<Cnpj>(
            constraintMessage: 'not cnpj',
          ),
        );
      });
    });

    group('Pis Pasep', () {
      test(
          'if the value is null, '
          'then an exception will not be thrown', () {
        String? value;
        expect(
          () => requireThat(value).mustBePisPasep(),
          returnsNormally,
        );
      });

      test(
          'if the String is valid, '
          'then an exception will not be thrown', () {
        expect(
          () => requireThat('081.43434.08-5').mustBePisPasep(),
          returnsNormally,
        );
        expect(
          () => requireThat('51757815531').mustBePisPasep(),
          returnsNormally,
        );
      });

      test(
          'if the String is not valid, '
          'then an exception is thrown', () {
        expect(
          () => requireThat('12345678901').mustBePisPasep(),
          throwsConstraintException<PisPasep>(),
        );
        expect(
          () => requireThat('123.456.789-01').mustBePisPasep(),
          throwsConstraintException<PisPasep>(),
        );
        expect(
          () => requireThat('123').mustBePisPasep(),
          throwsConstraintException<PisPasep>(),
        );
      });

      test(
          'if the String is not valid, '
          'then an exception is thrown - Custom Message', () {
        expect(
          () => requireThat('12345678910').mustBePisPasep('not pis pasep'),
          throwsConstraintException<PisPasep>(
            constraintMessage: 'not pis pasep',
          ),
        );
      });
    });

    group('Phone', () {
      test(
          'if the value is null, '
          'then an exception will not be thrown', () {
        String? value;
        expect(
          () => requireThat(value).mustBeBrPhoneNumber(),
          returnsNormally,
        );
      });

      test(
          'if the String is valid, '
          'then an exception will not be thrown', () {
        expect(
          () => requireThat('999999999').mustBeBrPhoneNumber(),
          returnsNormally,
        );
        expect(
          () => requireThat('99999-9999').mustBeBrPhoneNumber(),
          returnsNormally,
        );
      });

      test(
          'if the String is not valid, '
          'then an exception is thrown', () {
        expect(
          () => requireThat(' 99999999').mustBeBrPhoneNumber(),
          throwsConstraintException<BrPhoneNumber>(),
        );
        expect(
          () => requireThat('9999999999').mustBeBrPhoneNumber(),
          throwsConstraintException<BrPhoneNumber>(),
        );
        expect(
          () => requireThat('99999-99999').mustBeBrPhoneNumber(),
          throwsConstraintException<BrPhoneNumber>(),
        );
        expect(
          () => requireThat('99999-999').mustBeBrPhoneNumber(),
          throwsConstraintException<BrPhoneNumber>(),
        );
        expect(
          () => requireThat('99999-99A9').mustBeBrPhoneNumber(),
          throwsConstraintException<BrPhoneNumber>(),
        );
        expect(
          () => requireThat('99999-99A9').mustBeBrPhoneNumber(),
          throwsConstraintException<BrPhoneNumber>(),
        );
      });

      test(
          'if the String is not valid, '
          'then an exception is thrown - Custom Message', () {
        expect(
          () =>
              requireThat('99999-99A9').mustBeBrPhoneNumber('not phone number'),
          throwsConstraintException<BrPhoneNumber>(
            constraintMessage: 'not phone number',
          ),
        );
      });
    });

    group('Landline Phone', () {
      test(
          'if the value is null, '
          'then an exception will not be thrown', () {
        String? value;
        expect(
          () => requireThat(value).mustBeBrLandlinePhoneNumber(),
          returnsNormally,
        );
      });

      test(
          'if the String is valid, '
          'then an exception will not be thrown', () {
        expect(
          () => requireThat('3333-3333').mustBeBrLandlinePhoneNumber(),
          returnsNormally,
        );
        expect(
          () => requireThat('33333333').mustBeBrLandlinePhoneNumber(),
          returnsNormally,
        );
      });

      test(
          'if the String is not valid, '
          'then an exception is thrown', () {
        expect(
          () => requireThat('3333-3A33').mustBeBrLandlinePhoneNumber(),
          throwsConstraintException<BrLandlinePhoneNumber>(),
        );
        expect(
          () => requireThat('123').mustBeBrLandlinePhoneNumber(),
          throwsConstraintException<BrLandlinePhoneNumber>(),
        );
        expect(
          () => requireThat('123456789').mustBeBrLandlinePhoneNumber(),
          throwsConstraintException<BrLandlinePhoneNumber>(),
        );
        expect(
          () => requireThat('1234567A').mustBeBrLandlinePhoneNumber(),
          throwsConstraintException<BrLandlinePhoneNumber>(),
        );
      });

      test(
          'if the String is not valid, '
          'then an exception is thrown - Custom Message', () {
        expect(
          () => requireThat('1234567A')
              .mustBeBrLandlinePhoneNumber('not landline phone number'),
          throwsConstraintException<BrLandlinePhoneNumber>(
            constraintMessage: 'not landline phone number',
          ),
        );
      });
    });
  });
}
