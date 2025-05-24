# 📱 App Escolar - Projeto Flutter

Este é um projeto desenvolvido para a disciplina de **Desenvolvimento Mobile**, com foco na criação de um aplicativo escolar utilizando o framework **Flutter**.

Cada integrante do grupo é responsável por uma tela específica. Este repositório contém principalmente a **Tela Inicial do Coordenador**.

## 🚀 Objetivo Geral

Desenvolver um aplicativo escolar com funcionalidades voltadas para diferentes perfis de usuários: **Alunos**, **Professores** e **Coordenadores**.

## 🧩 Telas do Aplicativo

### 1. Tela de Login
- Autenticação de usuários com base em perfil (Aluno, Professor, Coordenador).

### 2. Tela de Perfil de Usuário
- Visualização de informações pessoais (nome, e-mail, matrícula, etc).
- Edição básica de dados do perfil.

### 3. Tela Inicial do Aluno
- Listagem das disciplinas matriculadas.
- Acesso a detalhes das disciplinas (a definir).

### 4. Tela Inicial do Professor
- Listagem das turmas que o professor leciona.
- Acesso a alunos e conteúdo da turma (a definir).

### 5. Tela Inicial do Coordenador *(Responsabilidade da equipe)*
Nesta tela, o coordenador poderá gerenciar as informações essenciais da escola. Abaixo estão as funcionalidades previstas:

#### 📌 Funcionalidades:
- ✅ Listar **Professores** cadastrados.
- ✅ Listar **Alunos** cadastrados.
- ✅ Listar **Turmas** existentes.
- ✅ Adicionar um novo **Professor**.
- ✅ Adicionar um novo **Aluno**.
- ✅ Adicionar uma nova **Turma**.
- ✅ Editar dados de um **Professor**.
- ✅ Editar dados de um **Aluno**.
- ✅ Editar dados de uma **Turma**.
- ✅ Excluir **Professores**.
- ✅ Excluir **Alunos**.
- ✅ Excluir **Turmas**.

## 🛠 Tecnologias Utilizadas

- [Flutter](https://flutter.dev/) - SDK de desenvolvimento mobile.
- [Dart](https://dart.dev/) - Linguagem de programação.
- Gerenciamento de estado simples (ex: setState ou Provider, a definir).
- Armazenamento de dados local (opcional para prototipagem).

## 🔖 Organização do Código

O projeto segue a estrutura padrão recomendada pelo Flutter:

'''
lib/
├── main.dart
├── screens/
│ ├── login_screen.dart
│ ├── perfil_screen.dart
│ ├── aluno_home_screen.dart
│ ├── professor_home_screen.dart
│ └── coordenador_home_screen.dart
├── models/
├── widgets/
└── services/
'''

## 👥 Equipe do Projeto

- **Tela de Coordenador: Lucas Alexandre e Alex Vinicius**

## 📌 Observações

Este projeto é acadêmico e visa a prática de desenvolvimento mobile utilizando Flutter. Funcionalidades complexas como autenticação real ou banco de dados online não são exigidas nesta etapa.
