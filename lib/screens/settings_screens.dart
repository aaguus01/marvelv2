import 'package:flutter/material.dart';
import 'package:marvel_project/preferences/preferences.dart';
import 'package:marvel_project/provider/theme_provider.dart';
import 'package:marvel_project/widgets/drawer.dart';
import 'package:provider/provider.dart';

class SettingsScreen extends StatefulWidget {
  static const String routerName = 'settings'; //el nombre de la ruta

  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Configuración'),
        ),
        drawer: const SideMenu(), //llamamos al widget SideMenu
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Configuración',
                    style:
                        TextStyle(fontSize: 35, fontWeight: FontWeight.w300)),
                const Divider(),
                SwitchListTile(
                    //creamos un switch para elegir el modo que queremos tener en la app
                    value: Preferences.isDarkMode,
                    title: const Text('Modo oscuro'),
                    onChanged: (value) {
                      final themeProvider =
                          Provider.of<ThemeProvider>(context, listen: false);
                      value
                          ? themeProvider.setDarkMode()
                          : themeProvider.setLightMode();
                      Preferences.isDarkMode = value;
                      setState(() {});
                    }),
                const Divider(),
                Padding(
                  //ponemos para cambiar el nombre de usuario
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextFormField(
                    initialValue: Preferences.nom,
                    onChanged: (value) {
                      Preferences.nom = value;
                      setState(() {});
                    },
                    decoration: const InputDecoration(
                        labelText: 'Nombre de usuario',
                        helperText: 'Nombre del usuario'),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
