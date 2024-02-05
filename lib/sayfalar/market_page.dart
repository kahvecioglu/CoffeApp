import 'package:flutter/material.dart';
import 'package:kendicoffeshop/modeller/coffe_card.dart';
import 'package:kendicoffeshop/modeller/coffemodel.dart';
import 'package:kendicoffeshop/modeller/providermodel.dart';
import 'package:kendicoffeshop/sayfalar/kahve_boyutu_sayfasi.dart';
import 'package:provider/provider.dart';

class AnaSayfa extends StatefulWidget {
  const AnaSayfa({super.key});

  @override
  State<AnaSayfa> createState() => _AnaSayfaState();
}

class _AnaSayfaState extends State<AnaSayfa> {
  void KahveEkle(CoffeModel coffeModel) {
    Provider.of<ProviderModel>(context, listen: false).kahvesec(coffeModel);
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => KahveBoyutuSayfasi(),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ProviderModel>(
      builder: (context, value, child) => SafeArea(
          child: ListView.builder(
        itemCount: value.kahveler.length,
        itemBuilder: (context, index) {
          CoffeModel gelenkahve = value.kahveler[index];

          return CoffeCard(
            kahve: gelenkahve,
            icon: Icon(Icons.add),
            onPressed: () => KahveEkle(gelenkahve),
          );
        },
      )),
    );
  }
}
