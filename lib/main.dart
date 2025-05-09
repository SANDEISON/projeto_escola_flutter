import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart'; // Para o usuário selecionar uma imagem do dispositivo
import 'dart:io'; // Para manipular arquivos no dispositivo
import 'package:flutter/foundation.dart'; // Para verificar se o app está rodando na web
import 'dart:developer';

void main() => runApp(const MyApp());

/// Classe principal do aplicativo
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Perfil de Usuário',
      home: UserProfileScreen(),
    );
  }
}

/// Tela de perfil do usuário
class UserProfileScreen extends StatefulWidget {
  const UserProfileScreen({super.key});

  @override
  _UserProfileScreenState createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  // Controladores para os campos de texto
  final TextEditingController _loginController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _surnameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _employeeController = TextEditingController();
  final TextEditingController _birthDateController = TextEditingController();

  // Variáveis para armazenar a imagem do perfil
  File? _profileImage; // Para dispositivos móveis
  Uint8List? _webImage; // Para armazenar a imagem na web

  /// Método para selecionar uma imagem do dispositivo ou navegador
  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      if (kIsWeb) {
        final webImage = await pickedFile.readAsBytes();
        setState(() {
          _webImage = webImage;
        });
      } else {
        setState(() {
          _profileImage = File(pickedFile.path);
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Perfil de Usuário'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            GestureDetector(
              onTap: _pickImage,
              child: CircleAvatar(
                child: (_profileImage == null && _webImage == null)
                    ? const Icon(Icons.camera_alt)
                    : null,
              ),
            ),
            TextField(
              controller: _loginController,
              decoration: const InputDecoration(
                labelText: 'Email',
              ),
            ),
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(
                labelText: 'Nome',
              ),
            ),
            TextField(
              controller: _surnameController,
              decoration: const InputDecoration(
                labelText: 'Sobrenome',
              ),
            ),
            TextField(
              controller: _phoneController,
              decoration: const InputDecoration(
                labelText: 'Telefone',
              ),
            ),
            TextField(
              controller: _employeeController,
              decoration: const InputDecoration(
                labelText: 'Funcionário',
              ),
            ),
            TextField(
              controller: _birthDateController,
              decoration: const InputDecoration(
                labelText: 'Data de Nascimento',
              ),
            ),
            ElevatedButton(
              onPressed: () {
                log('Dados salvos!');
              },
              child: const Text('Salvar'),
            ),
          ],
        ),
      ),
    );
  }
}