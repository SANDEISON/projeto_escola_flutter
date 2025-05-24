import 'package:flutter/material.dart';
import '../models/pessoa.dart';
import '../models/turma.dart';

class CoordenadorHomeScreen extends StatefulWidget {
  @override
  _CoordenadorHomeScreenState createState() => _CoordenadorHomeScreenState();
}

class _CoordenadorHomeScreenState extends State<CoordenadorHomeScreen> {
  late List<Professor> professores;
  late List<Aluno> alunos;
  late List<Turma> turmas;

  @override
  void initState() {
    super.initState();

    professores = [
      Professor(nome: 'João Silva', id: 'P01', materia: 'Matemática'),
      Professor(nome: 'Maria Oliveira', id: 'P02', materia: 'História'),
    ];

    alunos = [
      Aluno(nome: 'Ana Paula', matricula: 'A123', curso: 'Engenharia'),
      Aluno(nome: 'Carlos Souza', matricula: 'A124', curso: 'Medicina'),
    ];

    turmas = [
      Turma(nome: 'Turma A', periodo: 'Manhã', professor: professores[0]),
      Turma(nome: 'Turma B', periodo: 'Tarde', professor: professores[1]),
    ];
  }

  // ====== Professores ======

  void _adicionarProfessor() {
    String nome = '';
    String id = '';
    String materia = '';

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Adicionar Professor'),
          content: SingleChildScrollView(
            child: Column(
              children: [
                TextField(
                  decoration: InputDecoration(hintText: 'Nome'),
                  onChanged: (value) => nome = value,
                ),
                TextField(
                  decoration: InputDecoration(hintText: 'ID'),
                  onChanged: (value) => id = value,
                ),
                TextField(
                  decoration: InputDecoration(hintText: 'Matéria'),
                  onChanged: (value) => materia = value,
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                if (nome.isNotEmpty && id.isNotEmpty && materia.isNotEmpty) {
                  setState(() {
                    professores.add(
                      Professor(nome: nome, id: id, materia: materia),
                    );
                  });
                }
                Navigator.pop(context);
              },
              child: Text('Adicionar'),
            ),
          ],
        );
      },
    );
  }

  void _editarProfessor(int index) {
    String nome = professores[index].nome;
    String id = professores[index].id;
    String materia = professores[index].materia;

    TextEditingController nomeController = TextEditingController(text: nome);
    TextEditingController idController = TextEditingController(text: id);
    TextEditingController materiaController = TextEditingController(
      text: materia,
    );

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Editar Professor'),
          content: SingleChildScrollView(
            child: Column(
              children: [
                TextField(
                  controller: nomeController,
                  decoration: InputDecoration(hintText: 'Nome'),
                  onChanged: (value) => nome = value,
                ),
                TextField(
                  controller: idController,
                  decoration: InputDecoration(hintText: 'ID'),
                  onChanged: (value) => id = value,
                ),
                TextField(
                  controller: materiaController,
                  decoration: InputDecoration(hintText: 'Matéria'),
                  onChanged: (value) => materia = value,
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                if (nome.isNotEmpty && id.isNotEmpty && materia.isNotEmpty) {
                  setState(() {
                    professores[index] = Professor(
                      nome: nome,
                      id: id,
                      materia: materia,
                    );
                  });
                }
                Navigator.pop(context);
              },
              child: Text('Salvar'),
            ),
          ],
        );
      },
    );
  }

  void _excluirProfessor(int index) {
    setState(() {
      professores.removeAt(index);
    });
  }

  Widget _buildProfessorSection() {
    return Card(
      margin: EdgeInsets.all(10),
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Professores',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                IconButton(
                  icon: Icon(Icons.add),
                  onPressed: _adicionarProfessor,
                ),
              ],
            ),
            ...List.generate(professores.length, (index) {
              final prof = professores[index];
              return ListTile(
                title: Text(prof.nome),
                subtitle: Text('ID: ${prof.id} - Matéria: ${prof.materia}'),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: Icon(Icons.edit),
                      onPressed: () => _editarProfessor(index),
                    ),
                    IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () => _excluirProfessor(index),
                    ),
                  ],
                ),
              );
            }),
          ],
        ),
      ),
    );
  }

  // ====== Alunos (mantive seu código original, só adaptei pra usar Aluno) ======

  void _adicionarAluno() {
    String nome = '';
    String matricula = '';
    String curso = '';

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Adicionar Aluno'),
          content: SingleChildScrollView(
            child: Column(
              children: [
                TextField(
                  decoration: InputDecoration(hintText: 'Nome'),
                  onChanged: (value) => nome = value,
                ),
                TextField(
                  decoration: InputDecoration(hintText: 'Matrícula'),
                  onChanged: (value) => matricula = value,
                ),
                TextField(
                  decoration: InputDecoration(hintText: 'Curso'),
                  onChanged: (value) => curso = value,
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                if (nome.isNotEmpty &&
                    matricula.isNotEmpty &&
                    curso.isNotEmpty) {
                  setState(() {
                    alunos.add(
                      Aluno(nome: nome, matricula: matricula, curso: curso),
                    );
                  });
                }
                Navigator.pop(context);
              },
              child: Text('Adicionar'),
            ),
          ],
        );
      },
    );
  }

  void _editarAluno(int index) {
    String nome = alunos[index].nome;
    String matricula = alunos[index].matricula;
    String curso = alunos[index].curso;

    TextEditingController nomeController = TextEditingController(text: nome);
    TextEditingController matriculaController = TextEditingController(
      text: matricula,
    );
    TextEditingController cursoController = TextEditingController(text: curso);

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Editar Aluno'),
          content: SingleChildScrollView(
            child: Column(
              children: [
                TextField(
                  controller: nomeController,
                  decoration: InputDecoration(hintText: 'Nome'),
                  onChanged: (value) => nome = value,
                ),
                TextField(
                  controller: matriculaController,
                  decoration: InputDecoration(hintText: 'Matrícula'),
                  onChanged: (value) => matricula = value,
                ),
                TextField(
                  controller: cursoController,
                  decoration: InputDecoration(hintText: 'Curso'),
                  onChanged: (value) => curso = value,
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                if (nome.isNotEmpty &&
                    matricula.isNotEmpty &&
                    curso.isNotEmpty) {
                  setState(() {
                    alunos[index] = Aluno(
                      nome: nome,
                      matricula: matricula,
                      curso: curso,
                    );
                  });
                }
                Navigator.pop(context);
              },
              child: Text('Salvar'),
            ),
          ],
        );
      },
    );
  }

  void _excluirAluno(int index) {
    setState(() {
      alunos.removeAt(index);
    });
  }

  Widget _buildAlunoSection() {
    return Card(
      margin: EdgeInsets.all(10),
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Alunos',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                IconButton(icon: Icon(Icons.add), onPressed: _adicionarAluno),
              ],
            ),
            ...List.generate(alunos.length, (index) {
              final aluno = alunos[index];
              return ListTile(
                title: Text(aluno.nome),
                subtitle: Text(
                  'Matrícula: ${aluno.matricula} - Curso: ${aluno.curso}',
                ),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: Icon(Icons.edit),
                      onPressed: () => _editarAluno(index),
                    ),
                    IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () => _excluirAluno(index),
                    ),
                  ],
                ),
              );
            }),
          ],
        ),
      ),
    );
  }

  // ====== Turmas ======

  void _adicionarTurma() {
    String nome = '';
    String periodo = '';
    Professor? professorSelecionado;

    showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setStateDialog) {
            return AlertDialog(
              title: Text('Adicionar Turma'),
              content: SingleChildScrollView(
                child: Column(
                  children: [
                    TextField(
                      decoration: InputDecoration(hintText: 'Nome da Turma'),
                      onChanged: (value) => nome = value,
                    ),
                    TextField(
                      decoration: InputDecoration(hintText: 'Período'),
                      onChanged: (value) => periodo = value,
                    ),
                    DropdownButton<Professor>(
                      hint: Text('Selecione o Professor'),
                      value: professorSelecionado,
                      isExpanded: true,
                      items:
                          professores.map((prof) {
                            return DropdownMenuItem<Professor>(
                              value: prof,
                              child: Text('${prof.nome} (${prof.materia})'),
                            );
                          }).toList(),
                      onChanged: (prof) {
                        setStateDialog(() {
                          professorSelecionado = prof;
                        });
                      },
                    ),
                  ],
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    if (nome.isNotEmpty &&
                        periodo.isNotEmpty &&
                        professorSelecionado != null) {
                      setState(() {
                        turmas.add(
                          Turma(
                            nome: nome,
                            periodo: periodo,
                            professor: professorSelecionado!,
                          ),
                        );
                      });
                      Navigator.pop(context);
                    }
                  },
                  child: Text('Adicionar'),
                ),
              ],
            );
          },
        );
      },
    );
  }

  void _editarTurma(int index) {
    String nome = turmas[index].nome;
    String periodo = turmas[index].periodo;
    Professor professorSelecionado = turmas[index].professor;

    TextEditingController nomeController = TextEditingController(text: nome);
    TextEditingController periodoController = TextEditingController(
      text: periodo,
    );

    showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setStateDialog) {
            return AlertDialog(
              title: Text('Editar Turma'),
              content: SingleChildScrollView(
                child: Column(
                  children: [
                    TextField(
                      controller: nomeController,
                      decoration: InputDecoration(hintText: 'Nome da Turma'),
                      onChanged: (value) => nome = value,
                    ),
                    TextField(
                      controller: periodoController,
                      decoration: InputDecoration(hintText: 'Período'),
                      onChanged: (value) => periodo = value,
                    ),
                    DropdownButton<Professor>(
                      isExpanded: true,
                      value: professorSelecionado,
                      items:
                          professores.map((prof) {
                            return DropdownMenuItem<Professor>(
                              value: prof,
                              child: Text('${prof.nome} (${prof.materia})'),
                            );
                          }).toList(),
                      onChanged: (prof) {
                        setStateDialog(() {
                          professorSelecionado = prof!;
                        });
                      },
                    ),
                  ],
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    if (nome.isNotEmpty &&
                        periodo.isNotEmpty &&
                        professorSelecionado != null) {
                      setState(() {
                        turmas[index] = Turma(
                          nome: nome,
                          periodo: periodo,
                          professor: professorSelecionado,
                        );
                      });
                      Navigator.pop(context);
                    }
                  },
                  child: Text('Salvar'),
                ),
              ],
            );
          },
        );
      },
    );
  }

  void _excluirTurma(int index) {
    setState(() {
      turmas.removeAt(index);
    });
  }

  Widget _buildTurmaSection() {
    return Card(
      margin: EdgeInsets.all(10),
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Turmas',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                IconButton(icon: Icon(Icons.add), onPressed: _adicionarTurma),
              ],
            ),
            ...List.generate(turmas.length, (index) {
              final turma = turmas[index];
              return ListTile(
                title: Text(turma.nome),
                subtitle: Text(
                  'Período: ${turma.periodo} - Professor: ${turma.professor.nome}',
                ),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: Icon(Icons.edit),
                      onPressed: () => _editarTurma(index),
                    ),
                    IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () => _excluirTurma(index),
                    ),
                  ],
                ),
              );
            }),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Coordenador')),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildProfessorSection(),
            _buildAlunoSection(),
            _buildTurmaSection(),
          ],
        ),
      ),
    );
  }
}
