import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:kendicoffeshop/modeller/coffemodel.dart';
import 'package:kendicoffeshop/modeller/providermodel.dart';
import 'package:kendicoffeshop/sayfalar/odemesayfa.dart';
import 'package:provider/provider.dart';

class CoffeBoyutCard extends StatefulWidget {
  final String resim;
  final String isim;
  final double fiyat;
  int adet;
  String boyut = "M";

  CoffeBoyutCard(
      {super.key,
      required this.resim,
      required this.fiyat,
      required this.isim,
      required this.adet,
      required this.boyut});

  @override
  State<CoffeBoyutCard> createState() => _CoffeBoyutCardState();
}

class _CoffeBoyutCardState extends State<CoffeBoyutCard> {
  int adetsayisi = 1;
  void AdetArttir() {
    setState(() {
      adetsayisi++;
      widget.adet = adetsayisi;
    });
  }

  void AdetAzalt() {
    setState(() {
      if (adetsayisi >= 1) {
        adetsayisi--;
        widget.adet = adetsayisi;
      }
    });
  }

  List<bool> isSelected = [false, true, false];
  void SepeteEkle() {
    CoffeModel coffeModel = CoffeModel(
        name: widget.isim,
        price: widget.fiyat,
        imageUrl: widget.resim,
        boyut: widget.boyut,
        adet: widget.adet);

    Provider.of<ProviderModel>(context, listen: false).kahvelersec(coffeModel);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
          backgroundColor: Colors.brown,
          content: Center(
              child: Text(
            "Sepete Eklendi",
            style: TextStyle(fontSize: 20),
          )),
          duration: Duration(seconds: 1)),
    );

    Navigator.pop(context);
    Provider.of<ProviderModel>(context, listen: false).secilenkahveyisil();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Image.asset(
            widget.resim,
            width: 180,
            height: 180,
          ),
          SizedBox(
            height: 40,
          ),
          Text(
            widget.isim,
            style: TextStyle(fontSize: 40),
          ),
          Text(
            widget.fiyat.toString() + " TL",
            style: TextStyle(fontSize: 25),
          ),
          SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                  color: Colors.black,
                  onPressed: () {
                    AdetAzalt();
                  },
                  icon: Icon(Icons.remove)),
              SizedBox(
                width: 10,
              ),
              Text(
                adetsayisi.toString(),
                style: TextStyle(fontSize: 30),
              ),
              SizedBox(
                width: 10,
              ),
              IconButton(
                color: Colors.black,
                onPressed: () {
                  AdetArttir();
                },
                icon: Icon(Icons.add),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ToggleButtons(
                selectedColor: Colors.black,
                color: Colors.white,
                splashColor: Colors.brown[900],
                fillColor: Colors.brown[900],
                children: [Text("S"), Text("M"), Text("L")],
                isSelected: isSelected,
                onPressed: (index) {
                  setState(() {
                    // ToggleButton'ı güncelle
                    isSelected = List.filled(isSelected.length, false);
                    isSelected[index] = true;

                    if (index == 0) {
                      widget.boyut = "S";
                    } else if (index == 1) {
                      widget.boyut = "M";
                    } else {
                      widget.boyut = "L";
                    }
                  });
                },
              ),
            ],
          ),
          SizedBox(
            height: 100,
          ),
          TextButton(
              onPressed: SepeteEkle,
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Colors.brown[900]),
                width: 250,
                height: 70,
                child: Center(
                    child: Text(
                  "Sepete Ekle",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                )),
              ))
        ],
      ),
    );
  }
}
