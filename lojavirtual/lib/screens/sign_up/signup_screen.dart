import 'package:flutter/material.dart';
import 'package:lojavirtual/helpers/validators.dart';

class SignUpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Criar Conta'),
        centerTitle: true,
      ),
      body: Center(
        child: Card(
          margin: const EdgeInsets.symmetric(horizontal: 16),
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
              ),
              const SizedBox(height: 16),
              TextFormField(
                decoration: const InputDecoration(hintText: 'Senha'),
                autocorrect: false,
                obscureText: true,
              ),
              const SizedBox(height: 16),
              TextFormField(
                  decoration:
                      const InputDecoration(hintText: 'Repita a senha')),
              SizedBox(
                height: 44,
                child: ElevatedButton(
                    child: Text('Criar Conta'),
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      primary: Color.fromARGB(255, 4, 125, 141),
                      textStyle: TextStyle(fontSize: 18),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
