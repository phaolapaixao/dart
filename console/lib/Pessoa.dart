class Pessoa {
  String nome;
  int idade;
  int matricula;

  Pessoa(this.nome, this.idade, this.matricula);

  @override
  String toString() {
    return 'Nome: $nome, Idade: $idade, Matrícula: $matricula';
  }
}
