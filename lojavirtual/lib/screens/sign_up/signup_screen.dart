import 'package:flutter/material.dart';
import 'package:lojavirtual/helpers/validators.dart';
import 'package:lojavirtual/models/user_manager.dart';
import 'package:lojavirtual/models/users.dart';
import 'package:provider/provider.dart';

class SignUpScreen extends StatelessWidget {
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  final Users user = Users();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: const Text('Criar Conta'),
        centerTitle: true,
      ),
      body: Center(
        child: Card(
          margin: const EdgeInsets.symmetric(horizontal: 16),
          child: Form(
            key: formkey,
            child: ListView(
              padding: EdgeInsets.all(16),
              shrinkWrap: true,
              children: <Widget>[
                TextFormField(
                  decoration: const InputDecoration(hintText: 'Nome Completo'),
                  validator: (name) {
                    if (name.isEmpty)
                      return 'Campo Obrigatório';
                    else if (name.trim().split(' ').length <= 1)
                      return 'Preencha com o seu nome completo';
                    return null;
                  },
                  onSaved: (name) => user.name = name,
                ),
                const SizedBox(height: 16),
                TextFormField(
                  decoration: const InputDecoration(hintText: 'E-mail'),
                  keyboardType: TextInputType.emailAddress,
                  autocorrect: false,
                  validator: (email) {
                    if (email.isEmpty) {
                      return 'Campo obrigatório';
                    } else if (!emailValid(email)) {
                      return 'E-mail inválido';
                    }
                    return null;
                  },
                  onSaved: (email) => user.email = email,
                ),
                const SizedBox(height: 16),
                TextFormField(
                  decoration: const InputDecoration(hintText: 'Senha'),
                  autocorrect: false,
                  obscureText: true,
                  validator: (password) {
                    if (password.isEmpty)
                      return 'Entre a sua senha';
                    else if (password.length < 6) return 'Senha muito curta';
                    return null;
                  },
                  onSaved: (password) => user.password = password,
                ),
                const SizedBox(height: 16),
                TextFormField(
                  decoration: const InputDecoration(hintText: 'Repita a senha'),
                  autocorrect: false,
                  obscureText: true,
                  validator: (passwordagain) {
                    if (passwordagain.isEmpty)
                      return 'Entre a sua senha';
                    else if (passwordagain.length < 6)
                      return 'Senha muito curta';
                    return null;
                  },
                  onSaved: (passwordagain) =>
                      user.confirmpassword = passwordagain,
                ),
                SizedBox(
                  height: 44,
                  child: ElevatedButton(
                      child: Text('Criar Conta'),
                      onPressed: () {
                        if (formkey.currentState.validate()) {
                          formkey.currentState.save();
                          if (user.password != user.confirmpassword) {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text("Senhas não coincidem"),
                              backgroundColor: Colors.red,
                            ));
                            return;
                          }
                          context.read<UserManager>().signUp(
                                user: user,
                                onFail: (e) {
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(SnackBar(
                                    content: Text("Falha ao cadastrar: $e"),
                                    backgroundColor: Colors.red,
                                  ));
                                },
                                onSuccess: () {
                                  Navigator.of(context).pop();
                                },
                              );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Color.fromARGB(255, 4, 125, 141),
                        textStyle: TextStyle(fontSize: 18),
                      )),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
