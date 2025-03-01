String? validateEmail(String? value) {
  if (value == null || value.isEmpty) {
    return 'Por favor, insira um e-mail.';
  }

  final emailRegex =
      RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
  if (!emailRegex.hasMatch(value)) {
    return 'Por favor, insira um e-mail válido.';
  }

  return null;
}

String? validatePassword(String? value) {
  if (value == null || value.isEmpty) {
    return 'Insira a senha.';
  }

  return null;
}
