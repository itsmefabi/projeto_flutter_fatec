class Nave {

  String nome;
  String descricao;
  
  Nave(this.nome,this.descricao);

  //Converter a resposta da API em um objeto da classe Nave
Nave.fromJson(Map json):
    nome = json['nome'],
    descricao = json['descricao'].toString();
}