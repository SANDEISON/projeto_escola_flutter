import 'package:flutter/material.dart';

void main() {
  runApp(const Cadastro());
}

class Cadastro extends StatelessWidget {
  const Cadastro({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Tela de cadastro de alunos",
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const TelaCadastro(),  // Aqui estamos setando a tela principal
    );
  }
}

class TelaCadastro extends StatelessWidget {
  const TelaCadastro({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold( // Agora adicionamos um Scaffold
      appBar: AppBar(title: const Text('Cadastro de Alunos')),
      body: ListView(
        padding: const EdgeInsets.all(16), // Adicionando um pouco de padding
        children: const [
          TextField(
            decoration: InputDecoration(
              labelText: 'Nome',
            ),
          ),
          SizedBox(height: 16),
          TextField(
            decoration: InputDecoration(
              labelText: 'Email',
            ),
            keyboardType: TextInputType.emailAddress,
          ),
          SizedBox(height: 16),
          TextField(
            decoration: InputDecoration(
              labelText: 'Senha',
            ),
            obscureText: true,
          ),
          SizedBox(height: 24),
          ElevatedButton(
            onPressed: null, // O botão ainda não faz nada
            child: Text('Cadastrar'),
          ),
        ],
      ),
    );
  }
}
