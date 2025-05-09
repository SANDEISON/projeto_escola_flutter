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
      home: const TelaCadastro(),
    );
  }
}

class TelaCadastro extends StatefulWidget {
  const TelaCadastro({super.key});

  @override
  State<TelaCadastro> createState() => _TelaCadastroState();
}

class _TelaCadastroState extends State<TelaCadastro> {
  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _senhaController = TextEditingController();

  void _cadastrarAluno() {
    String nome = _nomeController.text;
    String email = _emailController.text;
    String senha = _senhaController.text;

    showDialog(
      context: context,
      builder:
          (_) => AlertDialog(
            title: const Text('Dados cadastrados'),
            content: Text('Nome: $nome\nEmail: $email\nSenha: $senha'),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('OK'),
              ),
            ],
          ),
    ).then((_) {
      // Limpa os campos após o alerta ser fechado
      _resetarFormulario();
    });
  }

  void _resetarFormulario() {
    setState(() {
      _nomeController.clear();
      _emailController.clear();
      _senhaController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cadastro de Alunos')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          TextField(
            controller: _nomeController,
            decoration: const InputDecoration(labelText: 'Nome'),
          ),
          const SizedBox(height: 16),
          TextField(
            controller: _emailController,
            decoration: const InputDecoration(labelText: 'Email'),
            keyboardType: TextInputType.emailAddress,
          ),
          const SizedBox(height: 16),
          TextField(
            controller: _senhaController,
            decoration: const InputDecoration(labelText: 'Senha'),
            obscureText: true,
          ),
          const SizedBox(height: 24),
          ElevatedButton(
            onPressed: _cadastrarAluno,
            child: const Text('Cadastrar'),
          ),
        ],
      ),
    );
  }
}
