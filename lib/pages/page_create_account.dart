import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class CreateAccountPage extends StatefulWidget {
  const CreateAccountPage({Key? key}) : super(key: key);

  @override
  _CreateAccountPageState createState() => _CreateAccountPageState();
}

class _CreateAccountPageState extends State<CreateAccountPage> {
  var txtNome = TextEditingController();
  var txtEmail = TextEditingController();
  var txtSenha = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('criar cadastro'),
          centerTitle: true,
          backgroundColor: Colors.black),
      backgroundColor: Colors.brown[50],
      body: Container(
        padding: EdgeInsets.all(50),
        child: ListView(
          children: [
            TextField(
              controller: txtNome,
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w300,
              ),
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.person),
                labelText: 'Nome',
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: txtEmail,
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w300,
              ),
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.email),
                labelText: 'Email',
              ),
            ),
            SizedBox(height: 20),
            TextField(
              obscureText: true,
              controller: txtSenha,
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w300,
              ),
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.lock),
                labelText: 'Senha',
              ),
            ),
            SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 150,
                  child: OutlinedButton(
                    child: Text('criar'),
                    onPressed: () {
                      createAccount(
                        txtNome.text,
                        txtEmail.text,
                        txtSenha.text,
                      );
                    },
                  ),
                ),
                 SizedBox(
                  width: 150,
                  child: OutlinedButton(
                    child: Text('cancelar'),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
              ],
            ),
            SizedBox(height: 60),
          ],
        ),
      ),
    );
  }

  //
  // CRIAR CONTA no Firebase Auth
  //
  void createAccount(nome, email, senha) {

    FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: senha)
        .then((value) {
            exibirMensagem('Usuário criado com sucesso!');
            Navigator.pop(context);
        }).catchError((erro){
          if (erro.code == 'email-already-in-use'){
            exibirMensagem('ERRO: O email informado está em uso.');
          }else if (erro.code == 'invalid-email'){
            exibirMensagem('ERRO: Email inválido.');
          }else{
            exibirMensagem('ERRO: ${erro.message}');
          }
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