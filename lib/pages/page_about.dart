import 'package:flutter/material.dart';
import 'package:projeto_flutter_fatec/pages/page_menu.dart';

// ignore: must_be_immutable
class AboutPage extends StatelessWidget {
  Widget titleSection = Container(
      child: Column(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        // child: Text(
        //   'Informações sobre o projeto',
        //   style: TextStyle(
        //     color: new Color(0XFF000200),
        //     fontWeight: FontWeight.bold,
        //     fontSize: 25.0,
        //   ),
        // ),
      ),
    ],
  ));
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //CORRIGIR
          leading: IconButton(
            icon: Icon(Icons.home, color: Colors.white),
            onPressed: () {
               Navigator.push(
              context,
               MaterialPageRoute(
               builder: (context) => MenuPage(),
               ),
              );
            },
          ),
          title: Text(''),
          centerTitle: true,
          backgroundColor: Theme.of(context).primaryColor),
      body: Container(
        padding: EdgeInsets.only(
          left: 20,
          right: 20,
        ),
        child: ListView(
          children: [
            titleSection,
            Container(
              //padding: EdgeInsets.all(60),
              child: Column(
                children: [
                  Text(
                    'Star Trek',
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text('biblioteca trekker',
                      style: TextStyle(
                        fontSize: 14,
                      )),
                  SizedBox(
                    height: 50,
                  ),
                  Text(
                      "   Projeto prático desenvolvido na disciplina Programação para Dispositivos Móveis.\n"
                      "   O aplicativo tem como objetivo mostrar um pouco sobre Jornada nas Estrelas.\n" 
                      "   A franquia foi criada em 1966 por Gene Roddenberry.",
                     // textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'RobotoRegular',
                        fontSize: 16,   
                      )),
                 
                  SizedBox(
                    height: 50,
                  ),
                ],
              ),
    
            ),
            Container(
              child:Column(
                children: <Widget>[
                 Text(
                    'Desenvolvido por: ',
                    style: TextStyle(
                      color: new Color(0XFFFF8F00),
                      fontSize: 26,
                      fontWeight: FontWeight.bold,  
                    ),
                  ),
                  Text('Fabiola Gonçalves',
                      style: TextStyle(
                        fontSize: 16,
                      )),
                      SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                      width: 128,
                      height: 128,
                      child: Image.asset(
                        'images/me.png',
                      )),
                  ]
              ),
            ),
             Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                   Text('vida longa e próspera ',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                      textAlign: TextAlign.left,
                    ),
                     Container(
                        child: SizedBox(
                          child: Image.asset('images/salute_vulcan.png'),
                          height: 28,
                          width: 28,
                        ),
                      )
                ],
              ),
             )
          ],
        ),
      ),
    );
  }
}
