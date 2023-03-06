import 'package:must_be/must_be.dart';
import 'package:test/test.dart';

void main() {
  group('ValidationsLocation', () {
    test(
      'return default error message when if there no translate',
      () {
        final errorMessage = validate(
          () => requireThat(10).mustBeGreaterThan(10),
        );
        expect(errorMessage, 'Must be greater than 10');
      },
    );

    test(
      'override error message when if there translation',
      () {
        ValidationsLocalization.on<GreaterThan<int>>(
          (constraintError) => 'custom error - ${constraintError.name}',
        );
        final errorMessage = validate(
          () => requireThat(10, name: 'age').mustBeGreaterThan(10),
        );
        expect(errorMessage, 'custom error - age');
      },
    );
  });
}
