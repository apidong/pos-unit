import 'package:formz/formz.dart';

enum PasswordBaruValidationError { empty, length }

class PasswordBaru extends FormzInput<String, PasswordBaruValidationError> {
  const PasswordBaru.pure() : super.pure('');
  const PasswordBaru.dirty([String value = '']) : super.dirty(value);

  @override
  PasswordBaruValidationError? validator(String? value) {
    if (value!.length < 8) {
      return PasswordBaruValidationError.length;
    }
    return value.isNotEmpty == true ? null : PasswordBaruValidationError.empty;
  }
}
