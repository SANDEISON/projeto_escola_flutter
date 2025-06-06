// Projeto flutter, portal de notas
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/student.dart';
import '../models/subject.dart';
import '../models/classroom.dart';
import '../mock_data/mock_users.dart';

// usa a mock data dos estudantes
class StudentsData extends ChangeNotifier {
  List<Student> list = mockStudents;
  List<Classroom> classrooms = mockClassrooms;

 void addStudent(String name, int age, String classroomName) {
    list.add(Student(name: name, age: age, subjects: []));
    // ache a turma para o aluno
    for (var classroom in classrooms) {
      if (classroom.name == classroomName) {
        classroom.studentNames.add(name);
        break;
      }
    }
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

  List<Student> getStudentsInClassroom(String classroomName) {
    Classroom classroom =
        classrooms.firstWhere((classroom) => classroom.name == classroomName);
    return list
        .where((student) => classroom.studentNames.contains(student.name))
        .toList();
  }
}

class GradesScreen extends StatelessWidget {
  const GradesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<StudentsData>(
      create: (_) => StudentsData(),
      builder: (context, child) => MaterialApp(
        title: 'Portal de Notas',
        theme: ThemeData(
          primarySwatch: Colors.indigo,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          useMaterial3: true,
        ),
        home: const ClassroomListScreen(), // Changed to ClassroomListScreen
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}

class ClassroomListScreen extends StatelessWidget { //tela de turmas
  const ClassroomListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var data = Provider.of<StudentsData>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Turmas'),
        centerTitle: true,
        backgroundColor: Colors.indigo,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFFE8EAF6), Color(0xFFC5CAE9)],
          ),
        ),
        child: ListView.builder(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          itemCount: data.classrooms.length,
          itemBuilder: (BuildContext context, int index) {
            var classroom = data.classrooms[index];
            return Card(
              elevation: 4,
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: ListTile(
                leading: const Icon(Icons.group, color: Colors.indigo),
                title: Text(
                  classroom.name,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text(
                  '${classroom.studentNames.length} Alunos', 
                  style: const TextStyle(color: Colors.grey),
                ),
                trailing: const Icon(Icons.arrow_forward_ios, color: Colors.grey),
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute<StudentListScreen>(
                    builder: (_) => StudentListScreen(classroomName: classroom.name),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

// essa parte é tipo a area principal, onde mostra o nome e a media de cada aluno na lista de alunos
class StudentListScreen extends StatelessWidget {
  final String classroomName;
  const StudentListScreen({Key? key, required this.classroomName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var data = Provider.of<StudentsData>(context);
    List<Student> students = data.getStudentsInClassroom(classroomName);

    return Scaffold(
      appBar: AppBar(
        title: Text('Alunos - $classroomName'),
        centerTitle: true,
        backgroundColor: Colors.indigo,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFFE8EAF6), Color(0xFFC5CAE9)],
          ),
        ),
        child: ListView.builder(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          itemCount: students.length,
          itemBuilder: (BuildContext context, int i) {
            //é tipo um loop, ele passa de aluno por aluno na lista de alunos e adiciona pra ser visualizado
            var student = students[i];
            return Card(
              elevation: 4,
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: ListTile(
                leading: const Icon(Icons.person, color: Colors.indigo),
                title: Text(
                  student.name,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Média: ${student.averageGrade().toStringAsFixed(2)}',
                      style: const TextStyle(color: Colors.grey),
                    ), //calculo da media geral
                    Text(
                      'Status: ${student.status}',
                      style: TextStyle(
                        color: student.statuscolor,
                      ), //usa a função statuscolor
                    ),
                  ],
                ),
                trailing: Text(
                  student.averageGrade().toStringAsFixed(2),
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.indigo,
                  ),
                ),
                onTap: () => Navigator.push(
                  //isso daqui serve pra abrir a tela de detalhes de aluno quando o usuario tocar/clicar no aluno na lista
                  context,
                  MaterialPageRoute<DetailScreen>(
                    builder: (_) => DetailScreen(student: student),
                  ),
                ),
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.indigo,
        child: const Icon(Icons.add),
        onPressed: () {
          // adicionar aluno na lista
          data.addStudent(
              'NewStudent${data.list.length + 1}', 0, classroomName);
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
        centerTitle: true,
        backgroundColor: Colors.indigo,
      ), //nome do aluno que aparece na lista
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFFE8EAF6), Color(0xFFC5CAE9)],
          ),
        ),
        child: ListView(
          children: student.subjects.map((s) {
            return Card(
              elevation: 4,
              margin: const EdgeInsets.all(8),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: ListTile(
                leading: const Icon(Icons.book, color: Colors.indigo),
                title: Text(
                  s.name,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Média: ${s.average().toStringAsFixed(1)}',
                      style: const TextStyle(color: Colors.grey),
                    ), //calcular a media total do aluno baseado nas notas
                    Text(
                      'Status: ${s.status}',
                      style: TextStyle(
                        color: s.statuscolor,
                      ), //usa a função statuscolor
                    ),
                  ],
                ),
                trailing: const Icon(Icons.edit, color: Colors.grey),
                onTap: () {
                  Navigator.push<GradeEditScreen>(
                    context,
                    MaterialPageRoute<GradeEditScreen>(
                      builder: (context) =>
                          GradeEditScreen(student: student, subject: s),
                    ),
                  );
                },
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}

class GradeEditScreen extends StatefulWidget {
  final Student student;
  final Subject subject;

  const GradeEditScreen({
    Key? key,
    required this.student,
    required this.subject,
  }) : super(key: key);

  @override
  State<GradeEditScreen> createState() => _GradeEditScreenState();
}

class _GradeEditScreenState extends State<GradeEditScreen> {
  late Map<String, TextEditingController> _gradeControllers;

  @override
  void initState() {
    super.initState();
    _gradeControllers = widget.subject.grades
        .map<String, TextEditingController>(
          (key, value) => MapEntry<String, TextEditingController>(
            key,
            TextEditingController(text: value.toString()),
          ),
        );
  }

  @override
  void dispose() {
    for (var controller in _gradeControllers.values) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( //definir titulo na barra de navegação
        title: Text('Editar Notas - ${widget.subject.name}'),
        centerTitle: true,
        backgroundColor: Colors.indigo,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFFE8EAF6), Color(0xFFC5CAE9)],
          ),
        ),
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            ..._gradeControllers.entries.map<Widget>((entry) {
              String gradeName = entry.key;
              TextEditingController controller = entry.value;
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Row(
                  children: [
                    Text(
                      '$gradeName: ',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Expanded(
                      child: TextFormField(
                        controller: controller,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(), //onde voce coloca a nota
                          hintText: 'Digite a nota',
                          filled: true,
                          fillColor: Colors.white,
                          contentPadding: EdgeInsets.symmetric(horizontal: 10),
                        ),
                        onChanged: (value) { //evento
                          //update grades
                          var studentsData = Provider.of<StudentsData>(
                            context,
                            listen: false,
                          );
                          double? gradeValue = double.tryParse(value);
                          if (gradeValue != null) {
                            studentsData.changeGrade(
                              widget.student.name,
                              widget.subject.name,
                              gradeName,
                              gradeValue,
                            );
                          }
                        },
                      ),
                    ),
                  ],
                ),
              );
            }).toList(),
          ],
        ),
      ),
    );
  }
}