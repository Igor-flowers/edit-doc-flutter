import 'package:flutter/material.dart';

import 'models/services/preferences_service.dart';
import 'views/login_view.dart';
import 'views/cadastro_view.dart';
import 'views/home_view.dart';

void main() {
  runApp(const MeuApp());
}

class MeuApp extends StatelessWidget {
  const MeuApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
      valueListenable: PreferenciasLocais.temaNotifier,
      builder: (context, temaAtual, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Editor de Documentos',
          themeMode: temaAtual,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(
              seedColor: Colors.blue,
              brightness: Brightness.light,
            ),
            useMaterial3: true,
          ),
          darkTheme: ThemeData(
            colorScheme: ColorScheme.fromSeed(
              seedColor: Colors.blue,
              brightness: Brightness.dark,
            ),
            useMaterial3: true,
          ),
          initialRoute: '/',
          routes: {
            '/': (context) => const TelaLogin(),
            '/cadastro': (context) => const TelaCadastro(),
            '/home': (context) => const TelaHome(),
          },
        );
      },
    );
  }
}
