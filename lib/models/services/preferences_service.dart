import 'package:flutter/material.dart';

class PreferenciasLocais {
  static final Map<String, dynamic> _dados = {
    'tema': 'Claro',
    'notificacoes': true,
  };

  static final ValueNotifier<ThemeMode> temaNotifier = ValueNotifier<ThemeMode>(
    ThemeMode.light,
  );

  static Future<void> salvar({
    required String tema,
    required bool notificacoes,
  }) async {
    await Future.delayed(const Duration(milliseconds: 100));

    _dados['tema'] = tema;
    _dados['notificacoes'] = notificacoes;

    temaNotifier.value = tema == 'Escuro' ? ThemeMode.dark : ThemeMode.light;
  }

  static Future<Map<String, dynamic>> carregar() async {
    await Future.delayed(const Duration(milliseconds: 100));

    return Map<String, dynamic>.from(_dados);
  }
}
