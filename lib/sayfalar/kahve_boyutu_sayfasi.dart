import 'package:flutter/material.dart';
import 'package:kendicoffeshop/modeller/coffe_boyut_card.dart';
import 'package:kendicoffeshop/modeller/coffemodel.dart';
import 'package:kendicoffeshop/modeller/providermodel.dart';
import 'package:provider/provider.dart';

class KahveBoyutuSayfasi extends StatefulWidget {
  const KahveBoyutuSayfasi({super.key});

  @override
  State<KahveBoyutuSayfasi> createState() => _KahveBoyutuSayfasiState();
}

class _KahveBoyutuSayfasiState extends State<KahveBoyutuSayfasi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.brown[700],
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Provider.of<ProviderModel>(context, listen: false)
                    .secilenkahveyisil();
                Navigator.of(context).pop();
              },
              icon: Icon(Icons.arrow_back)),
          backgroundColor: Colors.brown[700],
        ),
        body: Consumer<ProviderModel>(
          builder: (context, value, child) => SafeArea(
              child: ListView.builder(
            itemCount: value.secilenkahve.length,
            itemBuilder: (context, index) {
              CoffeModel secilenkahve = value.secilenkahve[index];

              return CoffeBoyutCard(
                resim: secilenkahve.resim,
                isim: secilenkahve.isim,
                fiyat: secilenkahve.fiyat,
                adet: 1,
                boyut: "  ",
              );
            },
          )),
        ));
  }
}
