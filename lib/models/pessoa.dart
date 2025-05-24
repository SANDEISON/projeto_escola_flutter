class Pessoa {
  String nome;
  Pessoa(this.nome);
}

class Aluno extends Pessoa {
  String matricula;
  String curso;

  Aluno({required String nome, required this.matricula, required this.curso})
    : super(nome);
}

class Professor extends Pessoa {
  String id;
  String materia;

  Professor({required String nome, required this.id, required this.materia})
    : super(nome);
}
