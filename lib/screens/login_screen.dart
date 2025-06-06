import 'package:flutter/material.dart';
import '../mock_data/mock_users.dart';
import '../models/user.dart';
import 'package:collection/collection.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  void _login() {
    final username = _usernameController.text;
    final password = _passwordController.text;

    final user = mockUsers.firstWhereOrNull(
      (u) => u.username == username && u.password == password,
    );

    if (user != null) {
      switch (user.role) {
        case UserRole.admin:
          Navigator.pushReplacementNamed(context, Routes.grades);
          break;
        case UserRole.coordinator:
          Navigator.pushReplacementNamed(context, Routes.coordinator);
          break;
        case UserRole.teacher:
          Navigator.pushReplacementNamed(context, Routes.teacher);
          break;
        case UserRole.student:
          Navigator.pushReplacementNamed(context, Routes.student);
          break;
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Usuário ou senha inválidos")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.transparent,
      extendBody: true,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              "assets/images/background.png",
              fit: BoxFit.cover,
            ),
          ),
          SingleChildScrollView(
            child: Container(
              width: size.width,
              height: size.height,
              padding: EdgeInsets.only(
                left: 20,
                right: 20,
                top: size.height * 0.05 + MediaQuery.of(context).padding.top,
                bottom: MediaQuery.of(context).padding.bottom,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Column(
                      children: [
                        SizedBox(height: 20),
                        Image.asset(
                          "assets/images/userLogin.png",
                          width: 120,
                          height: 120,
                        ),
                        SizedBox(height: 20),
                        Text(
                          "Login",
                          textAlign: TextAlign.center,
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge
                              ?.copyWith(fontSize: size.width * 0.1 * 0.5),
                        ),
                      ],
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      SizedBox(height: 50),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                        ),
                        child: TextField(
                          controller: _usernameController,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Usuário",
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                        ),
                        child: TextField(
                          controller: _passwordController,
                          obscureText: true,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Senha",
                          ),
                        ),
                      ),
                      SizedBox(height: 40),
                    ],
                  ),
                  Column(
                    children: [
                      MaterialButton(
                        onPressed: _login,
                        elevation: 0,
                        padding: EdgeInsets.all(18),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        color: Colors.blue,
                        child: Center(
                          child: Text(
                            "Logar",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, Routes.register);
                        },
                        child: Text(
                          "Criar conta",
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Define Routes if missing
class Routes {
  static const String grades = '/grades';
  static const String coordinator = '/coordinator';
  static const String teacher = '/teacher';
  static const String student = '/student';
  static const String register = '/register';
}