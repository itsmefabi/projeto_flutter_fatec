
// ignore_for_file: unused_import

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:projeto_flutter_fatec/pages/lista_personagens.dart';
import 'package:projeto_flutter_fatec/pages/page_create_account.dart';
import 'package:projeto_flutter_fatec/pages/page_login.dart';
import 'package:flutter/material.dart';
import 'package:projeto_flutter_fatec/pages/page_menu.dart';
import 'package:projeto_flutter_fatec/pages/registration.dart';

//import 'create_account.dart';
//import 'login.dart';

Future<void> main() async {
//
// INICIALIZAÇÃO DOS Plugins
//
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      primaryColor: Colors.black, 
      fontFamily: 'star_trek_classic',
      textTheme: TextTheme().apply(bodyColor: Colors.black)
    ),
    initialRoute: '/login',
    routes: {
      '/login': (context) => LoginPage(),
      '/create_account': (context) => CreateAccountPage(),
      //'/principal': (context) => PrincipalPage(),
      '/menu': (context) => MenuPage(),
      '/registration': (context) => RegistrationPage(),
      //'/about': (context) => AboutPage()
      '/lista_personagens': (context) => ListaPersonagensPage()
    },
  ));
}



////
// ///USUARIO
// ///

// class UsuarioPage extends StatefulWidget {
//   const UsuarioPage({ Key? key }) : super(key: key);

//   @override
//   _UsuarioPageState createState() => _UsuarioPageState();
// }

// class _UsuarioPageState extends State<UsuarioPage> {

//   getNomeUsuario(id) async{
//   return await FirebaseFirestore.instance
//   .collection('usuarios')
//   .doc(id)
//   .get()
//   .then((doc){
//     return doc.get('nome');
//       });
// }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
      
//     );
//   }
// }