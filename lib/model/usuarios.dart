class Usuarios {
  String id;
  String nome;
  //String descricao;
  //var imagem;

  Usuarios(this.id, this.nome);

  //Converter a resposta da API em um objeto da classe Usuarios
  Usuarios.fromJson(Map json)
      : id = json['id'],
        nome = json['nome'].toString();
}
