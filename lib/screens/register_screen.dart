import 'package:flutter/material.dart';
import 'package:marvel_project/preferences/preferences.dart';
import 'package:marvel_project/widgets/registrar.dart';

class RegisterMarvel extends StatelessWidget {
  const RegisterMarvel({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register Marvel'),
        centerTitle: true,
      ),
      body: LoginMarvelRegister(), //llamamos a register
    );
  }
}
