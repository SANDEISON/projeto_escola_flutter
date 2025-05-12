import 'package:flutter/material.dart';
import 'dart:math';

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
    List<String> subjects = [
      'Matemática',
      'Química',
      'Física',
    ];

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
                  itemCount: subjects.length,
                  itemBuilder: (context, index) {
                    return _buildSubjectCard(context, subjects[index]);
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
              builder: (context) => ManageClassContentPage(subject: subject),
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

class ManageClassContentPage extends StatelessWidget {
  final String subject;

  const ManageClassContentPage({super.key, required this.subject});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gerenciar Conteúdo - $subject'),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Selecione uma opção para gerenciar:',
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 15),
            GridView(
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3, // Organiza os botões em 3 colunas
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              children: [
                _buildOptionButton(context, 'Alunos', Icons.person),
                _buildOptionButton(context, 'Conteúdo', Icons.content_paste),
                _buildOptionButton(context, 'Notas', Icons.grade),
                _buildOptionButton(context, 'Frequência', Icons.check_circle),
                _buildOptionButton(context, 'Avisos', Icons.notifications),
                _buildOptionButton(context, 'Suporte', Icons.help_outline),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOptionButton(BuildContext context, String label, IconData icon) {
    return InkWell(
      onTap: () {
        // Navegar para a tela correspondente de gerenciamento
        // Coloque aqui a navegação para a página correspondente
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => managePage(label),
          ),
        );
      },
      child: Card(
        color: Colors.blueAccent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8), // Menor borda para os quadrados
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 30, // Ícone menor para os quadrados pequenos
              color: Colors.white,
            ),
            const SizedBox(height: 10),
            Text(
              label,
              style: const TextStyle(color: Colors.white, fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }

  // Função para gerenciar as páginas de cada opção
  Widget managePage(String label) {
    switch (label) {
      case 'Alunos':
        return const ManageStudentsPage();
      case 'Conteúdo':
        return const ManageContentPage();
      case 'Notas':
        return const ManageGradesPage();
      case 'Frequência':
        return const ManageAttendancePage();
      case 'Avisos':
        return const ManageNotificationsPage();
      case 'Suporte':
        return const ManageSupportPage();
      default:
        return const Center(child: Text('Página não encontrada.'));
    }
  }
}

class ManageStudentsPage extends StatelessWidget {
  const ManageStudentsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gerenciar Alunos'),
        backgroundColor: Colors.blue,
      ),
      body: const Center(
        child: Text('Aqui você pode gerenciar seus alunos.'),
      ),
    );
  }
}

class ManageContentPage extends StatelessWidget {
  const ManageContentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gerenciar Conteúdo'),
        backgroundColor: Colors.blue,
      ),
      body: const Center(
        child: Text('Aqui você pode gerenciar o conteúdo da matéria.'),
      ),
    );
  }
}

class ManageGradesPage extends StatelessWidget {
  const ManageGradesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gerenciar Notas'),
        backgroundColor: Colors.blue,
      ),
      body: const Center(
        child: Text('Aqui você pode gerenciar as notas dos alunos.'),
      ),
    );
  }
}

class ManageAttendancePage extends StatelessWidget {
  const ManageAttendancePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gerenciar Frequência'),
        backgroundColor: Colors.blue,
      ),
      body: const Center(
        child: Text('Aqui você pode gerenciar a frequência dos alunos.'),
      ),
    );
  }
}

class ManageNotificationsPage extends StatelessWidget {
  const ManageNotificationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gerenciar Avisos'),
        backgroundColor: Colors.blue,
      ),
      body: const Center(
        child: Text('Aqui você pode gerenciar os avisos para a turma.'),
      ),
    );
  }
}

class ManageSupportPage extends StatelessWidget {
  const ManageSupportPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gerenciar Suporte'),
        backgroundColor: Colors.blue,
      ),
      body: const Center(
        child: Text('Aqui você pode gerenciar o suporte para a matéria.'),
      ),
    );
  }
}
