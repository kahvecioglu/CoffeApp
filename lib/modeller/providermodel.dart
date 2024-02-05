import 'package:flutter/material.dart';
import 'package:kendicoffeshop/modeller/coffemodel.dart';

class ProviderModel extends ChangeNotifier {
// listeyi oluştur
  final List<CoffeModel> _kahveler = [
    CoffeModel(
        isim: "Black Coffe",
        fiyat: "50",
        resim: "lib/images/black_coffe.png",
        boyut: "M",
        adet: 1),
    CoffeModel(
        isim: "Expresso",
        fiyat: "70",
        resim: "lib/images/expresso.png",
        boyut: "M",
        adet: 1),
    CoffeModel(
        isim: "İced Coffe",
        fiyat: "80",
        resim: "lib/images/iced_coffe.png",
        boyut: "M",
        adet: 1),
    CoffeModel(
        isim: "Latte",
        fiyat: "65",
        resim: "lib/images/latte.png",
        boyut: "M",
        adet: 1)
  ];

  List<CoffeModel> _secilenkahveler = [];
  List<CoffeModel> _secilenkahve = [];

  List<CoffeModel> get kahveler => _kahveler;

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
}
