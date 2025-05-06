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
      theme: ThemeData(
        fontFamily: 'Poppins', // Define a fonte padrão
        textTheme: const TextTheme(
          bodyMedium: TextStyle(fontSize: 16), // Define o tamanho padrão do texto
        ),
      ),
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
        // Para Flutter Web: lê os bytes da imagem
        final webImage = await pickedFile.readAsBytes();
        setState(() {
          _webImage = webImage; // Atualiza o estado com a imagem selecionada
        });
      } else {
        // Para dispositivos móveis: usa o caminho do arquivo
        setState(() {
          _profileImage = File(pickedFile.path); // Atualiza o estado com a imagem selecionada
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text('Perfil de Usuário'), // Título centralizado no AppBar
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.purple, Colors.pinkAccent],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Avatar do usuário com opção de alterar a imagem
                GestureDetector(
                  onTap: _pickImage, // Chama o método para selecionar uma imagem
                  child: CircleAvatar(
                    radius: 60, // Aumente o tamanho do avatar
                    backgroundColor: Colors.white, // Cor de fundo do contorno
                    child: CircleAvatar(
                      radius: 55, // Avatar interno
                      backgroundImage: kIsWeb
                          ? (_webImage != null ? MemoryImage(_webImage!) : null)
                          : (_profileImage != null ? FileImage(_profileImage!) : null),
                      child: (_profileImage == null && _webImage == null)
                          ? const Icon(Icons.camera_alt, size: 50, color: Colors.grey)
                          : null,
                    ),
                  ),
                ),
                const SizedBox(height: 20), // Espaçamento entre os widgets

                // Campo de texto para o login
                TextField(
                  controller: _loginController,
                  decoration: InputDecoration(
                    labelText: 'Login',
                    labelStyle: const TextStyle(color: Colors.white),
                    filled: true,
                    fillColor: Colors.white.withAlpha((0.8 * 255).toInt()), // Corrigido
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      borderSide: const BorderSide(color: Colors.purple, width: 2.0),
                    ),
                  ),
                ),
                const SizedBox(height: 10),

                // Campo de texto para o nome
                TextField(
                  controller: _nameController,
                  decoration: const InputDecoration(
                    labelText: 'Nome',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 10),

                // Campo de texto para o sobrenome
                TextField(
                  controller: _surnameController,
                  decoration: const InputDecoration(
                    labelText: 'Sobrenome',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 10),

                // Campo de texto para o telefone
                TextField(
                  controller: _phoneController,
                  decoration: const InputDecoration(
                    labelText: 'Telefone',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 10),

                // Campo de texto para o funcionário
                TextField(
                  controller: _employeeController,
                  decoration: const InputDecoration(
                    labelText: 'Funcionário',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 10),

                // Campo de texto para a data de nascimento
                TextField(
                  controller: _birthDateController,
                  decoration: const InputDecoration(
                    labelText: 'Data de Nascimento',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 20),

                // Botão para salvar os dados do perfil
                ElevatedButton(
                  onPressed: () {
                    log('Dados salvos!'); 
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.purple, // Cor de fundo
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0), // Bordas arredondadas
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  ),
                  child: const Text(
                    'Salvar',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(height: 20), // Espaçamento vertical
              ],
            ),
          ),
        ),
      ),
    );
  }
}