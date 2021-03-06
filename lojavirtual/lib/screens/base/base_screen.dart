import 'package:flutter/material.dart';
import 'package:lojavirtual/common/custom_drawer/custom_drawer.dart';
import 'package:lojavirtual/screens/login/login_screen.dart';
import 'package:provider/provider.dart';
import 'package:lojavirtual/models/page_manager.dart';

class BaseScreen extends StatelessWidget {
  final PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Provider(
        create: (_) => PageManager(pageController),
        child: PageView(
          controller: pageController,
          physics: const NeverScrollableScrollPhysics(),
          children: <Widget>[
            Scaffold(
              drawer: customDrawer(),
              appBar: AppBar(
                title: const Text('Home1'),
              ),
            ),
            Scaffold(
              drawer: customDrawer(),
              appBar: AppBar(
                title: const Text('Home2'),
              ),
            ),
            Scaffold(
              drawer: customDrawer(),
              appBar: AppBar(
                title: const Text('Home3'),
              ),
            ),
            Scaffold(
              drawer: customDrawer(),
              appBar: AppBar(
                title: const Text('Home4'),
              ),
            ),
          ],
        ));
  }
}
