# Must be

[![pub][pub_badge]][pub_link]
[![License: MIT][license_badge]][license_link]
[![must_be][ci_badge]][ci_link]

Yes, you are not wrong, this is another validation package.

However more much idiomatic, for example, validate value using cascade syntax.

It's similar to a framework that checks values in tests.

```dart
requireThat('value')..mustBeGreaterThan(6)..mustBeLessThanOrEqualTo(10)
```
## Set constraints in your data

Validation of a value.

```dart
requireThat('teste@gmail.com').mustBeEmail()
```

You can set what is the validation field name.

```dart
requireThat('teste@gmail.com', name: 'email').mustBeEmail()
```

But, what happens when the date violates the restriction?
An `exception` is thrown with the violate constraint with a message containing the data and field name if have.

```dart
requireThat('teste@gmail.com').mustBeEmail('error')
```

### But if I want to define more constraints?

That **Dart side** is with us, so let's use the [cascade operator syntax][cascate_dart].

```dart
requireThat('value')..mustBeGreaterThan(6)..mustBeLessThanOrEqualTo(10)
```

That's amazing.

## Create your constraint

Here again Dart side will help us with the `extension methods`[extension_dart].

Firstly, create a `Constraint` subclass, e.g:

```dart
class SameDay extends Constraint {
  const SameDay(this.date, [String? message]) : super(message);

  final DateTime date;
}
```

Now, create an extension of the `Require` with the generic of the data type that to want to validate, call the method how you want, (the pattern is `mustBe...`), and `inside it calls the `mustBe` method.

```dart
extension RequireString<T extends String> on Require<T?> {
 /// Verifies if the [String] is blank.
  void mustBeBlank([String? message]) =>
      mustBe(value?.trimLeft().isEmpty ?? true, Blank(message));
}
```

In `Require` you can access the value and the field name(value and name).

## How validate?

When a restriction is violated an `exception` is thrown, then there is a support function that captures this and returns its message, if there is no violation then returns `null`.

```dart
validate(
    () => requireThat(10).mustBeGreaterThan(10),
    ifNotValid: (_) => 'error',
) // print -> 'error'
```

You can also do whatever you want with each restriction that is violated.

```dart
validate(
    () => requireThat(10)..mustBeGreaterThan(10)..mustBeLessThan(100),
    ifNotValid: (constraint) => constraint.when({
        isType<LessThan>(): (_) => 'less',
        isType<GreaterThan>(): (_) => 'greater',
    }),
)
```

You can use `try/catch` too.

For the customize you message see below **Custom error message**.

It's perfect to use in the `TextFormFields` validation.

```dart
TextFormField(
    validator: (value) => validate(
        () => requireThat(value, name: 'nick')
            ..mustBeGreaterThanOrEqualTo(3)
            ..mustBeLessThan(10),
    ),
    decoration: const InputDecoration(
        labelText: 'Nickname',
        border: OutlineInputBorder(),
    ),
),
```

## Custom error message

If you want to change the **constraint** default message when calling the `validate` function, use the  `ValidationsLocalization`.

```dart
void main() {
    ValidationsLocalization.on<Email>((constraint) => 'custom message - ${constraintException.name}-${constraintException.value}');
}
```

This does not translate or change the **constraint exception message**, for this do:

```dart
requireThat('value').mustBeGreaterThan(5, 'custom message');
```

In the `validate` function there is `ifNotValid` function then pass the message do you want according to the **constraint violated**.

```dart
validate
    () => requireThat(10).mustBeGreaterThan(0),
    ifNotValid: (constraint) => constraint.when({
        isType<LessThan>(): (_) => 'less',
        isType<GreaterThan>(): (_) => 'greater',
    }),
)
```

## Tests

There is a new `matcher` for the throwing `ConstraintException`:

```dart
expect(
    () => requireThat(2, name: 'number').mustBeGreaterThan(2),
    throwsConstraintException<GreaterThan>(
        constraintMessage: 'Must be greater than 2',
        name: 'number',
        value: 2,
    ),
);
```

## 📝 Maintainers

[Kauê Martins][github_profile]

## 🤝 Support

Did you like this package? Then give it a ⭐️. If you want to help then:

- Fork this repository
- Send a Pull Request with new features
- Share this package
- Create issues if you find a bug or want to suggest a new extension

**Pull Request title follows [Conventional Commits][angular_convention]. </br>**

## 📝 License

Copyright © 2023 [Kauê Martins](https://github.com/kmartins).<br />
This project is [MIT](https://opensource.org/licenses/MIT) licensed.

[pub_badge]: https://pub.dev/must_be
[pub_link]: https://pub.dev/must_be
[ci_badge]: https://github.com/kmartins/must_be/actions/workflows/must_be.yaml/badge.svg
[ci_link]: https://github.com/kmartins/must_be/actions
[license_badge]: https://img.shields.io/badge/license-MIT-blue.svg
[license_link]: https://opensource.org/licenses/MIT
[cascate_dart]: https://dart.dev/guides/language/language-tour#cascade-notation
[extension_dart]: https://dart.dev/guides/language/extension-methods
[angular_convention]: https://github.com/angular/angular/blob/22b96b9/CONTRIBUTING.md#-commit-message-guidelines
[github_profile]: https://github.com/kmartins