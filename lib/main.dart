import 'package:flutter/material.dart';

void main() {
  runApp(const AppEscola());
}

class AppEscola extends StatelessWidget {
  const AppEscola({super.key});

  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App da Escola',
      theme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.deepPurple,
        scaffoldBackgroundColor: Colors.black,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.deepPurple[800],
        ),
      ),
      home: const TelaPerfil(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class TelaPerfil extends StatelessWidget {
  const TelaPerfil({super.key});

  final String nome = "Breno Vinicius Jr";
  final String email = "juninho@escola.com";
  final String tipoUsuario = "Aluno";
  final String turma = "8º Ano - Turma B";
  final String matricula = "202312345";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meu Perfil'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Logout realizado (simulado).')),
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: SingleChildScrollView(
          child: Column(
            children: [
              CircleAvatar(
                radius: 50,
                backgroundColor: Colors.indigo[200],
                child: const Icon(Icons.person, size: 60, color: Colors.white),
              ),
              const SizedBox(height: 16),
              Text(nome, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              Text(email, style: TextStyle(color: Colors.grey[700])),
              const SizedBox(height: 24),
              const Divider(),
              ListTile(
                leading: const Icon(Icons.account_box),
                title: const Text('Tipo de Usuário'),
                subtitle: Text(tipoUsuario),
              ),
              ListTile(
                leading: const Icon(Icons.class_),
                title: const Text('Turma'),
                subtitle: Text(turma),
              ),
              ListTile(
                leading: const Icon(Icons.badge),
                title: const Text('Matrícula'),
                subtitle: Text(matricula),
              ),
              const SizedBox(height: 24),
              ElevatedButton.icon(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Tela de edição ainda não implementada.')),
                  );
                },
                icon: const Icon(Icons.edit),
                label: const Text('Editar Perfil'),
                style: ElevatedButton.styleFrom(minimumSize: const Size(double.infinity, 48)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
