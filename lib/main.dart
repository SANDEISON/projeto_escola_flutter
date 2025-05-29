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
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => _managePage(label),
          ),
        );
      },
      child: Card(
        color: Colors.blueAccent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 30,
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
  Widget _managePage(String label) {
    switch (label) {
      case 'Alunos':
        return const ManageStudentsPage();
      case 'Notas':
        return const ManageGradesPage();
      case 'Frequência':
        return const ManageAttendancePageExpanded();
      case 'Avisos':
        return const ManageNotificationsPage();
      case 'Suporte':
        return const ManageSupportPage();
      default:
        return const Center(child: Text('Página não encontrada.'));
    }
  }
}

class ManageStudentsPage extends StatefulWidget {
  const ManageStudentsPage({super.key});

  @override
  State<ManageStudentsPage> createState() => _ManageStudentsPageState();
}

class _ManageStudentsPageState extends State<ManageStudentsPage> {
  final List<String> _students = List.generate(25, (index) => 'Aluno ${index + 1}');
  final TextEditingController _nameController = TextEditingController();

  void _addStudent() {
    _nameController.clear();
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Adicionar Aluno'),
        content: TextField(
          controller: _nameController,
          decoration: const InputDecoration(hintText: 'Nome do aluno'),
        ),
        actions: [
          TextButton(
            onPressed: () {
              final name = _nameController.text.trim();
              if (name.isNotEmpty) {
                setState(() => _students.add(name));
              }
              Navigator.pop(context);
            },
            child: const Text('Adicionar'),
          ),
        ],
      ),
    );
  }

  void _editStudent(int index) {
    _nameController.text = _students[index];
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Editar Aluno'),
        content: TextField(
          controller: _nameController,
          decoration: const InputDecoration(hintText: 'Novo nome do aluno'),
        ),
        actions: [
          TextButton(
            onPressed: () {
              final newName = _nameController.text.trim();
              if (newName.isNotEmpty) {
                setState(() => _students[index] = newName);
              }
              Navigator.pop(context);
            },
            child: const Text('Salvar'),
          ),
        ],
      ),
    );
  }

  void _deleteStudent(int index) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Excluir Aluno'),
        content: Text('Deseja remover "${_students[index]}" da lista?'),
        actions: [
          TextButton(
            onPressed: () {
              setState(() => _students.removeAt(index));
              Navigator.pop(context);
            },
            child: const Text('Remover'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancelar'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gerenciar Alunos'),
        backgroundColor: Colors.blue,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addStudent,
        backgroundColor: Colors.blue,
        child: const Icon(Icons.add),
        tooltip: 'Adicionar aluno',
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: _students.isEmpty
            ? const Center(child: Text('Nenhum aluno cadastrado.'))
            : ListView.builder(
                itemCount: _students.length,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 3,
                    margin: const EdgeInsets.symmetric(vertical: 6),
                    child: ListTile(
                      leading: const Icon(Icons.person),
                      title: Text(_students[index]),
                      subtitle: Text('ID: ${index + 1}'),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: const Icon(Icons.edit, color: Colors.orange),
                            onPressed: () => _editStudent(index),
                          ),
                          IconButton(
                            icon: const Icon(Icons.delete, color: Colors.red),
                            onPressed: () => _deleteStudent(index),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
      ),
    );
  }
}


class ManageGradesPage extends StatefulWidget {
  const ManageGradesPage({super.key});

  @override
  _ManageGradesPageState createState() => _ManageGradesPageState();
}

class _ManageGradesPageState extends State<ManageGradesPage> {
  final List<Map<String, dynamic>> _students = List.generate(
    25,
    (index) => {
      'name': 'Aluno ${index + 1}',
      'grades': List<double>.filled(4, 0.0),
    },
  );

