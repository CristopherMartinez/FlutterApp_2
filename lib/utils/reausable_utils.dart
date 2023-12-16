String? validateEmail(String? email) {
  RegExp emailRegex = RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$');
  final isEmailValid = emailRegex.hasMatch(email ?? '');
  if (!isEmailValid) {
    return 'Ingresa un email valido';
  }
  return null;
}

//ValidatePassword
String? validatePassword(String? value) {
  RegExp regex =
      RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
  if (value!.isEmpty) {
    return 'Escribe un password';
  } else {
    if (!regex.hasMatch(value)) {
      return 'Debe contener al menos una letra Mayuscula\nDebe contener al menos una letra minúscula\nDebe contener al menos un número\nDebe contener al menos 1 caracter especial\nDebe tener al menos 8 caracteres\nEscribe un password valido';
    } else {
      return null;
    }
  }
}
