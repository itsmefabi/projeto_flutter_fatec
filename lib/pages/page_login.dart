import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:projeto_flutter_fatec/pages/page_reset_password.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var txtEmail = TextEditingController();
  var txtSenha = TextEditingController();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(
        //title: Text(''),
        //centerTitle: true,
      //  backgroundColor: Colors.black,
     // ),
     //backgroundColor: Colors.black26,
      body: Container(
        padding: EdgeInsets.only(top: 40, left: 40, right: 40, bottom:40 ),
        child: ListView(
          children: <Widget>[
            SizedBox(
              width: 240,
              height: 240,
              child: Image.asset('images/logo_star_trek_01.png'),
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              keyboardType: TextInputType.emailAddress,
              controller: txtEmail,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.email_sharp),
                labelText: "Email",
                labelStyle: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              obscureText: true,
              controller: txtSenha,
              style: TextStyle(
              ),
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.lock_sharp),
                labelText: 'Senha',
                labelStyle: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            Container(
              height: 40,
              alignment: Alignment.centerRight,
              child: TextButton(
                child: Text("Recuperar Senha",
                  style: TextStyle(
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.right,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ResetPasswordPage(),
                    ),
                  );
                },
              ),
            ),
            SizedBox(
              height: 40,
            ),
            SizedBox(
              width: 150,
              child: ElevatedButton(
                style:ElevatedButton.styleFrom(
                  primary: Colors.blue[900], // background BUTTON
                 ),
                child: Text(
                  'Login',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                  textAlign: TextAlign.left,
                ),
                onPressed: () {
                  setState(() {
                    isLoading = true;
                  });
                  login(txtEmail.text, txtSenha.text);
                },
              ),
            ),
            SizedBox(height: 10),
            SizedBox(
              width: 150,
              child: ElevatedButton(
                style:ElevatedButton.styleFrom(
                  primary: Colors.blue[900], // background BUTTON
                 ),
                child: Text(
                  'Create an account',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                  textAlign: TextAlign.left,
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/create_account');
                },
              ),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  //
  // LOGIN com o Firebase Auth
  //
  void login(email, senha) {
    FirebaseAuth.instance.setPersistence(Persistence.SESSION).then((value) {
      FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: senha)
          .then((value) {
        Navigator.pushReplacementNamed(context, '/menu');
      }).catchError((erro) {
        if (erro.code == 'user-not-found') {
          exibirMensagem('ERRO: Usuário não encontrado.');
        } else if (erro.code == 'wrong-password') {
          exibirMensagem('ERRO: A senha digitada está incorreta.');
        } else if (erro.code == 'invalid-email') {
          exibirMensagem('ERRO: Email inválido.');
        } else {
          exibirMensagem('ERRO: ${erro.message}.');
        }
      });
    }).catchError((erro) {
      exibirMensagem('ERRO: ${erro.message}.');
    });
  }
  

  void exibirMensagem(msg) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(msg),
        duration: Duration(seconds: 2),
      ),
    );
  }
}

