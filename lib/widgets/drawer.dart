import 'package:flutter/material.dart';
import 'package:marvel_project/screens/screens.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const _DrawerHeader(),
          ListTile(
            leading: const Icon(Icons.pages_outlined),
            title: const Text('Inicio'),
            onTap: () {
              Navigator.pushReplacementNamed(context,
                  'paginaBienvenida'); //hacemos un Replacement para que no deje la opción de volver a atrás y haga una cola
            },
          ),
          ListTile(
            leading: const Icon(Icons.people_outlined),
            title: const Text('Configuración'),
            onTap: () {
              Navigator.pushReplacementNamed(context, 'paginaSettings');
            },
          ),
          ListTile(
            leading: const Icon(Icons.exit_to_app),
            title: const Text('Exit'),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushReplacementNamed(context,
                  'login'); //volvemos al login, hacemos que cierre la sesión
            },
          ),
        ],
      ),
    );
  }
}

class _DrawerHeader extends StatelessWidget {
  const _DrawerHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DrawerHeader(
      //hacemos la parte del head del drawer, le metemos la imagen
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/marvel-logo2.png'), fit: BoxFit.cover)),
      child: Container(),
    );
  }
}
