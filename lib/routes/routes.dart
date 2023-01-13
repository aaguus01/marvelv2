import 'package:flutter/cupertino.dart';
import 'package:marvel_project/screens/home_screen.dart';
import 'package:marvel_project/screens/login_screen.dart';
import 'package:marvel_project/screens/paginaInicio.dart';
import 'package:marvel_project/screens/register_screen.dart';
import 'package:marvel_project/screens/settings_screens.dart';
import 'package:marvel_project/widgets/registrar.dart';

Map<String, WidgetBuilder> getRoutes() {
  //mapeamos las rutas
  return <String, WidgetBuilder>{
    '/': (BuildContext context) => HomePage(),
    'login': (BuildContext context) => LoginMarvel(),
    'registrar': (BuildContext context) => RegisterMarvel(),
    'paginaBienvenida': (BuildContext context) => PaginaInicio(),
    'paginaSettings': (BuildContext context) => SettingsScreen()
  };
}
