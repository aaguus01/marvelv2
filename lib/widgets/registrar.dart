import 'package:flutter/material.dart';
import 'package:marvel_project/preferences/preferences.dart';

class LoginMarvelRegister extends StatefulWidget {
  const LoginMarvelRegister({super.key});

  @override
  State<LoginMarvelRegister> createState() => _LoginMarvelRegisterState();
}

class _LoginMarvelRegisterState extends State<LoginMarvelRegister> {
  String _userName = '';
  String _passwd1 = '';
  String _passwd2 = '';
  //variables con valores que necesitaremos al recogerlos del TextFormField

  @override
  Widget build(BuildContext context) {
    return ListView(
      //haremos una lista de todos los textFormField
      padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 8.0),
      children: <Widget>[
        Container(
          margin: const EdgeInsets.only(top: 40.0),
          child: Image.asset('assets/marvel-logo2.png'),
        ),
        registrarUsuario(),
        const Divider(),
        registrarUsuarioPass(),
        const Divider(),
        registrarUsuarioPassConfirmar(),
        const Divider(),
        checkBoxRegistrar(),
        const Divider(),
        registrarButtonSend()
      ],
    );
  }

  Widget registrarUsuario() {
    return TextFormField(
      decoration: const InputDecoration(
          icon: Icon(Icons.person_add),
          hintText: 'Introduce un nombre de usuario',
          labelText: 'Nombre de usuario'),
      validator: (String? value) {
        return (value != null && value.length < 4
            ? 'El nombre de usuario tiene que contener al menos 5 letras.'
            : null);
      },
      onChanged: (value) =>
          _userName = value, //guardamos los valores del nombre de usuario
    );
  }

  Widget registrarUsuarioPass() {
    return TextFormField(
      decoration: const InputDecoration(
          icon: Icon(Icons.lock),
          hintText: 'Introduce la contraseña',
          labelText: 'Contraseña'),
      validator: (String? value) {
        return (value != null && value.length < 4
            ? 'El nombre de usuario tiene que contener al menos 5 letras.'
            : null);
      },
      obscureText: true,
      onChanged: (value) => _passwd1 =
          value, //guardamos los valores de la contraseña para comprobar las dos
    );
  }

  Widget registrarUsuarioPassConfirmar() {
    return Container(
      margin: const EdgeInsets.only(bottom: 20.0),
      child: TextFormField(
        decoration: const InputDecoration(
            icon: Icon(Icons.lock),
            hintText: 'Introduce la contraseña',
            labelText: 'Confirmar contraseña'),
        validator: (String? value) {
          return (value != null && value.length < 4
              ? 'El nombre de usuario tiene que contener al menos 5 letras.'
              : null);
        },
        obscureText: true,
        onChanged: (value) => _passwd2 = value,
      ),
    );
  }

  Widget registrarButtonSend() {
    return ElevatedButton(
        onPressed: (() {
          if (_passwd1 == _passwd2 && _passwd1.length > 5) {
            //comprobamos que las dos contraseñas coiniciden.
            if (!Preferences.checkRecordar) {
              Preferences.checkRecordar = false;
            }
            Preferences.nom = _userName;
            Preferences.passwd = _passwd1;
            Navigator.of(context)
                .pushReplacementNamed('login'); //vamos a la página de login
          } else {
            _showMyDialog(); //si esta mal la contraseña mostramos error
          }
        }),
        style: const ButtonStyle(
          backgroundColor: MaterialStatePropertyAll<Color>(Colors.red),
          minimumSize: MaterialStatePropertyAll(Size(250, 40)),
        ),
        child: const Text('Registrarse'));
  }

  Widget checkBoxRegistrar() {
    //el checkbox
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

  Future<void> _showMyDialog() async {
    //el alert de que las contraseñas no coinciden
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(''),
          content: SingleChildScrollView(
            child: ListBody(
              children: const <Widget>[
                Text(
                    'Las contraseñas no coinciden o la longitud es incorrecta'),
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
