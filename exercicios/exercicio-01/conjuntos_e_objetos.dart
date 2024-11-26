class Pessoa {
  String nome;
  int idade;

  Pessoa(this.nome, this.idade);
}

void main() {
  var pessoa = Pessoa('João', 22);
  print(pessoa);
  print(pessoa.nome);
  print(pessoa.idade);
}

