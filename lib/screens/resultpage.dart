import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../preferences/preferences.dart';

class ResultPage extends StatefulWidget {
  // pagina donde se ven los resultados de las preferences
  @override
  ResultPageState createState() => ResultPageState();
}

class ResultPageState extends State<ResultPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inici'),
      ),
    );
  }
}
