import 'package:flutter/material.dart';
class Subject {
  String name;
  Map<String, double> grades;
  Subject({required this.name, required this.grades});

  double average() {
    if (grades.isEmpty) return 0;
    double sum = 0;
    grades.forEach((_, val) => sum += val);
    return sum / grades.length;
  }

  String get status {
    double avg = average();
    if (avg >= 7) {
      return "Aprovado(a)";
    } else if (avg >= 4) {
      return "Final";
    } else {
      return "Reprovado(a)";
    }
  }

  Color get statuscolor {
    //adicionei
    double avg = average();
    if (avg >= 7) {
      return const Color.fromARGB(255, 59, 203, 107);
    } else if (avg >= 4) {
      return const Color.fromARGB(255, 200, 195, 90);
    } else {
      return const Color.fromARGB(255, 212, 60, 60);
    }
  }
}
