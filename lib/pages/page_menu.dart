import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:projeto_flutter_fatec/pages/lista_personagens.dart';
import 'package:projeto_flutter_fatec/pages/page_about.dart';
//import 'package:projeto_flutter_fatec/pages/page_menu_personagens.dart';

class MenuPage extends StatefulWidget {
  @override
  MenuPageState createState() => MenuPageState();
}

class MenuPageState extends State<MenuPage> {
  ///
  ///
  ///
  ////////////VERIFICAR
  getNomeUsuario(id) async {
    return await FirebaseFirestore.instance
        .collection('usuarios')
        .doc(id)
        .get()
        .then((doc) {
      return doc.get('nome');
    });
  }

////////////VERIFICAR
  ///
  ///
  ///
  Widget titleSection = Container(
      child: Column(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          'menu',
          style: TextStyle(
            color: new Color(0XFF000200),
            fontWeight: FontWeight.bold,
            fontSize: 30.0,
          ),
        ),
      ),
    ],
  ));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // actions: [IconButton(
        //   icon: Icon(Icons.logout, color: Colors.white),
        //   onPressed: () {
        //     Navigator.push(
        //       context,
        //       MaterialPageRoute(
        //         builder: (context) => LoginPage(),
        //       ),
        //     );
        //   },
        // ),
        // ],
        title: Row(
          children: [
            Text('biblioteca trekker'),
            //centerTitle: true,
            //backgroundColor: Theme.of(context).primaryColor

            FutureBuilder(
                future: getNomeUsuario(
                    FirebaseAuth.instance.currentUser!.uid.toString()),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Center(
                      child: Text(
                        snapshot.data.toString(),
                        style: const TextStyle(fontSize: 20),
                      ),
                    );
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                })
          ],
        ),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 20, left: 40, right: 40),
        child: ListView(
          children: [
            titleSection,
            Center(
              child: Padding(
                padding: EdgeInsets.only(top: 60),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  topRight: Radius.circular(10),
                                  bottomLeft: Radius.circular(10),
                                  bottomRight: Radius.circular(10)),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 5,
                                  blurRadius: 7,
                                  offset: Offset(
                                      0, 3), // changes position of shadow
                                ),
                              ],
                            ),
                            child: (SizedBox(
                                width: 128,
                                height: 128,
                                child: InkWell(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              ListaPersonagensPage() //MenuPersonagensPage(),
                                          ),
                                    );
                                  },
                                  child: Container(
                                    child: ClipRRect(
                                      child: Image.asset(
                                        'images/pesonagem_01.png',
                                        width: 128,
                                        height: 128,
                                      ),
                                    ),
                                  ),
                                )))),
                        Text(
                          "personagens",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: new Color(0XFF237F8B),
                            fontSize: 20,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  topRight: Radius.circular(10),
                                  bottomLeft: Radius.circular(10),
                                  bottomRight: Radius.circular(10)),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 5,
                                  blurRadius: 7,
                                  offset: Offset(
                                      0, 3), // changes position of shadow
                                ),
                              ],
                            ),
                            child: (SizedBox(
                                width: 128,
                                height: 128,
                                child: Image.asset('images/naves_01.png')))),
                        Text(
                          "naves",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: new Color(0XFF237F8B),
                            fontSize: 20,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Center(
              child: Padding(
                padding: EdgeInsets.only(top: 60, bottom: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  topRight: Radius.circular(10),
                                  bottomLeft: Radius.circular(10),
                                  bottomRight: Radius.circular(10)),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 5,
                                  blurRadius: 7,
                                  offset: Offset(
                                      0, 3), // changes position of shadow
                                ),
                              ],
                            ),
                            child: (SizedBox(
                                width: 128,
                                height: 128,
                                child: Image.asset('images/planetas_01.png')))),
                        Text(
                          "planetas",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: new Color(0XFF237F8B),
                            fontSize: 20,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  topRight: Radius.circular(10),
                                  bottomLeft: Radius.circular(10),
                                  bottomRight: Radius.circular(10)),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 5,
                                  blurRadius: 7,
                                  offset: Offset(
                                      0, 3), // changes position of shadow
                                ),
                              ],
                            ),
                            child: (SizedBox(
                                width: 128,
                                height: 128,
                                child: Image.asset(
                                    'images/logo_star_trek_02.png')))),
                        Text(
                          "séries e filmes",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: new Color(0XFF237F8B),
                            fontSize: 20,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        color: Colors.white,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        mini: true,
        child: Icon(
          Icons.info_outline,
          color: Colors.white,
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AboutPage(),
            ),
          );
        },
      ),
    );
  }
}