  void _editGrades(int index) {
    final grades = List<double>.from(_students[index]['grades']);
    final controllers = List.generate(
      4,
      (i) => TextEditingController(text: grades[i].toStringAsFixed(1)),
    );

    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text('Notas - ${_students[index]['name']}'),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: List.generate(4, (i) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: TextField(
                  controller: controllers[i],
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                  decoration: InputDecoration(
                    labelText: 'Nota ${i + 1}',
                    border: const OutlineInputBorder(),
                  ),
                ),
              );
            }),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              setState(() {
                _students[index]['grades'] = controllers.map((c) {
                  final value = double.tryParse(c.text.replaceAll(',', '.')) ?? 0.0;
                  return value.clamp(0.0, 10.0);
                }).toList();
              });
              Navigator.pop(context);
            },
            child: const Text('Salvar'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancelar'),
          ),
        ],
      ),
    );
  }

  double _calculateAverage(List<double> grades) {
    if (grades.isEmpty) return 0.0;
    return grades.reduce((a, b) => a + b) / grades.length;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gerenciar Notas'),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: _students.length,
          itemBuilder: (context, index) {
            final student = _students[index];
            final average = _calculateAverage(student['grades']);

            return Card(
              margin: const EdgeInsets.symmetric(vertical: 6),
              elevation: 2,
              child: ListTile(
                title: Text(student['name']),
                subtitle: Text(
                  'Notas: ${student['grades'].map((g) => g.toStringAsFixed(1)).join(', ')}\n'
                  'Média: ${average.toStringAsFixed(2)}',
                ),
                trailing: IconButton(
                  icon: const Icon(Icons.edit, color: Colors.orange),
                  onPressed: () => _editGrades(index),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}


enum AttendanceFilter { all, present, absent, undefined }

class ManageAttendancePageExpanded extends StatefulWidget {
  const ManageAttendancePageExpanded({super.key});

  @override
  _ManageAttendancePageExpandedState createState() =>
      _ManageAttendancePageExpandedState();
}

class _ManageAttendancePageExpandedState extends State<ManageAttendancePageExpanded> {
  List<Map<String, dynamic>> attendanceRecords = List.generate(
    25,
    (index) => {
      'student': 'Aluno ${index + 1}',
      'presence': null, // null = não marcado ainda
    },
  );

  AttendanceFilter _filter = AttendanceFilter.all;

  void _togglePresence(int index) {
    setState(() {
      if (attendanceRecords[index]['presence'] == null) {
        attendanceRecords[index]['presence'] = true;
      } else if (attendanceRecords[index]['presence'] == true) {
        attendanceRecords[index]['presence'] = false;
      } else {
        attendanceRecords[index]['presence'] = null;
      }
    });
  }

  void _markAllPresent() {
    setState(() {
      for (var record in attendanceRecords) {
        record['presence'] = true;
      }
    });
  }

  void _markAllAbsent() {
    setState(() {
      for (var record in attendanceRecords) {
        record['presence'] = false;
      }
    });
  }

  void _resetAll() {
    setState(() {
      for (var record in attendanceRecords) {
        record['presence'] = null;
      }
    });
  }

  void _setFilter(AttendanceFilter filter) {
    setState(() {
      _filter = filter;
    });
  }

  void _showSummary() {
    int presentCount = attendanceRecords.where((r) => r['presence'] == true).length;
    int absentCount = attendanceRecords.where((r) => r['presence'] == false).length;
    int undefinedCount = attendanceRecords.where((r) => r['presence'] == null).length;
    int total = attendanceRecords.length;

    double presentPercent = (presentCount / total) * 100;
    double absentPercent = (absentCount / total) * 100;
    double undefinedPercent = (undefinedCount / total) * 100;

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Resumo da Frequência'),
        content: Text(
          'Total de alunos: $total\n\n'
          'Presentes: $presentCount (${presentPercent.toStringAsFixed(1)}%)\n'
          'Ausentes: $absentCount (${absentPercent.toStringAsFixed(1)}%)\n'
          'Não Marcados: $undefinedCount (${undefinedPercent.toStringAsFixed(1)}%)',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Fechar'),
          )
        ],
      ),
    );
  }

  List<Map<String, dynamic>> get _filteredRecords {
    switch (_filter) {
      case AttendanceFilter.present:
        return attendanceRecords.where((r) => r['presence'] == true).toList();
      case AttendanceFilter.absent:
        return attendanceRecords.where((r) => r['presence'] == false).toList();
      case AttendanceFilter.undefined:
        return attendanceRecords.where((r) => r['presence'] == null).toList();
      case AttendanceFilter.all:
      default:
        return attendanceRecords;
    }
  }

  String _presenceText(dynamic presence) {
    if (presence == true) return 'Presente';
    if (presence == false) return 'Ausente';
    return 'Não marcado';
  }

  Color _presenceColor(dynamic presence) {
    if (presence == true) return Colors.green;
    if (presence == false) return Colors.red;
    return Colors.grey;
  }

  IconData _presenceIcon(dynamic presence) {
    if (presence == true) return Icons.check_circle;
    if (presence == false) return Icons.cancel;
    return Icons.help_outline;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gerenciar Frequência'),
        backgroundColor: Colors.blue,
        actions: [
          PopupMenuButton<AttendanceFilter>(
            icon: const Icon(Icons.filter_list),
            onSelected: _setFilter,
            itemBuilder: (context) => [
              const PopupMenuItem(
                value: AttendanceFilter.all,
                child: Text('Mostrar Todos'),
              ),
              const PopupMenuItem(
                value: AttendanceFilter.present,
                child: Text('Mostrar Presentes'),
              ),
              const PopupMenuItem(
                value: AttendanceFilter.absent,
                child: Text('Mostrar Ausentes'),
              ),
              const PopupMenuItem(
                value: AttendanceFilter.undefined,
                child: Text('Mostrar Não Marcados'),
              ),
            ],
          ),
          IconButton(
            icon: const Icon(Icons.done_all),
            tooltip: 'Marcar Todos Presentes',
            onPressed: _markAllPresent,
          ),
          IconButton(
            icon: const Icon(Icons.clear_all),
            tooltip: 'Marcar Todos Ausentes',
            onPressed: _markAllAbsent,
          ),
          IconButton(
            icon: const Icon(Icons.restart_alt),
            tooltip: 'Resetar Todas',
            onPressed: _resetAll,
          ),
          IconButton(
            icon: const Icon(Icons.info_outline),
            tooltip: 'Resumo',
            onPressed: _showSummary,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Text(
              'Controle de Frequência',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text('Filtro: ${_filter.name[0].toUpperCase()}${_filter.name.substring(1)}'),
            const SizedBox(height: 10),
            Expanded(
              child: _filteredRecords.isEmpty
                  ? const Center(child: Text('Nenhum aluno encontrado com este filtro.'))
                  : ListView.builder(
                      itemCount: _filteredRecords.length,
                      itemBuilder: (context, index) {
                        final record = _filteredRecords[index];
                        int originalIndex = attendanceRecords.indexOf(record);
                        return Card(
                          margin: const EdgeInsets.symmetric(vertical: 6),
                          child: ListTile(
                            title: Text(record['student']),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  _presenceIcon(record['presence']),
                                  color: _presenceColor(record['presence']),
                                ),
                                const SizedBox(width: 8),
                                Switch(
                                  value: record['presence'] == true,
                                  onChanged: (_) => _togglePresence(originalIndex),
                                ),
                              ],
                            ),
                            subtitle: Text(
                              _presenceText(record['presence']),
                              style: TextStyle(color: _presenceColor(record['presence'])),
                            ),
                            onTap: () => _togglePresence(originalIndex),
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}

class ManageNotificationsPage extends StatefulWidget {
  const ManageNotificationsPage({super.key});

  @override
  _ManageNotificationsPageState createState() =>
      _ManageNotificationsPageState();
}

class _ManageNotificationsPageState extends State<ManageNotificationsPage> {
  final List<Map<String, String>> _notifications = [
    {
      'title': 'Aviso sobre Prova',
      'description': 'Lembre-se que a prova de Matemática será no dia 15.',
    },
    {
      'title': 'Mudança de Horário',
      'description': 'O horário da aula de Física foi alterado para às 14h.',
    },
    {
      'title': 'Reunião de Pais',
      'description': 'A reunião de pais será no dia 20 às 19h na escola.',
    },
  ];

  final TextEditingController _controllerTitle = TextEditingController();
  final TextEditingController _controllerDescription = TextEditingController();

  void _addNotification() {
    if (_controllerTitle.text.isNotEmpty &&
        _controllerDescription.text.isNotEmpty) {
      setState(() {
        _notifications.add({
          'title': _controllerTitle.text,
          'description': _controllerDescription.text,
        });
        _controllerTitle.clear();
        _controllerDescription.clear();
      });
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Aviso adicionado com sucesso!')),
      );
    }
  }

  void _editNotification(int index) {
    _controllerTitle.text = _notifications[index]['title']!;
    _controllerDescription.text = _notifications[index]['description']!;
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Editar Aviso'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: _controllerTitle,
                decoration: const InputDecoration(
                  labelText: 'Título',
                ),
              ),
              TextField(
                controller: _controllerDescription,
                decoration: const InputDecoration(
                  labelText: 'Descrição',
                ),
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                setState(() {
                  _notifications[index] = {
                    'title': _controllerTitle.text,
                    'description': _controllerDescription.text,
                  };
                });
                Navigator.pop(context);
              },
              child: const Text('Salvar'),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancelar'),
            ),
          ],
        );
      },
    );
  }

  void _deleteNotification(int index) {
    setState(() {
      _notifications.removeAt(index);
    });
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Aviso excluído com sucesso!')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gerenciar Avisos'),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Avisos Ativos',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: _notifications.length,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 5,
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: ListTile(
                      title: Text(
                        _notifications[index]['title']!,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(
                        _notifications[index]['description']!,
                        style: const TextStyle(fontSize: 16),
                      ),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: const Icon(Icons.edit),
                            onPressed: () => _editNotification(index),
                          ),
                          IconButton(
                            icon: const Icon(Icons.delete),
                            onPressed: () => _deleteNotification(index),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Adicionar Novo Aviso',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _controllerTitle,
              decoration: const InputDecoration(
                labelText: 'Título do Aviso',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _controllerDescription,
              decoration: const InputDecoration(
                labelText: 'Descrição do Aviso',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _addNotification,
              child: const Text('Adicionar Aviso'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                padding: const EdgeInsets.symmetric(vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ManageSupportPage extends StatefulWidget {
  const ManageSupportPage({super.key});

  @override
  _ManageSupportPageState createState() => _ManageSupportPageState();
}

class _ManageSupportPageState extends State<ManageSupportPage> {
  final TextEditingController _controller = TextEditingController();

  void _showConfirmationDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Mensagem Enviada'),
          content: const Text('Sua mensagem foi enviada com sucesso!'),
          actions: <Widget>[
            TextButton(
              child: const Text('Fechar'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _sendMessage() {
    if (_controller.text.isNotEmpty) {
      _showConfirmationDialog();
      _controller.clear();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Por favor, digite uma mensagem antes de enviar.'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gerenciar Suporte'),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Suporte para Professores',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            const Text(
              'Você pode enviar suas dúvidas ou relatórios aqui.',
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 20),
            _buildSupportTopic(
              title: 'Dúvidas sobre a matéria',
              description:
                  'Aqui você pode tirar dúvidas sobre o conteúdo ensinado nas aulas.',
            ),
            _buildSupportTopic(
              title: 'Problemas de frequência',
              description:
                  'Caso haja algum problema com a frequência, você pode reportar aqui.',
            ),
            _buildSupportTopic(
              title: 'Feedbacks de avaliações',
              description:
                  'Se os alunos tiverem feedbacks sobre as avaliações, este é o local para discutirmos.',
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                labelText: 'Digite sua mensagem',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              maxLines: 3,
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: _sendMessage,
              child: const Text('Enviar'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                padding: const EdgeInsets.symmetric(vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSupportTopic({required String title, required String description}) {
    return ExpansionTile(
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            description,
            style: const TextStyle(fontSize: 16),
          ),
        ),
      ],
    );
  }
}
