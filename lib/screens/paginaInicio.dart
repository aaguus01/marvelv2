import 'package:flutter/material.dart';
import 'package:marvel_project/preferences/preferences.dart';
import 'package:marvel_project/widgets/drawer.dart';

class PaginaInicio extends StatelessWidget {
  const PaginaInicio({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Home Marvel APi'),
        ),
        drawer: const SideMenu(),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //mostramos la información que hemos recopilado, tanto el nombre de usuario como el modo en el que esta la app
            Text('Dark Mode: ${Preferences.isDarkMode}'),
            Divider(),
            Text('Nombre de usuario: ${Preferences.nom}'),
            Divider()
          ],
        ));
  }
}
