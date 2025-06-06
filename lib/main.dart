import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cadastro de Professor',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme).copyWith(
          bodyLarge: const TextStyle(color: Colors.white),
          bodyMedium: const TextStyle(color: Colors.white),
          bodySmall: const TextStyle(color: Colors.white),
          displayLarge: const TextStyle(color: Colors.white),
          displayMedium: const TextStyle(color: Colors.white),
          displaySmall: const TextStyle(color: Colors.white),
          headlineMedium: const TextStyle(color: Colors.white),
          headlineSmall: const TextStyle(color: Colors.white),
          headlineLarge: const TextStyle(color: Colors.white),
          titleLarge: const TextStyle(color: Colors.white),
          titleMedium: const TextStyle(color: Colors.white),
          titleSmall: const TextStyle(color: Colors.white),
        ),
      ),
      home: const TeacherRegistrationPage(),
    );
  }
}

class TeacherRegistrationPage extends StatelessWidget {
  const TeacherRegistrationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastro de Professor'),
        backgroundColor: const Color(0xFF0065F8), // Azul claro da paleta
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, // Centraliza todos os itens
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Cadastro de Novo Professor',
                style: GoogleFonts.poppins(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFF4300FF), // Roxo escuro da paleta
                ),
                textAlign: TextAlign.center, // Centraliza o texto
              ),
              const SizedBox(height: 20),
              const RegisterTeacherForm(),
            ],
          ),
        ),
      ),
    );
  }
}

class RegisterTeacherForm extends StatefulWidget {
  const RegisterTeacherForm({super.key});

  @override
  State<RegisterTeacherForm> createState() => _RegisterTeacherFormState();
}

class _RegisterTeacherFormState extends State<RegisterTeacherForm> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _subjectController = TextEditingController();
  final _emailController = TextEditingController();

  void _submitForm() {
    if (_formKey.currentState?.validate() ?? false) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Professor Cadastrado com Sucesso!')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(seconds: 1),
      curve: Curves.easeInOut,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 5,
            blurRadius: 10,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // Centraliza os campos de formulário
          children: [
            TextFormField(
              controller: _nameController,
              style: const TextStyle(color: Colors.black), // Define a cor do texto dentro do campo
              decoration: InputDecoration(
                labelText: 'Nome do Professor',
                border: const OutlineInputBorder(),
                prefixIcon: const Icon(Icons.person),
                labelStyle: GoogleFonts.poppins(),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Por favor, insira o nome do professor';
                }
                return null;
              },
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: _subjectController,
              style: const TextStyle(color: Colors.black), // Define a cor do texto dentro do campo
              decoration: InputDecoration(
                labelText: 'Matéria',
                border: const OutlineInputBorder(),
                prefixIcon: const Icon(Icons.book),
                labelStyle: GoogleFonts.poppins(),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Por favor, insira a matéria do professor';
                }
                return null;
              },
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: _emailController,
              style: const TextStyle(color: Colors.black), // Define a cor do texto dentro do campo
              decoration: InputDecoration(
                labelText: 'Email',
                border: const OutlineInputBorder(),
                prefixIcon: const Icon(Icons.email),
                labelStyle: GoogleFonts.poppins(),
              ),
              keyboardType: TextInputType.emailAddress,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Por favor, insira o email do professor';
                } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                  return 'Insira um email válido';
                }
                return null;
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _submitForm,
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                backgroundColor: const Color(0xFF00CAFF), // Azul claro da paleta
              ),
              child: const Text(
                'Cadastrar Professor',
                style: TextStyle(color: Colors.white), // Cor do texto do botão
              ),
            ),
          ],
        ),
      ),
    );
  }
}
