import 'package:must_be/src/constraints/constraint.dart';
import 'package:test/test.dart';

void main() {
  group('Constraint', () {
    test('toString returns the message when it is not null', () {
      const constraint = Invalid('invalid value');
      expect(constraint.toString(), 'invalid value');
    });

    test(
        'toString returns the default message with '
        'constraint type when the message is null', () {
      const constraint = Invalid();
      expect(constraint.toString(), 'Constraint violation: Invalid');
    });
  });
}
