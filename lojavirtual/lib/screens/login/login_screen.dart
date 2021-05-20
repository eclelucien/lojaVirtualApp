import 'package:flutter/material.dart';
import 'package:lojavirtual/helpers/validators.dart';
import 'package:lojavirtual/models/user_manager.dart';
import 'package:lojavirtual/models/users.dart';
import 'package:provider/provider.dart';

class Login extends StatelessWidget {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: const Text('Entrar'),
        centerTitle: true,
        actions: <Widget>[
          TextButton(
            child: Text('CRIAR CONTA'),
            onPressed: () {
              Navigator.of(context).pushReplacementNamed('/signup');
            },
            style: TextButton.styleFrom(
              primary: Colors.white,
              textStyle: TextStyle(fontSize: 14),
            ),
          ),
        ],
      ),
      body: Center(
          child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 16),
        child: Form(
            key: formKey,
            child: Consumer<UserManager>(
              builder: (_, userManager, child) {
                return ListView(
                  padding: EdgeInsets.all(16),
                  shrinkWrap: true,
                  children: <Widget>[
                    TextFormField(
                      controller: emailController,
                      enabled: !userManager.loading,
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
                      enabled: !userManager.loading,
                      decoration: const InputDecoration(hintText: 'Senha'),
                      autocorrect: false,
                      obscureText: true,
                      validator: (pass) {
                        if (pass.isEmpty || pass.length < 6)
                          return 'senha invalida';
                        return null;
                      },
                    ),
                    child,
                    const SizedBox(height: 16),
                    SizedBox(
                      height: 44,
                      child: ElevatedButton(
                          child: userManager.loading
                              ? CircularProgressIndicator(
                                  valueColor:
                                      AlwaysStoppedAnimation(Colors.white),
                                )
                              : Text('Entar'),
                          onPressed: userManager.loading
                              ? null
                              : () {
                                  if (formKey.currentState.validate()) {
                                    userManager.signIn(
                                        user: Users(
                                          email: emailController.text,
                                          password: passwordController.text,
                                        ),
                                        onFail: (e) {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(SnackBar(
                                            content:
                                                Text("Falha ao entrar: $e"),
                                            backgroundColor: Colors.red,
                                          ));
                                        },
                                        onSuccess: () {
                                          //TODO FACHAR TELA DE LOGIN
                                        });
                                  }
                                },
                          style: ElevatedButton.styleFrom(
                            primary: Color.fromARGB(255, 4, 125, 141),
                            textStyle: TextStyle(fontSize: 18),
                          )),
                    )
                  ],
                );
              },
              child: Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  child: Text('Esqueci minha senha'),
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    primary: Colors.black,
                  ),
                ),
              ),
            )),
      )),
    );
  }
}
