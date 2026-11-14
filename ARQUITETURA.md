
# Relatório de Migração para MVVM

## 1. Objetivo

O projeto foi reorganizado utilizando a arquitetura MVVM (Model-View-ViewModel), separando os dados, as regras de negócio e a interface do usuário.

## 2. Organização dos arquivos

### Models
- `models/usuario.dart`: representa os dados do usuário.
- `models/services/banco_local_service.dart`: realiza cadastro, autenticação e consulta de usuários.
- `models/services/preferences_service.dart`: gerencia as preferências de tema e notificações.

### ViewModels
- `viewmodels/auth_viewmodel.dart`: controla login, cadastro, carregamento e preferências.
- `viewmodels/documentos_viewmodel.dart`: estrutura inicial para o gerenciamento de documentos.

### Views
- `views/login_view.dart`: tela de login.
- `views/cadastro_view.dart`: tela de cadastro.
- `views/home_view.dart`: tela inicial e consulta de informações.

### Utils
- `utils/validadores.dart`: contém as funções de validação de nome, e-mail e senha.

### Arquivo principal
- `main.dart`: inicializa o aplicativo, configura os temas e define as rotas de navegação.

## 3. Mudanças na estrutura e nos imports

As classes foram separadas em arquivos específicos, organizados por responsabilidade.

Os imports foram atualizados para conectar Models, Services, ViewModels e Views conforme a nova estrutura.

## 4. Gerenciamento de estado

O gerenciamento de estado foi transferido para os ViewModels, que utilizam `ChangeNotifier` e `notifyListeners()`.

As Views utilizam `ListenableBuilder` para observar as alterações e atualizar a interface.

O controle de carregamento, autenticação, cadastro, tema e notificações passou a ser responsabilidade do `AuthViewModel`.

O uso de `setState()` para controlar esses estados foi removido das telas.

## 5. Testes realizados

Foram realizados testes manuais de:

- Abertura da tela de login.
- Navegação para a tela de cadastro.
- Cadastro de usuário.
- Autenticação do usuário.
- Exibição da tela inicial.
- Consulta das preferências.
- Consulta dos usuários cadastrados.

Também foi executado `flutter analyze`. O projeto apresentou zero erros, restando quatro avisos informativos relacionados à depreciação de propriedades do `RadioListTile`.

## 6. Considerações finais

A migração inicial para MVVM foi realizada, separando a interface, os dados e as responsabilidades de gerenciamento de estado.

O armazenamento dos usuários e das preferências ainda é temporário em memória. A persistência será desenvolvida na próxima etapa do projeto.
