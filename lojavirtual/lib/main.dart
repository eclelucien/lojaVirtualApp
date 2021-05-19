import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:lojavirtual/models/user_manager.dart';
import 'package:lojavirtual/screens/base/base_screen.dart';
import 'package:provider/provider.dart';
import 'package:flutter/src/widgets/binding.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (_) => UserManager(),
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
          home: BaseScreen()),
    );
  }
}

// class ApplicationState extends ChangeNotifier {
//   ApplicationState() {
//     init();
//   }
//   Future<void> init() async {
//     await Firebase.initializeApp();
//     FirebaseApp defaultApp = await Firebase.initializeApp();

//     FirebaseAuth.instance.userChanges().listen((user)) {
//         if (user != null) {
            
//         }
//     }
//   }
// }
