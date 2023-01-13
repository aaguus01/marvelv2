import 'package:flutter/material.dart';
import 'package:marvel_project/preferences/preferences.dart';

class LoginMarvelLogin extends StatefulWidget {
  const LoginMarvelLogin({super.key});
  @override
  State<LoginMarvelLogin> createState() => _LoginMarvelLoginState();
}

class _LoginMarvelLoginState extends State<LoginMarvelLogin> {
  String _userName = "";
  String _passwd = "";

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 8.0),
      children: <Widget>[
        //creamos un listView para contener los diferentes TextFormField para hacer los campos de usuario y passwd
        Container(
          margin: const EdgeInsets.only(top: 40.0),
          child: Image.asset('assets/marvel-logo2.png'),
        ),
        loginUsuario(), //los diferentes widgets
        const Divider(),
        loginUsuarioPass(),
        const Divider(),
        checkBoxLogin(),
        const Divider(),
        buttonSend()
      ],
    );
  }

  Widget loginUsuario() {
    return TextFormField(
      initialValue: !Preferences.checkRecordar ? _userName : Preferences.nom,
      decoration: const InputDecoration(
          icon: Icon(Icons.person_add),
          hintText: 'Introduce un nombre de usuario',
          labelText: 'Nombre de usuario'),
      validator: (String? value) {
        return (value != null && value.length < 4
            ? 'El nombre de usuario tiene que contener al menos 5 letras.'
            : null);
      },
      onChanged: (value) {
        _userName = value; //asignamos los valores a la variable username
      },
    );
  }

  Widget loginUsuarioPass() {
    return TextFormField(
      initialValue: !Preferences.checkRecordar ? _passwd : Preferences.passwd,
      decoration: const InputDecoration(
          icon: Icon(Icons.lock),
          hintText: 'Introduce la contraseña',
          labelText: 'Contraseña'),
      validator: (String? value) {
        return (value != null && value.length < 4
            ? 'El nombre de usuario tiene que contener al menos 5 letras.'
            : null);
      },
      onChanged: (value) {
        _passwd = value;
      },
      obscureText: true,
    );
  }

  Widget checkBoxLogin() {
    //el checkbox que recuerda si quieres guardar usuario y contraseña
    return CheckboxListTile(
        value: Preferences.checkRecordar,
        title: const Text('Recordar usuario y contraseña'),
        checkColor: Colors.red,
        activeColor: Colors.black,
        controlAffinity: ListTileControlAffinity.leading,
        onChanged: (bool? value) {
          setState(() {
            Preferences.checkRecordar = value!;
          });
        });
  }

  Widget buttonSend() {
    return ElevatedButton(
        onPressed: (() {
          if (Preferences.nom == _userName) {
            if (Preferences.passwd == _passwd) {
              Navigator.of(context).pushReplacementNamed(
                  'paginaBienvenida'); //si todo es correcto lo enviamos a la página de bienvenida
            } else {
              _showMyDialog();
            }
          } else {
            _showMyDialog();
          }
        }),
        style: const ButtonStyle(
          backgroundColor: MaterialStatePropertyAll<Color>(Colors.red),
          minimumSize: MaterialStatePropertyAll(Size(250, 40)),
        ),
        child: const Text('Logearse'));
  }

  Future<void> _showMyDialog() async {
    //esto es una ventana emergente que avisa que usurio o contraseña son incorrectos
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(''),
          content: SingleChildScrollView(
            child: ListBody(
              children: const <Widget>[
                Text('Usuario o contraseña incorrectos.'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Aceptar'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
