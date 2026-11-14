String? validarNome(String? valor) {
  if (valor == null || valor.trim().isEmpty) {
    return 'Informe seu nome';
  }
  return null;
}

String? validarEmail(String? valor) {
  if (valor == null || valor.trim().isEmpty) {
    return 'Informe seu e-mail';
  }

  final regex = RegExp(r'^[^@\s]+@[^@\s]+\.(com\.br|com)$');

  if (!regex.hasMatch(valor.trim())) {
    return 'Informe um e-mail válido';
  }

  return null;
}

String? validarSenha(String? valor) {
  if (valor == null || valor.isEmpty) {
    return 'Informe sua senha';
  }

  if (valor.length < 6) {
    return 'A senha deve ter pelo menos 6 caracteres';
  }

  return null;
}
