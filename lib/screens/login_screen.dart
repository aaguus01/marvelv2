import 'package:flutter/material.dart';
import 'package:marvel_project/widgets/login.dart';

class LoginMarvel extends StatefulWidget {
  const LoginMarvel({super.key});

  @override
  State<LoginMarvel> createState() => _LoginMarvelState();
}

class _LoginMarvelState extends State<LoginMarvel> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Marvel Api'),
        centerTitle: true,
      ),
      body:
          const LoginMarvelLogin(), //llamamos a nuestro Login que será el cuerpo de la app
    );
  }
}
