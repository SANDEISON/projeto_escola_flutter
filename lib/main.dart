import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gerenciamento de Turmas',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: TurmaManager(),
    );
  }
}

class TurmaManager extends StatefulWidget {
  @override
  _TurmaManagerState createState() => _TurmaManagerState();
}

class _TurmaManagerState extends State<TurmaManager> {
  final List<String> anos = ['1º Ano', '2º Ano', '3º Ano'];
  String? turmaSelecionada = '1º Ano';
  List<Map<String, String>> alunos = [];

  // Função para adicionar alunos aleatórios
  void _adicionarAlunos() {
    final random = Random();
    final nomes = [
      'João', 'Maria', 'Pedro', 'Ana', 'Carlos', 'Juliana', 'Lucas', 'Sofia', 'Gabriel', 'Isabela'
    ];
    final sobrenomes = [
      'Silva', 'Souza', 'Oliveira', 'Costa', 'Pereira', 'Lima', 'Almeida', 'Ferreira', 'Rodrigues', 'Martins'
    ];

    alunos.clear();
    for (int i = 0; i < 10; i++) {
      String nome = nomes[random.nextInt(nomes.length)];
      String sobrenome = sobrenomes[random.nextInt(sobrenomes.length)];
      alunos.add({
        'nome': '$nome $sobrenome',
        'turma': turmaSelecionada!,
      });
    }
  }

  // Função para excluir aluno
  void _excluirAluno(int index) {
    setState(() {
      alunos.removeAt(index);
    });
  }

  // Função para adicionar aluno manualmente
  void _adicionarAlunoManual(String nome) {
    setState(() {
      alunos.add({'nome': nome, 'turma': turmaSelecionada!});
    });
  }

  @override
  void initState() {
    super.initState();
    _adicionarAlunos(); // Adiciona os alunos aleatórios no início
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gerenciamento de Turmas'),
        backgroundColor: Colors.deepPurple,
        actions: [
          // Botão para abrir o menu lateral (Drawer)
          IconButton(
            icon: Icon(Icons.menu),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.deepPurple,
              ),
              child: Text(
                'Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              title: Text('Tela Inicial'),
              onTap: () {
                // Aqui você pode adicionar a navegação, por enquanto é apenas estético
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Configurações'),
              onTap: () {
                // Aqui você pode adicionar a navegação, por enquanto é apenas estético
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Dropdown para selecionar a turma
            Container(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Text(
                'Selecione a Turma:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            DropdownButton<String>(
              value: turmaSelecionada,
              onChanged: (String? newValue) {
                setState(() {
                  turmaSelecionada = newValue!;
                  _adicionarAlunos(); // Recarrega os alunos
                });
              },
              items: anos.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              isExpanded: true,
            ),
            SizedBox(height: 20),
            // Campo para adicionar aluno manualmente
            Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: 'Nome do aluno',
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 15),
                    ),
                    onSubmitted: (nome) {
                      if (nome.isNotEmpty) {
                        _adicionarAlunoManual(nome);
                      }
                    },
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.add_circle, color: Colors.blue, size: 30),
                  onPressed: () {
                    final TextEditingController nomeController = TextEditingController();
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: Text('Adicionar Aluno'),
                        content: TextField(
                          controller: nomeController,
                          decoration: InputDecoration(hintText: "Nome do aluno"),
                        ),
                        actions: [
                          TextButton(
                            onPressed: () {
                              if (nomeController.text.isNotEmpty) {
                                _adicionarAlunoManual(nomeController.text);
                                Navigator.of(context).pop();
                              }
                            },
                            child: Text('Adicionar'),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
            SizedBox(height: 20),
            // Exibe a lista de alunos
            Expanded(
              child: ListView.builder(
                itemCount: alunos.length,
                itemBuilder: (context, index) {
                  return Card(
                    margin: EdgeInsets.symmetric(vertical: 5),
                    elevation: 5,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    child: ListTile(
                      contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      title: Text(
                        alunos[index]['nome']!,
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(
                        'Turma: ${alunos[index]['turma']}',
                        style: TextStyle(fontSize: 14, color: Colors.grey),
                      ),
                      trailing: IconButton(
                        icon: Icon(Icons.delete, color: Colors.red),
                        onPressed: () => _excluirAluno(index),
                      ),
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
