import 'package:console/Disciplina.dart';
import 'package:console/Pessoa.dart';
import 'dart:io';
import 'package:console/data.dart';

class Professor extends Pessoa {
  List<Disciplina> disciplinas;

  Professor(String nome, int idade, int matricula, this.disciplinas)
    : super(nome, idade, matricula);

  @override
  String toString() {
    var nomes = disciplinas.map((d) => d.nome).join(', ');
    return '${super.toString()}, Disciplinas: $nomes';
  }

  void visualizarDisciplinas() {
    if (disciplinas.isEmpty) {
      print("Nenhuma disciplina atribuída.");
    } else {
      print("Disciplinas atribuídas:");
      for (var disciplina in disciplinas) {
        print("- ${disciplina.nome} (${disciplina.cargaHoraria} horas)");
      }
    }
  }

  void lancarNotas() {
    if (turmas.isEmpty) {
      print("Nenhuma turma cadastrada.");
      return;
    }
    print("Selecione a turma:");
    for (var i = 0; i < turmas.length; i++) {
      print("${i + 1}. ${turmas[i].nome}");
    }
    var turmaIndex = int.tryParse(stdin.readLineSync() ?? '');
    if (turmaIndex == null || turmaIndex < 1 || turmaIndex > turmas.length) {
      print("Turma inválida.");
      return;
    }
    var turmaSelecionada = turmas[turmaIndex - 1];

    if (disciplinas.isEmpty) {
      print("Nenhuma disciplina cadastrada.");
      return;
    }
    print("Selecione a disciplina:");
    for (var i = 0; i < disciplinas.length; i++) {
      print("${i + 1}. ${disciplinas[i].nome}");
    }
    var disciplinaIndex = int.tryParse(stdin.readLineSync() ?? '');
    if (disciplinaIndex == null ||
        disciplinaIndex < 1 ||
        disciplinaIndex > disciplinas.length) {
      print("Disciplina inválida.");
      return;
    }
    var disciplinaSelecionada = disciplinas[disciplinaIndex - 1];

    if (alunos.isEmpty) {
      print("Nenhum aluno cadastrado.");
      return;
    }
    print("Selecione o aluno:");
    for (var i = 0; i < alunos.length; i++) {
      print("${i + 1}. ${alunos[i].nome}");
    }
    var alunoIndex = int.tryParse(stdin.readLineSync() ?? '');
    if (alunoIndex == null || alunoIndex < 1 || alunoIndex > alunos.length) {
      print("Aluno inválido.");
      return;
    }
    var alunoSelecionado = alunos[alunoIndex - 1];

    print("Digite a nota:");
    var notaInput = stdin.readLineSync() ?? '';
    var nota = double.tryParse(notaInput);
    if (nota == null || nota < 0 || nota > 10) {
      print("Nota inválida. Digite entre 0 e 10.");
      return;
    }

    // Adiciona a nota do aluno
    alunoSelecionado.notas.add(nota);
    print(
      "Nota adicionada com sucesso para ${alunoSelecionado.nome} na disciplina ${disciplinaSelecionada.nome}!",
    );
  }

  void visualizarMeusDados() {
    print("Nome: $nome");
    print("Idade: $idade");
    print("Matrícula: $matricula");
    print("Disciplinas: ${disciplinas.map((d) => d.nome).join(", ")}");
  }

  void professor() {
    while (true) {
      print("1. Minhas Disciplinas");
      print("2. Meus Dados");
      print("3. Lançar Notas");
      print("4. Sair");

      var opcao = stdin.readLineSync();

      switch (opcao) {
        case '1':
          print("Minhas Disciplinas:");
          visualizarDisciplinas();
          break;

        case '2':
          print("Meus dados:");
          visualizarMeusDados();
          break;

        case '3':
          print("Lançar Notas:");
          lancarNotas();
          break;

        case '4':
          return;

        default:
          print("Opção inválida. Tente novamente.");
      }
    }
  }
}
