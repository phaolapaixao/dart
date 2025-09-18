import 'dart:io';
import 'package:console/Aluno.dart';
import 'package:console/Turma.dart';
import 'package:console/Professor.dart';
import 'package:console/Disciplina.dart';
import 'package:console/data.dart';

class Coordenador {
  void cadastrarAluno() {
    print("Cadastrar Aluno:");
    print("Digite o nome do aluno:");
    var nome = stdin.readLineSync() ?? '';
    print("Digite a idade do aluno:");
    var idade = int.tryParse(stdin.readLineSync() ?? '') ?? 0;
    print("Digite a matrícula do aluno:");
    var matricula = int.tryParse(stdin.readLineSync() ?? '') ?? 0;
    print("Digite o curso do aluno:");
    var curso = stdin.readLineSync() ?? '';
    print("Selecione a turma:");
    if (turmas.isNotEmpty) {
      for (var turma in turmas) {
        print("- ${turma.nome}");
      }
    } else {
      print("Nenhuma turma cadastrada.");
    }
    var turmaSelecionada = stdin.readLineSync() ?? '';
    print("Selecione a disciplina:");
    if (disciplinas.isNotEmpty) {
      for (var disciplina in disciplinas) {
        print(" - ${disciplina.nome}");
      }
    } else {
      print("Nenhuma disciplina cadastrada.");
    }

    var disciplinaSelecionada = stdin.readLineSync() ?? '';
    var turma = turmas.firstWhere(
      (t) => t.nome == turmaSelecionada,
      orElse: () => Turma(id: '0', nome: 'Desconhecida', descricao: ''),
    );
    var disciplina = disciplinas.firstWhere(
      (d) => d.nome == disciplinaSelecionada,
      orElse: () => Disciplina('Desconhecida', 0),
    );
    var aluno = Aluno(nome, idade, matricula, curso);
    aluno.turma = turma;
    aluno.disciplinas = disciplinas.isNotEmpty ? [disciplina] : [];

    alunos.add(aluno);

    print("Aluno cadastrado com sucesso!");
  }

  void cadastrarTurma() {
    print("Cadastrar Turma:");
    print("Digite o nome da turma:");
    var nomeTurma = stdin.readLineSync() ?? '';
    print("Digite a descrição da turma:");
    var descricaoTurma = stdin.readLineSync() ?? '';
    turmas.add(
      Turma(
        id: (turmas.length + 1).toString(),
        nome: nomeTurma,
        descricao: descricaoTurma,
      ),
    );
    print("Turma cadastrada com sucesso!");
  }

  void cadastrarProfessor() {
    print("Cadastrar Professor:");
    print("Digite o nome do professor:");
    var nomeProf = stdin.readLineSync() ?? '';
    print("Digite a idade do professor:");
    var idadeProf = int.tryParse(stdin.readLineSync() ?? '') ?? 0;
    print("Digite a matrícula do professor:");
    var matriculaProf = int.tryParse(stdin.readLineSync() ?? '') ?? 0;

    if (disciplinas.isEmpty) {
      print(
        "Nenhuma disciplina cadastrada. Cadastre disciplinas antes de criar um professor.",
      );
      return;
    }

    List<Disciplina> disciplinasSelecionadas = [];
    while (true) {
      print("Selecione a disciplina (ou 0 para finalizar):");
      for (var i = 0; i < disciplinas.length; i++) {
        print("${i + 1}. ${disciplinas[i].nome}");
      }
      var input = stdin.readLineSync() ?? '';
      if (input == '0') break;

      var index = int.tryParse(input);
      if (index != null && index > 0 && index <= disciplinas.length) {
        disciplinasSelecionadas.add(disciplinas[index - 1]);
      } else {
        print("Opção inválida.");
      }
    }

    if (disciplinasSelecionadas.isEmpty) {
      print("Nenhuma disciplina selecionada. Professor não cadastrado.");
      return;
    }

    professores.add(
      Professor(nomeProf, idadeProf, matriculaProf, disciplinasSelecionadas),
    );
    print("Professor cadastrado com sucesso!");
  }

  void cadastrarDisciplina() {
    print("Cadastrar Disciplina:");
    print("Digite o nome da disciplina:");
    var nomeDisciplina = stdin.readLineSync() ?? '';
    print("Digite a carga horária da disciplina:");
    var cargaHoraria = int.tryParse(stdin.readLineSync() ?? '') ?? 0;
    disciplinas.add(Disciplina(nomeDisciplina, cargaHoraria));
    print("Disciplina cadastrada com sucesso!");
  }

  void coordenador() {
    while (true) {
      print("1. Cadastrar Aluno");
      print("2. Cadastrar Turma");
      print("3. Cadastrar Professor");
      print("4. Cadastrar Disciplina");
      print("5. Sair");
      var opcao = stdin.readLineSync();

      switch (opcao) {
        case '1':
          cadastrarAluno();
          break;
        case '2':
          cadastrarTurma();
          break;

        case '3':
          cadastrarProfessor();
          break;

        case '4':
          cadastrarDisciplina();
          break;

        case '5':
          return;

        default:
          print("Opção inválida. Tente novamente.");
      }
    }
  }
}
