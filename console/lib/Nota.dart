import 'package:console/Disciplina.dart';

class Nota {
  double nota;
  Disciplina disciplina;

  Nota(this.nota, this.disciplina);
  @override
  String toString() {
    return 'Nota: $nota, Disciplina: $disciplina';
  }
}
