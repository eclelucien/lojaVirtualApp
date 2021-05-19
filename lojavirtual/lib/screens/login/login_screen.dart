import 'package:flutter/material.dart';
import 'package:lojavirtual/helpers/validators.dart';
import 'package:lojavirtual/models/user_manager.dart';
import 'package:lojavirtual/models/users.dart';
import 'package:provider/provider.dart';

class Login extends StatelessWidget {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Entrar'),
        centerTitle: true,
      ),
      body: Center(
          child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 16),
        child: Form(
            key: formKey,
            child: ListView(
              padding: EdgeInsets.all(16),
              shrinkWrap: true,
              children: <Widget>[
                TextFormField(
                  controller: emailController,
                  decoration: const InputDecoration(hintText: 'E-mail'),
                  keyboardType: TextInputType.emailAddress,
                  autocorrect: false,
                  validator: (email) {
                    if (!emailValid(email)) return 'E-mail Invalido';
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: passwordController,
                  decoration: const InputDecoration(hintText: 'Senha'),
                  autocorrect: false,
                  obscureText: true,
                  validator: (pass) {
                    if (pass.isEmpty || pass.length < 6)
                      return 'senha invalida';
                    return null;
                  },
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    child: Text('Esqueci minha senha'),
                    onPressed: () {},
                    style: TextButton.styleFrom(
                      primary: Colors.black,
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                SizedBox(
                  height: 44,
                  child: ElevatedButton(
                      child: Text('Entar'),
                      onPressed: () {
                        if (formKey.currentState.validate()) {
                          context.read<UserManager>().signIn(Users(
                                email: emailController.text,
                                password: passwordController.text,
                              ));
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Color.fromARGB(255, 4, 125, 141),
                        textStyle: TextStyle(fontSize: 18),
                      )),
                )
              ],
            )),
      )),
    );
  }
}
