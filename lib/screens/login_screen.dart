import 'package:flutter/material.dart';
import '../models/user.dart';
import '../mock_data/mock_users.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  String? _error;

  void _login() {
    final username = _usernameController.text;
    final password = _passwordController.text;

    final user = mockUsers.firstWhere(
      (u) => u.username == username && u.password == password,
      orElse: () => null as User,
    );

    if (user != null) {
      switch (user.role) {
        case UserRole.admin:
          Navigator.pushReplacementNamed(context, '/grades');
          break;
        case UserRole.coordinator:
          Navigator.pushReplacementNamed(context, '/coordinator');
          break;
        case UserRole.teacher:
          Navigator.pushReplacementNamed(context, '/teacher');
          break;
        case UserRole.student:
          Navigator.pushReplacementNamed(context, '/student');
          break;
      }
    } else {
      setState(() {
        _error = "Usuário ou senha inválidos";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(labelText: 'Usuário'),
            ),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(labelText: 'Senha'),
            ),
            SizedBox(height: 20),
            ElevatedButton(onPressed: _login, child: Text('Entrar')),
            if (_error != null) ...[
              SizedBox(height: 20),
              Text(_error!, style: TextStyle(color: Colors.red)),
            ],
          ],
        ),
      ),
    );
  }
}
