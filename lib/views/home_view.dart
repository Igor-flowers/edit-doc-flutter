
import 'package:flutter/material.dart';

import '../models/usuario.dart';
import '../viewmodels/auth_viewmodel.dart';

class TelaHome extends StatefulWidget {
  const TelaHome({super.key});

  @override
  State<TelaHome> createState() => _TelaHomeState();
}

class _TelaHomeState extends State<TelaHome> {
  final AuthViewModel viewModel = AuthViewModel();

  Future<void> _mostrarPreferencias() async {
    final preferencias = await viewModel.carregarPreferencias();

    if (!mounted) return;

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Preferências'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Tema: ${preferencias['tema']}'),
              const SizedBox(height: 8),
              Text(
                'Notificações: ${preferencias['notificacoes'] ? 'Ativadas' : 'Desativadas'}',
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Fechar'),
            ),
          ],
        );
      },
    );
  }

  Future<void> _mostrarUsuariosBanco() async {
    final usuarios = await viewModel.consultarUsuarios();

    if (!mounted) return;

    showModalBottomSheet(
      context: context,
      builder: (context) {
        return SizedBox(
          height: 400,
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.all(16),
                child: Text(
                  'Usuários cadastrados',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Expanded(
                child: usuarios.isEmpty
                    ? const Center(
                        child: Text('Nenhum usuário cadastrado.'),
                      )
                    : ListView.builder(
                        itemCount: usuarios.length,
                        itemBuilder: (context, index) {
                          final Usuario usuario = usuarios[index];

                          return ListTile(
                            leading: const Icon(Icons.person),
                            title: Text(usuario.nome),
                            subtitle: Text(usuario.email),
                          );
                        },
                      ),
              ),
            ],
          ),
        );
      },
    );
  }

  void _sair() {
    Navigator.pushNamedAndRemoveUntil(
      context,
      '/',
      (route) => false,
    );
  }

  @override
  void dispose() {
    viewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final nome = ModalRoute.of(context)?.settings.arguments as String? ?? '';

    return Scaffold(
      appBar: AppBar(
        title: const Text('Início'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: _sair,
            icon: const Icon(Icons.logout),
            tooltip: 'Sair',
          ),
        ],
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 500),
            child: Column(
              children: [
                const Icon(
                  Icons.account_circle,
                  size: 90,
                ),
                const SizedBox(height: 16),
                Text(
                  'Bem-vindo, $nome!',
                  style: Theme.of(context).textTheme.headlineSmall,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 32),
                Card(
                  child: ListTile(
                    leading: const Icon(Icons.settings),
                    title: const Text('Preferências'),
                    subtitle: const Text('Consultar suas configurações'),
                    trailing: const Icon(Icons.arrow_forward_ios),
                    onTap: _mostrarPreferencias,
                  ),
                ),
                const SizedBox(height: 12),
                Card(
                  child: ListTile(
                    leading: const Icon(Icons.people),
                    title: const Text('Usuários cadastrados'),
                    subtitle: const Text('Consultar usuários do sistema'),
                    trailing: const Icon(Icons.arrow_forward_ios),
                    onTap: _mostrarUsuariosBanco,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: const Padding(
        padding: EdgeInsets.all(16),
        child: Text(
          'Desenvolvido por: Igor Flores',
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

