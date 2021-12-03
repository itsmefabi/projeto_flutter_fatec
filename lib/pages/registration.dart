import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({Key? key}) : super(key: key);

  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  var txtNome = TextEditingController();
  var txtDescricao = TextEditingController();

  //
  // RETORNAR um ÚNICO DOCUMENTO a partir do ID
  //
  getDocumentById(id) async {
    await FirebaseFirestore.instance
        .collection('personagens')
        .doc(id).get().then((doc) {
          txtNome.text = doc.get('nome');
          txtDescricao.text = doc.get('descricao');
    });
  }

  @override
  Widget build(BuildContext context) {
    //
    // RECUPERAR o ID do Personagem que foi selecionado pelo usuário
    //
    var id = ModalRoute.of(context)?.settings.arguments;

    if (id != null) {
      if (txtNome.text.isEmpty && txtDescricao.text.isEmpty) {
        getDocumentById(id);
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('cadastrar personagem'),
        centerTitle: true,
        backgroundColor: Colors.black,
        automaticallyImplyLeading: false,
      ),
      //backgroundColor: Colors.blue, //cor fundo tela
      
      body: Container(
        
        padding: EdgeInsets.all(30),
        child: ListView(children: [
        
          TextField(
            controller: txtNome,
            style: TextStyle(color: Colors.amber[800], fontSize: 20),
            decoration: InputDecoration(
              labelText: 'nome',
              labelStyle: TextStyle(color: Colors.black,  fontSize: 16
              ),
            ),
          ),
          SizedBox(height: 30),
          TextField(
            controller: txtDescricao,
            style: TextStyle(color: Colors.amber[800], fontSize: 20),
            decoration: InputDecoration(
              labelText: 'escreva sobre a personagem',
              labelStyle: TextStyle(color: Colors.black,fontSize: 16),
            ),
          ),
          SizedBox(height: 50),
          Row(
  
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                padding: EdgeInsets.all(5),
                width: 150,
                child: OutlinedButton(
                  child: Text("salvar",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                          ),),
                  onPressed: () {

                    if (id == null) {
                      //
                      // ADICIONAR um NOVO DOCUMENTO
                      //
                      FirebaseFirestore.instance.collection('personagens').add({
                        'nome': txtNome.text,
                        'descricao': txtDescricao.text,
                      });
                    } else {
                      //
                      // ATUALIZAR UM DOCUMENTO EXISTENTE
                      //
                      FirebaseFirestore.instance.collection('personagens').doc(id.toString()).set({
                        'nome': txtNome.text,
                        'descricao': txtDescricao.text,
                      });
                    }

                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Operação realizada com sucesso!'),
                        duration: Duration(seconds: 2),
                      ),
                    );
                    Navigator.pop(context);

                  },
                ),
              ),
              Container(
                padding: EdgeInsets.all(5),
                width: 150,
                child: OutlinedButton(
                  child: Text("cancelar",
                  style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                          ),),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
            ],
          ),
        ]),
      ),
    );
  }
}
