# Sistema Acadêmico em Dart

Este é um projeto em **Dart** que simula um sistema acadêmico simples, permitindo o cadastro e gerenciamento de **alunos**, **professores**, **disciplinas** e **turmas**. Ele utiliza menus interativos no terminal para facilitar a navegação entre os diferentes perfis.

---

## Funcionalidades

### Coordenador
- Cadastrar alunos, professores, turmas e disciplinas.
- Associar alunos a turmas e disciplinas.
- Acompanhar todos os registros do sistema.

### Aluno
- Visualizar boletim (notas).
- Consultar seus dados pessoais.
- Visualizar suas disciplinas.

### Professor
- Visualizar suas disciplinas.
- Consultar seus dados pessoais.
- Lançar notas para os alunos.

---

## Estrutura do Projeto

- `bin/console.dart` → Arquivo principal com os menus de navegação.
- `lib/Aluno.dart` → Classe `Aluno`.
- `lib/Professor.dart` → Classe `Professor`.
- `lib/Disciplina.dart` → Classe `Disciplina`.
- `lib/Turma.dart` → Classe `Turma`.
- `lib/Pessoa.dart` → Classe base `Pessoa`.
- `lib/Coordenador.dart` → Classe `Coordenador` com funções de cadastro.
- `lib/data.dart` → Listas globais compartilhadas (`alunos`, `professores`, `disciplinas`, `turmas`).

---

## Pré-requisitos

- Dart SDK instalado: [https://dart.dev/get-dart](https://dart.dev/get-dart)
- Editor de código recomendado: VS Code

---

## Como Executar

1. Clone o repositório ou baixe os arquivos.
2. Abra o terminal na pasta do projeto.
3. Execute o comando:

```bash
dart run bin/console.dart
