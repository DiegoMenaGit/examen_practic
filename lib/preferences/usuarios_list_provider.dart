import 'package:examen_practic/preferences/db_provider.dart';
import 'package:flutter/cupertino.dart';

import '../models/Usuarios.dart';

class UsuariosListProvider extends ChangeNotifier {
  // clase provider per interactuar amb la base de dades
  List<Usuaris> scans = [];

  Future<Usuaris> nouScan(String name, String email, String address,
      String phone, String photo) async {
    final nouScan = Usuaris(
        name: name, email: email, address: address, phone: phone, photo: photo);
    final id = await DBProvider.db.insertScan(nouScan);
    nouScan.id = id;
    this.scans.add(nouScan);
    notifyListeners();
    return nouScan;
  }

  carregaScans() async {
    final scans = await DBProvider.db.getAllScans();
    this.scans = [...scans];
    notifyListeners();
  }

  carregaScanPerTipus(String name) async {
    final scans = await DBProvider.db.getScanByName(name);
    this.scans = [...scans!];
    notifyListeners();
  }

  esborraTots() async {
    final scans = await DBProvider.db.deleteAllScans();
    this.scans = []; //clear
    notifyListeners();
  }

  esborraPerid(int id) async {
    final scans = await DBProvider.db.deleteScan(id);
    this.scans.removeWhere((element) => element.id == id);

    notifyListeners();
  }
}
