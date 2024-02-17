import 'package:flutter/material.dart';
import 'package:kendicoffeshop/modeller/coffemodel.dart';

class ProviderModel extends ChangeNotifier {
// listeyi oluştur

  List<CoffeModel> _secilenkahveler = [];
  List<CoffeModel> _secilenkahve = [];

  List<CoffeModel> get secilenkahveler => _secilenkahveler;

  List<CoffeModel> get secilenkahve => _secilenkahve;

  void kahvesec(CoffeModel coffeModel) {
    _secilenkahve.add(coffeModel);
    notifyListeners();
  }

  void kahvelersec(CoffeModel coffeModel) {
    _secilenkahveler.add(coffeModel);
    notifyListeners();
  }

  void kahvelersecsil(CoffeModel coffeModel) {
    _secilenkahveler.remove(coffeModel);
    notifyListeners();
  }

  void kahvesecsil(CoffeModel coffeModel) {
    _secilenkahve.remove(coffeModel);
    notifyListeners();
  }

  void secilenkahveyisil() {
    _secilenkahve.clear();
    notifyListeners();
  }

  void clear() {
    secilenkahveler.clear();
    notifyListeners();
  }
}
