import '../usuario.dart';

class BancoDadosLocal {
  static final List<Usuario> _tabelaUsuarios = [];

  static Future<void> inserir(Usuario usuario) async {
    await Future.delayed(const Duration(milliseconds: 100));
    _tabelaUsuarios.add(usuario);
  }

  static Future<bool> emailExiste(String email) async {
    await Future.delayed(const Duration(milliseconds: 100));

    return _tabelaUsuarios.any(
      (usuario) =>
          usuario.email.trim().toLowerCase() == email.trim().toLowerCase(),
    );
  }

  static Future<Usuario?> autenticar(String email, String senha) async {
    await Future.delayed(const Duration(milliseconds: 100));

    for (final usuario in _tabelaUsuarios) {
      if (usuario.email.trim().toLowerCase() == email.trim().toLowerCase() &&
          usuario.senha == senha) {
        return usuario;
      }
    }

    return null;
  }

  static Future<List<Usuario>> consultarTodos() async {
    await Future.delayed(const Duration(milliseconds: 100));
    return List.unmodifiable(_tabelaUsuarios);
  }
}
