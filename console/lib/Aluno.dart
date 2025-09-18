import 'package:console/Disciplina.dart';
import 'package:console/Pessoa.dart';
import 'package:console/Turma.dart';

class Aluno extends Pessoa {
  String curso;
  Turma? turma;
  List<Disciplina> disciplinas = [];
  List<double> notas = [];

  Aluno(String nome, int idade, int matricula, this.curso)
    : super(nome, idade, matricula);

  @override
  String toString() {
    return '${super.toString()}, Curso: $curso, '
        'Turma: ${turma?.nome}, '
        'Disciplinas: ${disciplinas.map((d) => d.nome).join(", ")}, '
        'Notas: ${notas.join(", ")}';
  }
}
