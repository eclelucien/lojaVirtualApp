// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:lojavirtual/models/user_manager.dart';
import 'package:lojavirtual/screens/base/base_screen.dart';
import 'package:lojavirtual/screens/login/login_screen.dart';
import 'package:lojavirtual/screens/sign_up/signup_screen.dart';
import 'package:provider/provider.dart';
import 'package:flutter/src/widgets/binding.dart';

Future<void> main() async {
  WidgetsFlutterBinding
      .ensureInitialized(); //aqui estamos initialisando o nosso applicativo
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    //aqui temos um stateless que normalmente devia ser a tela base no nosso app
    return ChangeNotifierProvider(
        create: (_) => UserManager(),
        lazy: false,
        child: MaterialApp(
          title: 'Loja virtual',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primaryColor: const Color.fromARGB(255, 4, 125, 141),
            scaffoldBackgroundColor: const Color.fromARGB(255, 4, 125, 141),
            appBarTheme: const AppBarTheme(
              elevation: 0,
            ),
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          initialRoute: '/base',
          onGenerateRoute: (settings) {
            switch (settings.name) {
              case '/signup':
                return MaterialPageRoute(builder: (_) => SignUpScreen());
              case '/login':
                return MaterialPageRoute(builder: (_) => Login());
              case '/base':
              default:
                return MaterialPageRoute(builder: (_) => BaseScreen());
            }
          },
        ));
  }
}
