// Tela de login por Leonardo Dantas Andrade de Alencar e João Victor Amorim de Oliveira

import 'package:flutter/material.dart';
import 'package:animations/animations.dart';

void main() {
  runApp(
    MaterialApp(home: AlternadorLogin(), debugShowCheckedModeBanner: false),
  );
}

class AlternadorLogin extends StatefulWidget {
  @override
  _EstadoAlternadorLogin createState() => _EstadoAlternadorLogin();
}

class _EstadoAlternadorLogin extends State<AlternadorLogin> {
  bool ehProfessor = false;
  bool animarParaFrente = true;

  void alternarVisao() {
    setState(() {
      animarParaFrente = !ehProfessor;
      ehProfessor = !ehProfessor;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: PageTransitionSwitcher(
        duration: Duration(milliseconds: 400),
        reverse: !animarParaFrente,
        transitionBuilder: (filho, animacao, animacaoSecundaria) {
          return SharedAxisTransition(
            animation: animacao,
            secondaryAnimation: animacaoSecundaria,
            transitionType: SharedAxisTransitionType.horizontal,
            child: filho,
          );
        },
        child:
            ehProfessor
                ? FormularioLogin(
                  key: ValueKey('professor'),
                  ehProfessor: true,
                  aoVoltar: alternarVisao,
                )
                : FormularioLogin(
                  key: ValueKey('aluno'),
                  ehProfessor: false,
                  aoMudarParaProfessor: alternarVisao,
                ),
      ),
    );
  }
}

class FormularioLogin extends StatefulWidget {
  final bool ehProfessor;
  final VoidCallback? aoVoltar;
  final VoidCallback? aoMudarParaProfessor;

  const FormularioLogin({
    Key? key,
    required this.ehProfessor,
    this.aoVoltar,
    this.aoMudarParaProfessor,
  }) : super(key: key);

  @override
  _EstadoFormularioLogin createState() => _EstadoFormularioLogin();
}

class _EstadoFormularioLogin extends State<FormularioLogin> {
  bool mostrarSenha = false;
  String senha = '';

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
            widget.ehProfessor
                ? 'Login - Professor'
                : 'Olá, bem-vindo de volta!',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        if (widget.ehProfessor)
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 8, top: 12),
              child: InkWell(
                onTap: widget.aoVoltar,
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
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
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
                      onChanged: (valor) {
                        setState(() {
                          senha = valor;
                        });
                      },
                      obscureText: !mostrarSenha,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.grey[300],
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                    if (senha.isNotEmpty)
                      IconButton(
                        icon: Icon(
                          mostrarSenha
                              ? Icons.visibility_off
                              : Icons.visibility,
                        ),
                        onPressed: () {
                          setState(() {
                            mostrarSenha = !mostrarSenha;
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
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text('Entrar', style: TextStyle(fontSize: 16)),
                ),
                SizedBox(height: 30),
                if (!widget.ehProfessor)
                  TextButton(
                    onPressed: widget.aoMudarParaProfessor,
                    child: Text(
                      'Sou professor',
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
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
