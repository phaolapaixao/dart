class Turma {
  String id;
  String nome;
  String descricao;

  Turma({required this.id, required this.nome, required this.descricao});
  @override
  String toString() {
    return 'Turma: $nome, Descrição: $descricao';
  }
}
