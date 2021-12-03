import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:projeto_flutter_fatec/pages/page_menu.dart';


class ListaPersonagensPage extends StatefulWidget {
  const ListaPersonagensPage({Key? key}) : super(key: key);

  @override
  _ListaPersonagensPageState createState() => _ListaPersonagensPageState();
}

class _ListaPersonagensPageState extends State<ListaPersonagensPage> {

  //Referenciar a coleção do Firestore
  // ignore: prefer_typing_uninitialized_variables
  late CollectionReference personagens;

  @override
  void initState(){
    super.initState();

    personagens = FirebaseFirestore.instance.collection('personagens');

  }

  //
  // Especificar a aparência de cada elemento da List
  //
  exibirItemColecao(item){

    String nome = item.data()['nome'];
    String descricao = item.data()['descricao'];

    return ListTile(
      title: Text(nome, style: const TextStyle(fontSize: 30),),
      subtitle: Text(descricao, style: const TextStyle(fontSize: 26),),
      trailing: IconButton(
        icon: const Icon(Icons.delete),
        onPressed: (){
          //
          // APAGAR um documento
          //
          personagens.doc(item.id).delete();
        },
      ),

      onTap: (){
        Navigator.pushNamed(context, '/cadastro', arguments: item.id);
      },


    );

  }



  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('personagem'),
        centerTitle: true,
        backgroundColor: Colors.black,
        automaticallyImplyLeading: false,

       leading: (
          IconButton(
            icon: Icon(Icons.home, color: Colors.white),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MenuPage(),
                ),
              );
            },
          )
       ),
      ),
     // backgroundColor: Colors.<COR>, //Cor fundo SCAFFOLD

      //
      // LISTAR os documentos da COLEÇÃO
      //
      body: StreamBuilder<QuerySnapshot>(
        //fonte de dados (coleção)
        stream: personagens.snapshots(),

        //EXIBIR os dados retornados
        builder: (context, snapshot){

          //verificar o estado da conexão - Firestore
          switch(snapshot.connectionState){

            case ConnectionState.none:
              return const Center(child: Text('Sem conexão'),);

            case ConnectionState.waiting:
              return const Center(child: CircularProgressIndicator(),);

            //se os dados foram recebidos com sucesso
            default:
              final dados = snapshot.requireData;
              return ListView.builder(
                itemCount: dados.size,
                itemBuilder: (context, index){

                  //Metodo
                  return exibirItemColecao(dados.docs[index]);
                }
              );

          }


        }

      ),


      floatingActionButton: FloatingActionButton(
        mini: true,
        foregroundColor: Colors.white,
        backgroundColor: Colors.black,
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.pushNamed(context, '/registration');
        },
      ),

    );
  }
}

