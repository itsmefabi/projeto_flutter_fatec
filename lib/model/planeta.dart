class Personagem {

  String nome;
  String descricao;
  
  Personagem(this.nome,this.descricao);

  //Converter a resposta da API em um objeto da classe personagem
Personagem.fromJson(Map json):
    nome = json['nome'],
    descricao = json['descricao'].toString();
}