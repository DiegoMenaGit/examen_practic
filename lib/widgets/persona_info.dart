import 'package:examen_practic/preferences/usuarios_list_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PersonaInfo extends StatelessWidget {
  // aqui es mostraran els listile de cada persona quan es cliqui damunt
  const PersonaInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final usuariListProvider = Provider.of<UsuariosListProvider>(context);
    final scans = usuariListProvider.scans;

    return ListView.builder(
      itemBuilder: (_, index) => Dismissible(
        key: UniqueKey(),
        background: Container(
          color: Colors.red,
          child: Align(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(Icons.delete_forever),
            ),
            alignment: Alignment.centerRight,
          ),
        ),
        onDismissed: (DismissDirection direccio) {
          Provider.of<UsuariosListProvider>(context, listen: false)
              .esborraPerid(scans[index].id!);
        },
        child: ListTile(
          leading: Icon(
            Icons.face,
          ),
          title: Text(scans[index].name),
          subtitle: Text(scans[index].email +
              "\n" +
              scans[index].address +
              "\n" +
              scans[index].phone),
          trailing: Icon(Icons.keyboard_arrow_right, color: Colors.grey),
        ),
      ),
    );
  }
}
