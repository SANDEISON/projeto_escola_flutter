import '../models/user.dart';
import '../models/student.dart';
import '../models/teacher.dart';
import '../models/classroom.dart';
import '../models/subject.dart';

List<User> mockUsers = [
  User(username: 'admin', password: '1234', role: UserRole.admin),
  User(username: 'coordenador', password: '1234', role: UserRole.coordinator),
  User(username: 'professor', password: '1234', role: UserRole.teacher),
  User(username: 'aluno', password: '1234', role: UserRole.student),
];

List<Teacher> mockTeachers = [];

List<Student> mockStudents = [
  Student(
    name: "João",
    age: 16,
    subjects: [
      Subject(name: "Matemática", grades: {"AV1": 8.5, "AV2": 7.0}),
      Subject(name: "História", grades: {"AV1": 7.5, "AV2": 8.0}),
      Subject(name: "Português", grades: {"AV1": 6.0, "AV2": 5.5}),
      Subject(name: "Ciências", grades: {"AV1": 7.0, "AV2": 6.5}),
      Subject(name: "Geografia", grades: {"AV1": 8.0, "AV2": 7.5}),
    ],
  ),
  Student(
    name: "Maria",
    age: 15,
    subjects: [
      Subject(name: "Matemática", grades: {"AV1": 9.0, "AV2": 8.5}),
      Subject(name: "História", grades: {"AV1": 8.0, "AV2": 7.5}),
      Subject(name: "Português", grades: {"AV1": 7.5, "AV2": 6.0}),
      Subject(name: "Ciências", grades: {"AV1": 8.5, "AV2": 8.0}),
      Subject(name: "Geografia", grades: {"AV1": 7.0, "AV2": 7.5}),
    ],
  ),
  Student(
    name: "Carlos",
    age: 17,
    subjects: [
      Subject(name: "Matemática", grades: {"AV1": 5.0, "AV2": 4.5}),
      Subject(name: "História", grades: {"AV1": 6.0, "AV2": 5.5}),
      Subject(name: "Português", grades: {"AV1": 6.0, "AV2": 5.0}),
      Subject(name: "Ciências", grades: {"AV1": 5.5, "AV2": 6.0}),
      Subject(name: "Geografia", grades: {"AV1": 6.5, "AV2": 6.0}),
    ],
  ),
  Student(
    name: "Ana",
    age: 16,
    subjects: [
      Subject(name: "Matemática", grades: {"AV1": 7.5, "AV2": 8.0}),
      Subject(name: "História", grades: {"AV1": 8.5, "AV2": 9.0}),
      Subject(name: "Português", grades: {"AV1": 9.0, "AV2": 8.5}),
      Subject(name: "Ciências", grades: {"AV1": 8.0, "AV2": 7.5}),
      Subject(name: "Geografia", grades: {"AV1": 7.5, "AV2": 8.0}),
    ],
  ),
];

List<Classroom> mockClassrooms = [
  Classroom(name: "Turma A", studentNames: ["João", "Maria"]),
  Classroom(name: "Turma B", studentNames: ["Carlos", "Ana"]),
];
