import 'package:examen_practic/preferences/usuarios_list_provider.dart';
import 'package:examen_practic/screens/usu.dart';
import 'package:examen_practic/widgets/persona_info.dart';
import 'package:examen_practic/widgets/scan_tile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../preferences/db_provider.dart';

class Persona extends StatelessWidget {
  const Persona({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Persona'),
      ),
      body: _PersonaScreenBody(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

class _PersonaScreenBody extends StatelessWidget {
  const _PersonaScreenBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PersonaInfo();
  }
}
