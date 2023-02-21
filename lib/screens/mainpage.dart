import 'package:examen_practic/preferences/usuarios_list_provider.dart';
import 'package:examen_practic/screens/crear.dart';
import 'package:examen_practic/screens/usu.dart';
import 'package:examen_practic/widgets/scan_tile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../preferences/db_provider.dart';

class HomeScreen extends StatelessWidget {
  //pagina principal on es veuran tots els listiles
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
        actions: [
          IconButton(
            icon: Icon(Icons.delete_forever),
            onPressed: () {
              Provider.of<UsuariosListProvider>(context, listen: false)
                  .esborraTots();
            },
          ),
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Provider.of<UsuariosListProvider>(context, listen: false).nouScan(
                  "joan",
                  "joan@gmail.com",
                  "Sa Pobla",
                  "555222333",
                  "https://images.pexels.com/photos/2379004/pexels-photo-2379004.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500");
            },
          ),
          IconButton(
            icon: Icon(Icons.more),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CrearPage()),
              );
            },
          ),
        ],
      ),
      body: _HomeScreenBody(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

class _HomeScreenBody extends StatelessWidget {
  const _HomeScreenBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userlistProvider =
        Provider.of<UsuariosListProvider>(context, listen: true);

    DBProvider.db.database;
    userlistProvider.carregaScans();
    return UsuScreen();
  }
}
