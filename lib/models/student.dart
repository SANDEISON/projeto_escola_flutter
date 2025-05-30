import 'subject.dart';

class Student {
  final String name;
  final int age;

  List<Subject> subjects;
  Student({required this.name, required this.age, required this.subjects});

  double averageGrade() {
    //calculo da media geral, no futuro adicionar um texto que diz se o aluno ficou em alguma ou passou direto, etc
    double total = 0;
    int count = 0;
    for (var sub in subjects) {
      total += sub.average();
      count++;
    }
    return count == 0 ? 0 : total / count;
  }

  String get status {
    //adicionei
    double avg = averageGrade();
    if (avg >= 7) {
      return "Passou em todas as materias(a)";
    } else if (avg >= 4) {
      return "Recuperação em alguma(s) materia(s))";
    } else {
      return "Reprovado(a) em alguma(s) materia(s)";
    }
  }
}
