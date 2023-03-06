import 'package:must_be/must_be.dart';
import 'package:test/test.dart';

void main() {
  group('Require', () {
    test('create', () {
      expect(requireThat('value'), isA<Require<String>>());
    });

    test('same hasCode for the same values', () {
      expect(requireThat('value').hashCode, requireThat('value').hashCode);
      expect(requireThat(0).hashCode, requireThat(0).hashCode);
      expect(
        requireThat(0, name: 'value').hashCode,
        requireThat(0, name: 'value').hashCode,
      );
    });
    test('different hasCode for different values', () {
      expect(
        requireThat('value').hashCode,
        isNot(requireThat('value2').hashCode),
      );
      expect(requireThat(0).hashCode, isNot(requireThat(2).hashCode));
      expect(requireThat(0).hashCode, isNot(requireThat('value').hashCode));
      expect(
        requireThat(0).hashCode,
        isNot(requireThat(0, name: 'value1').hashCode),
      );
    });

    test('same hasCode for the same values', () {
      expect(requireThat('value'), requireThat('value'));
      expect(requireThat(0), requireThat(0));
      expect(requireThat(0, name: 'value'), requireThat(0, name: 'value'));
    });
    test('different hasCode for different values', () {
      expect(requireThat('value'), isNot(requireThat('value2')));
      expect(requireThat(0), isNot(requireThat(2)));
      expect(requireThat(0), isNot(requireThat('value')));
      expect(requireThat(0), isNot(requireThat(0, name: 'value1')));
    });

    group('must be', () {
      test('throws an exception when isValid is true', () {
        const value = 0;
        expect(
          () => requireThat(value).mustBe(value > 0),
          throwsConstraintException(),
        );
        expect(
          () => requireThat(value, name: 'value')
              .mustBe(value > 0, const GreaterThan(0)),
          throwsConstraintException<GreaterThan>(
            name: 'value',
            constraintMessage: 'Must be greater than 0',
          ),
        );
      });

      test('not throws a exception when isValid is false', () {
        const value = 0;
        expect(() => requireThat(value).mustBe(value == 0), returnsNormally);
      });
    });
  });
}
