import 'package:examen_practic/screens/mainpage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../preferences/preferences.dart';
import 'screens.dart';

class LoginPage extends StatefulWidget {
  // pantalla donde se meten los datos para el preferences
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<LoginPage> {
  var nouemail = "";
  var noucontra = "";
  RegExp emailRegExp =
      new RegExp(r'^\w+[\w-\.]*\@\w+((-\w+)|(\w*))\.[a-z]{2,3}$');
  RegExp contRegExp = new RegExp(r'^([1-zA-Z0-1@.\s]{1,255})$');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Crear Usuario"),
      ),
      body: Container(
        // imagen de fondo
        padding: EdgeInsets.all(16.0),
        child: ListView(
          // todos los input para preferences
          children: <Widget>[
            TextFormField(
              initialValue: Preferencias.email,
              decoration: InputDecoration(
                labelText: "Email",
              ),
              onChanged: (value) {
                nouemail = value;
              },
            ),
            TextFormField(
              initialValue: Preferencias.pass,
              decoration: InputDecoration(
                labelText: "Contraseña",
              ),
              onChanged: (value) {
                noucontra = value;
              },
              obscureText: true,
            ),
            CheckboxListTile(
                value: Preferencias.diablo,
                title: Text('Recordar'),
                onChanged: (value) {
                  Preferencias.setdiablo = value!;
                  setState(() {});
                }),
            IconButton(
              onPressed: () {
                if (Preferencias.diablo) {
                  Preferencias.setpass = noucontra;
                  Preferencias.setemail = nouemail;
                }
                if (noucontra.length >= 5) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const HomeScreen()));
                } else {
                  const snackBar = SnackBar(
                    content: Text('Contraseña muy corta!!'),
                  );
                }
              },
              icon: Icon(
                Icons.arrow_forward,
                size: 42.0,
                color: Colors.blue[800],
              ),
            )
          ],
        ),
      ),
    );
  }
}
