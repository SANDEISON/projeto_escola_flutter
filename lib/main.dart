import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App de Escola',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const TeacherHomePage(),
    );
  }
}

class TeacherHomePage extends StatelessWidget {
  const TeacherHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tela Inicial de Professor'),
        backgroundColor: Colors.blue,
      ),
      drawer: const TeacherDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Bem-vindo, Professor!',
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            const Text(
              'Suas turmas:',
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 15),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: List.generate(3, (index) {
                    return _buildClassCard(context, index);
                  }),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildClassCard(BuildContext context, int index) {
    String turmaNome = '';
    if (index == 0) {
      turmaNome = '1° Ano';
    } else if (index == 1) {
      turmaNome = '2° Ano';
    } else {
      turmaNome = '3° Ano';
    }

    return AnimatedContainer(
      duration: const Duration(seconds: 1),
      curve: Curves.easeInOut,
      margin: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: Colors.blueAccent,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 5,
            blurRadius: 10,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: InkWell(
        onTap: () {
          // Navegar para a página de gerenciamento da turma
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ManageSubjectsPage(turmaNome: turmaNome),
            ),
          );
        },
        splashColor: Colors.blue.withOpacity(0.3),
        borderRadius: BorderRadius.circular(12),
        child: ListTile(
          leading: const Icon(
            Icons.class_rounded,
            size: 40,
            color: Colors.white,
          ),
          title: Text(
            turmaNome,
            style: const TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.w600),
          ),
          subtitle: const Text(
            'Clique para gerenciar',
            style: TextStyle(color: Colors.white60),
          ),
          trailing: const Icon(
            Icons.arrow_forward_ios,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

class TeacherDrawer extends StatelessWidget {
  const TeacherDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text(
              'Menu de Navegação',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.account_circle),
            title: const Text('Perfil'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Configurações'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.exit_to_app),
            title: const Text('Sair'),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}

class ManageSubjectsPage extends StatelessWidget {
  final String turmaNome;

  const ManageSubjectsPage({super.key, required this.turmaNome});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gerenciar Matérias - $turmaNome'),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Selecione uma matéria para gerenciar:',
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 15),
            Expanded(
              child: SingleChildScrollView(
                child: GridView.builder(
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3, // Organiza os botões em 3 colunas
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                  ),
                  itemCount: 3, // Quantidade de matérias
                  itemBuilder: (context, index) {
                    return _buildSubjectCard(context, 'Matéria ${index + 1}');
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSubjectCard(BuildContext context, String subject) {
    return AnimatedContainer(
      duration: const Duration(seconds: 1),
      curve: Curves.easeInOut,
      margin: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: Colors.blueAccent, // Cor igual a das turmas
        borderRadius: BorderRadius.circular(8), // Tamanho dos quadrados menores
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 5,
            blurRadius: 10,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: InkWell(
        onTap: () {
          // Navegar para a página de gerenciamento da matéria
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ContentPage(subject: subject),
            ),
          );
        },
        splashColor: Colors.blue.withOpacity(0.3),
        borderRadius: BorderRadius.circular(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.book,
              size: 30, // Ícone menor para os quadrados pequenos
              color: Colors.white,
            ),
            const SizedBox(height: 10),
            Text(
              subject,
              style: const TextStyle(
                  color: Colors.white, fontSize: 14, fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }
}

class ContentPage extends StatelessWidget {
  final String subject;

  const ContentPage({super.key, required this.subject});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Conteúdos - $subject'),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Conteúdos de Matemática - 1º Ano do Ensino Médio',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              const Text(
                '1º Bimestre: Teoria dos Conjuntos e Conjuntos Numéricos',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 10),
              const Text(
                '• Noção de Conjuntos\n'
                '• Conjuntos Numéricos\n'
                '• Funções\n'
                '• Função Afim\n'
                '• Inequações\n',
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 20),
              const Text(
                '2º Bimestre: Sequência e Progressão Aritmética',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 10),
              const Text(
                '• Sequências Numéricas\n'
                '• Progressão Aritmética (PA)\n'
                '• Função Quadrática\n'
                '• Inequação do 2º Grau\n'
                '• Função Modular\n',
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 20),
              const Text(
                '3º Bimestre: Potenciação e Função Exponencial',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 10),
              const Text(
                '• Potenciação\n'
                '• Equação Exponencial\n'
                '• Função Exponencial\n'
                '• Progressão Geométrica\n'
                '• Função Logarítmica\n',
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 20),
              const Text(
                '4º Bimestre: Matemática Financeira e Geometria',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 10),
              const Text(
                '• Matemática Financeira\n'
                '• Geometria de Triângulos e Quadriláteros\n'
                '• Razões Trigonométricas\n',
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
