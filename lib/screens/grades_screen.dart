// Projeto flutter, portal de notas
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/student.dart';
import '../models/subject.dart';
import '../mock_data/mock_users.dart';

// usa a mock data dos estudantes
class StudentsData extends ChangeNotifier {
  List<Student> list = mockStudents;

  void addStudent(String name, int age) {
    list.add(Student(name: name, age: age, subjects: []));
    notifyListeners();
  }

  void adicionarMateria(String nome, Subject subject) {
    for (var st in list) {
      if (st.name == nome) {
        st.subjects.add(subject);
        break;
      }
    }
    notifyListeners();
  }

  void changeGrade(String student, String subject, String grade, double valor) {
    for (var st in list) {
      if (st.name == student) {
        for (var sb in st.subjects) {
          if (sb.name == subject) {
            sb.grades[grade] = valor;
          }
        }
      }
    }
    notifyListeners();
  }
}

class GradesScreen extends StatelessWidget {
  const GradesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => StudentsData(),
      child: MaterialApp(
        home: StudentListScreen(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}

// essa parte é tipo a area principal, onde mostra o nome e a media de cada aluno na lista de alunos
class StudentListScreen extends StatelessWidget {
  const StudentListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var data = Provider.of<StudentsData>(context);
    return Scaffold(
      appBar: AppBar(title: Text('Notas')),
      body: ListView.builder(
        itemCount: data.list.length,
        itemBuilder: (_, i) {
          //é tipo um loop, ele passa de aluno por aluno na lista de alunos e adiciona pra ser visualizado
          var student = data.list[i];
          return ListTile(
            title: Text(student.name),
            subtitle: Text(
              'Média: ${student.averageGrade().toStringAsFixed(2)}',
            ), //calculo da media geral
            onTap:
                () => Navigator.push(
                  //isso daqui serve pra abrir a tela de detalhes de aluno quando o usuario tocar/clicar no aluno na lista
                  context,
                  MaterialPageRoute(
                    builder: (_) => DetailScreen(student: student),
                  ),
                ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          // adicionar aluno na lista
          data.addStudent('NewStudent${data.list.length + 1}', 0);
        },
      ),
    );
  }
}

//a tela de detalhes dos estudantes, aqui da pra mudar as notas e outras coisas
class DetailScreen extends StatelessWidget {
  final Student student;
  const DetailScreen({
    super.key,
    required this.student,
  }); //precisa ter um aluno pra poder funcionar, olhe a linha lá em cima que tem o OnTap pra entender.

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(student.name),
      ), //nome do aluno que aparece na lista
      body: Column(
        children:
            student.subjects.map((s) {
              return Card(
                margin: EdgeInsets.all(8),
                child: ListTile(
                  title: Text(s.name),
                  subtitle: Text(
                    'Média: ${s.average().toStringAsFixed(1)}',
                  ), //calcular a media total do aluno baseado nas notas
                ),
              );
            }).toList(),
      ),
    );
  }
}
