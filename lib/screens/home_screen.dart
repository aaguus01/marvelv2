// ignore_for_file: sort_child_properties_last

import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Marvel Api Query'),
        elevation: 0,
        centerTitle: true,
      ),
      body: myPagina(context),
    );
  }

  Widget myPagina(BuildContext context) {
    return Column(
      //dentro del column metemos las imagenes y los dos botones
      children: <Widget>[
        Container(
          child: Image.asset('assets/marvel-logo2.png'),
          margin: const EdgeInsets.only(top: 120.0),
        ),
        const SizedBox(
          width: double.infinity,
          height: 140,
        ),
        ElevatedButton(
            //el del login
            child: const Text('Login'),
            onPressed: () {
              Navigator.of(context).pushNamed('login');
            },
            style: const ButtonStyle(
              backgroundColor: MaterialStatePropertyAll<Color>(Colors.red),
              minimumSize: MaterialStatePropertyAll(Size(250, 40)),
            )),
        ElevatedButton(
            //el de register
            child: const Text('Register'),
            onPressed: () {
              Navigator.of(context).pushNamed('registrar');
            },
            style: const ButtonStyle(
              backgroundColor: MaterialStatePropertyAll<Color>(
                  Color.fromARGB(120, 255, 0, 0)),
              minimumSize: MaterialStatePropertyAll(Size(250, 40)),
            ))
      ],
    );
  }
}
