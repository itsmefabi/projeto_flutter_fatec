//import 'package:projeto_flutter_fatec/pages/personagens.dart';
//import 'package:projeto_flutter_fatec/pages/about.dart';
import 'package:projeto_flutter_fatec/pages/page_menu.dart';

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  int selectedIndex = 0;

  final widgetOptions = [
    new MenuPage(),
   // new FornecedorPage(),
  //  new ConfigPage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: widgetOptions.elementAt(selectedIndex),
      ),
    //  bottomNavigationBar: BottomNavigationBar(
      //  items: <BottomNavigationBarItem>[
      //    BottomNavigationBarItem(icon: Icon(Icons.home), label: Text('Home')),
       //   BottomNavigationBarItem(
       //       icon: Icon(Icons.local_shipping), label: Text('Fornecedores')),
       //   BottomNavigationBarItem(
       //       icon: Icon(Icons.local_cafe), label: Text('Produtos')),
      //  ],
       // currentIndex: selectedIndex,
       // fixedColor: Colors.deepPurple,
      //  onTap: onItemTapped,
     // ),
    );
  }

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }
}
