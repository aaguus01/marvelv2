// ignore_for_file: sort_child_properties_last

import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Marvel Api Query'),
        elevation: 0,
        centerTitle: true,
      ),
      body: MyPagina(),
    );
  }

  Widget MyPagina() {
    return Container(
      child: Column(
        children: <Widget>[
          Image.asset('assets/marvel-logo2.png'),
          Container(
            width: double.infinity,
            height: 140,
            color: Colors.black,
          ),
          ElevatedButton(
              child: const Text('Login'),
              onPressed: () {},
              style: const ButtonStyle(
                backgroundColor: MaterialStatePropertyAll<Color>(Colors.red),
                minimumSize: MaterialStatePropertyAll(const Size(250, 40)),
              )),
          ElevatedButton(
              child: const Text('Register'),
              onPressed: () {},
              style: const ButtonStyle(
                backgroundColor: MaterialStatePropertyAll<Color>(
                    Color.fromARGB(120, 255, 0, 0)),
                minimumSize: MaterialStatePropertyAll(const Size(250, 40)),
              ))
        ],
        //mainAxisAlignment: MainAxisAlignment.start,
      ),
      color: Color.fromARGB(255, 0, 0, 0),
    );
  }
}
