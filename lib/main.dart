import 'package:flutter/material.dart';
import 'package:marvel_project/preferences/preferences.dart';
import 'package:marvel_project/provider/theme_provider.dart';
import 'package:marvel_project/routes/routes.dart';
import 'package:provider/provider.dart'; // como aqui contiene las diferentes rutas.

void main() async {
  //hacemos un función asincrona para cargar los preferences
  WidgetsFlutterBinding.ensureInitialized();
  await Preferences.init();
  runApp(MultiProvider(providers: [
    //cargamos el multiprovider
    ChangeNotifierProvider(
        create: ((_) => ThemeProvider(isDarkMode: Preferences.isDarkMode)))
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Marvel Query Api',
      initialRoute: '/',
      routes:
          getRoutes(), // cargamos las rutas que tenemos mapeadas en otro sitio
      theme: Provider.of<ThemeProvider>(context).currentTheme,
    );
  }
}
