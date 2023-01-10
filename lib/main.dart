import 'package:flutter/material.dart';
import 'package:marvel_project/screens/home_screen.dart';

void main() {
  runApp(
      MyApp()); //todo tenemos que poner el ChangeNotifier dentro de un MultiProvider
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Marvel Query Api',
      initialRoute: 'home',
      routes: {
        'home': (BuildContext context) => HomePage(),
      },
      theme: ThemeData.dark(),
    );
  }
}
