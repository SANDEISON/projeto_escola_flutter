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
}
