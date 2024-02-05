import 'package:flutter/material.dart';
import 'package:kendicoffeshop/modeller/coffemodel.dart';

class CoffeCardiki extends StatelessWidget {
  final CoffeModel kahve;
  final Widget icon;

  void Function()? onPressed;
  CoffeCardiki({
    super.key,
    required this.kahve,
    required this.icon,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.brown[800], borderRadius: BorderRadius.circular(16)),
      margin: EdgeInsets.fromLTRB(5, 10, 5, 0),
      padding: EdgeInsets.symmetric(vertical: 25),
      child: ListTile(
        title: Text(
          kahve.isim,
          style: TextStyle(fontSize: 30, color: Colors.brown[900]),
        ),
        subtitle: Row(
          children: [
            Text(
              kahve.fiyat + " TL",
              style: TextStyle(color: Colors.brown[400], fontSize: 20),
            ),
            SizedBox(
              width: 130,
            ),
            Text(
              kahve.adet.toString(),
              style: TextStyle(color: Colors.brown[200], fontSize: 20),
            ),
            SizedBox(
              width: 15,
            ),
            Text(kahve.boyut,
                style: TextStyle(color: Colors.brown[200], fontSize: 25)),
          ],
        ),
        leading: Image.asset(kahve.resim),
        trailing: IconButton(
          onPressed: onPressed,
          icon: icon,
        ),
      ),
    );
  }
}
