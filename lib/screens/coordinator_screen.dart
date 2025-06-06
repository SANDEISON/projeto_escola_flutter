import 'package:flutter/material.dart';
import '../models/teacher.dart';
import '../models/student.dart';
import '../mock_data/mock_users.dart';

class CoordinatorScreen extends StatefulWidget {
  @override
  _CoordinatorScreenState createState() => _CoordinatorScreenState();
}

class _CoordinatorScreenState extends State<CoordinatorScreen> {
  final _teacherNameController = TextEditingController();
  final _teacherSubjectController = TextEditingController();
  final _studentNameController = TextEditingController();
  final _studentAgeController = TextEditingController();

  void _addTeacher() {
    final name = _teacherNameController.text;
    final subject = _teacherSubjectController.text;

    if (name.isNotEmpty && subject.isNotEmpty) {
      setState(() {
        mockTeachers.add(Teacher(name: name, subject: subject));
        _teacherNameController.clear();
        _teacherSubjectController.clear();
      });
    }
  }

  void _addStudent() {
    final name = _studentNameController.text;
    final age = int.tryParse(_studentAgeController.text) ?? 0;

    if (name.isNotEmpty && age > 0) {
      setState(() {
        // Add the required 'subjects' parameter when creating a Student instance
        mockStudents.add(Student(name: name, age: age, subjects: []));
        _studentNameController.clear();
        _studentAgeController.clear();
      });
    }
  }

  Widget _buildTeacherList() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Professores:", style: TextStyle(fontWeight: FontWeight.bold)),
        ...mockTeachers.map((t) => Text("- ${t.name} (${t.subject})")),
      ],
    );
  }

  Widget _buildStudentList() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Alunos:", style: TextStyle(fontWeight: FontWeight.bold)),
        ...mockStudents.map((s) => Text("- ${s.name}, ${s.age} anos")),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Tela da Coordenação")),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Adicionar Professor", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            TextField(controller: _teacherNameController, decoration: InputDecoration(labelText: "Nome")),
            TextField(controller: _teacherSubjectController, decoration: InputDecoration(labelText: "Disciplina")),
            ElevatedButton(onPressed: _addTeacher, child: Text("Adicionar Professor")),
            SizedBox(height: 24),

            Text("Adicionar Aluno", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            TextField(controller: _studentNameController, decoration: InputDecoration(labelText: "Nome")),
            TextField(controller: _studentAgeController, keyboardType: TextInputType.number, decoration: InputDecoration(labelText: "Idade")),
            ElevatedButton(onPressed: _addStudent, child: Text("Adicionar Aluno")),
            SizedBox(height: 24),

            _buildTeacherList(),
            SizedBox(height: 16),
            _buildStudentList(),
          ],
        ),
      ),
    );
  }
}
