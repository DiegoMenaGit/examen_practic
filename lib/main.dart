import 'package:examen_practic/preferences/usuarios_list_provider.dart';
import 'package:examen_practic/screens/screens.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'preferences/preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Preferencias.init();
  runApp(
    // clase principal para iniciar la app
    MultiProvider(providers: [
      ChangeNotifierProvider(create: (_) => UsuariosListProvider()),
    ], child: MyApp()),
  );
}

class MyApp extends StatelessWidget {
  // rutas y debug en false
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      //home: HomePage(),
      initialRoute: 'home',
      routes: {'home': (_) => LoginPage(), 'result': (_) => ResultPage()},
    );
  }
}
