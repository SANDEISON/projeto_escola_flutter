import 'package:flutter/material.dart';
import 'package:animations/animations.dart';

void main() {
  runApp(MaterialApp(home: LoginSwitcher(), debugShowCheckedModeBanner: false));
}

class LoginSwitcher extends StatefulWidget {
  @override
  _LoginSwitcherState createState() => _LoginSwitcherState();
}

class _LoginSwitcherState extends State<LoginSwitcher> {
  bool isTeacher = false;
  bool forward = true;

  void toggleView() {
    setState(() {
      forward = !isTeacher;
      isTeacher = !isTeacher;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: PageTransitionSwitcher(
        duration: Duration(milliseconds: 400),
        reverse: !forward,
        transitionBuilder: (child, animation, secondaryAnimation) {
          return SharedAxisTransition(
            animation: animation,
            secondaryAnimation: secondaryAnimation,
            transitionType: SharedAxisTransitionType.horizontal,
            child: child,
          );
        },
        child: isTeacher
            ? LoginForm(
                key: ValueKey('teacher'),
                isTeacher: true,
                onBack: toggleView,
              )
            : LoginForm(
                key: ValueKey('student'),
                isTeacher: false,
                onSwitchToTeacher: toggleView,
              ),
      ),
    );
  }
}

class LoginForm extends StatefulWidget {
  final bool isTeacher;
  final VoidCallback? onBack;
  final VoidCallback? onSwitchToTeacher;

  const LoginForm({
    Key? key,
    required this.isTeacher,
    this.onBack,
    this.onSwitchToTeacher,
  }) : super(key: key);

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  bool showPassword = false;
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: Colors.lightBlue,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          width: double.infinity,
          alignment: Alignment.centerLeft,
          child: Text(
            widget.isTeacher ? 'Login - Professor' : 'Olá, bem vindo de volta!',
            style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        if (widget.isTeacher)
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 8, top: 12),
              child: InkWell(
                onTap: widget.onBack,
                borderRadius: BorderRadius.circular(24),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(Icons.arrow_back, color: Colors.black),
                ),
              ),
            ),
          ),
        Expanded(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: Column(
              children: [
                SizedBox(height: 30),
                CircleAvatar(
                  radius: 35,
                  backgroundColor: Colors.grey[300],
                  child: Icon(Icons.person, color: Colors.white, size: 35),
                ),
                SizedBox(height: 30),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text('Matrícula:'),
                ),
                SizedBox(height: 6),
                TextField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey[300],
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                  ),
                ),
                SizedBox(height: 20),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text('Senha de oito dígitos:'),
                ),
                SizedBox(height: 6),
                Stack(
                  alignment: Alignment.centerRight,
                  children: [
                    TextField(
                      onChanged: (value) {
                        setState(() {
                          password = value;
                        });
                      },
                      obscureText: !showPassword,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.grey[300],
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                      ),
                    ),
                    if (password.isNotEmpty)
                      IconButton(
                        icon: Icon(showPassword ? Icons.visibility_off : Icons.visibility),
                        onPressed: () {
                          setState(() {
                            showPassword = !showPassword;
                          });
                        },
                      ),
                  ],
                ),
                SizedBox(height: 30),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.lightBlue,
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                  child: Text('Entrar', style: TextStyle(fontSize: 16)),
                ),
                SizedBox(height: 30),
                if (!widget.isTeacher)
                  TextButton(
                    onPressed: widget.onSwitchToTeacher,
                    child: Text(
                      'Sou professor',
                      style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

