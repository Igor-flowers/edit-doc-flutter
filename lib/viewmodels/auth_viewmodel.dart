import 'package:flutter/foundation.dart';

import '../models/usuario.dart';
import '../models/services/banco_local_service.dart';
import '../models/services/preferences_service.dart';

class AuthViewModel extends ChangeNotifier {
  bool carregando = false;
  bool salvando = false;

  String temaEscolhido = 'Claro';
  bool notificacoesAtivadas = true;

  Future<Usuario?> fazerLogin(String email, String senha) async {
    carregando = true;
    notifyListeners();

    try {
      return await BancoDadosLocal.autenticar(email, senha);
    } finally {
      carregando = false;
      notifyListeners();
    }
  }

  Future<String?> cadastrar({
    required String nome,
    required String email,
    required String senha,
  }) async {
    salvando = true;
    notifyListeners();

    try {
      final existe = await BancoDadosLocal.emailExiste(email);

      if (existe) {
        return 'Este e-mail já está cadastrado!';
      }

      final usuario = Usuario(nome: nome, email: email, senha: senha);

      await BancoDadosLocal.inserir(usuario);

      await PreferenciasLocais.salvar(
        tema: temaEscolhido,
        notificacoes: notificacoesAtivadas,
      );

      return null;
    } finally {
      salvando = false;
      notifyListeners();
    }
  }

  void alterarTema(String tema) {
    temaEscolhido = tema;
    notifyListeners();
  }

  void alterarNotificacoes(bool ativadas) {
    notificacoesAtivadas = ativadas;
    notifyListeners();
  }

  Future<Map<String, dynamic>> carregarPreferencias() {
    return PreferenciasLocais.carregar();
  }

  Future<List<Usuario>> consultarUsuarios() {
    return BancoDadosLocal.consultarTodos();
  }
}
