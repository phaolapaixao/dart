import 'dart:io';
import 'package:console/Aluno.dart';
import 'package:console/Professor.dart';
import 'package:console/Coordenador.dart';
import 'package:console/data.dart';

void alunoMenu() {
  if (alunos.isEmpty) {
    print("Nenhum aluno cadastrado.");
    return;
  }
  print("Digite sua matrícula:");
  var matriculaInput = stdin.readLineSync();
  var matricula = int.tryParse(matriculaInput ?? '');

  Aluno? aluno;
  try {
    aluno = alunos.firstWhere((a) => a.matricula == matricula);
  } catch (e) {
    print("Aluno não encontrado!");
    return;
  }

  while (true) {
    print("\n===== MENU ALUNO =====");
    print("1. Abrir Boletim");
    print("2. Meus Dados");
    print("3. Disciplinas");
    print("0. Sair");
    var opcao = stdin.readLineSync();

    switch (opcao) {
      case '1':
        print("Abrir Boletim:");
        if (aluno.notas.isNotEmpty) {
          for (var nota in aluno.notas) {
            print("Nota: ${nota}");
          }
        } else {
          print("Nenhuma nota registrada.");
        }
        break;

      case '2':
        print("Meus dados:");
        print("Nome: ${aluno.nome}");
        print("Idade: ${aluno.idade}");
        print("Matrícula: ${aluno.matricula}");
        print("Curso: ${aluno.curso}");
        break;

      case '3':
        print("Disciplinas:");
        if (disciplinas.isNotEmpty) {
          for (var disciplina in disciplinas) {
            print(" - ${disciplina.nome}");
          }
        } else {
          print("Nenhuma disciplina cadastrada.");
        }
        break;

      case '0':
        return perfil();

      default:
        print("Opção inválida. Tente novamente.");
    }
  }
}

void professorMenu() {
  if (professores.isEmpty) {
    print("Nenhum professor cadastrado!");
    return;
  }

  print("Digite sua matrícula:");
  var matriculaInput = stdin.readLineSync();
  var matricula = int.tryParse(matriculaInput ?? '');

  Professor? professor;
  try {
    professor = professores.firstWhere((p) => p.matricula == matricula);
  } catch (e) {
    print("Professor não encontrado!");
    return;
  }

  while (true) {
    print("===== MENU PROFESSOR =====");
    print("1. Minhas Disciplinas");
    print("2. Meus Dados");
    print("3. Lançar Notas");
    print("0. Sair");

    var opcao = stdin.readLineSync();
    switch (opcao) {
      case '1':
        professor.visualizarDisciplinas();
        break;
      case '2':
        professor.visualizarMeusDados();
        break;
      case '3':
        professor.lancarNotas();
        break;
      case '0':
        return;
      default:
        print("Opção inválida.");
    }
  }
}

void perfil() {
  while (true) {
    print("Selecione seu perfil:");
    print("1. Aluno");
    print("2. Professor");
    print("3. Coordenador");
    print("4. Sair");

    var opcao = stdin.readLineSync();

    switch (opcao) {
      case '1':
        alunoMenu();
        break;
      case '2':
        professorMenu();
        break;
      case '3':
        var coord = Coordenador();
        coord.coordenador();
        break;
      case '4':
        return;
      default:
        print("Opção inválida. Tente novamente.");
    }
  }
}

void main() {
  perfil();
}
