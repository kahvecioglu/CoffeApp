import 'package:flutter/material.dart';
import 'package:kendicoffeshop/modeller/coffemodel.dart';

class CoffeCard extends StatelessWidget {
  final CoffeModel kahve;
  final Widget icon;
  void Function()? onPressed;
  CoffeCard(
      {super.key,
      required this.kahve,
      required this.icon,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.brown[800], borderRadius: BorderRadius.circular(16)),
      margin: EdgeInsets.fromLTRB(5, 10, 5, 0),
      padding: EdgeInsets.symmetric(vertical: 25),
      child: ListTile(
        title: Text(
          kahve.name,
          style: TextStyle(fontSize: 30, color: Colors.brown[900]),
        ),
        subtitle: Text(
          kahve.price.toString() + " TL",
          style: TextStyle(color: Colors.brown[400], fontSize: 20),
        ),
        leading: Image.network(kahve.imageUrl),
        trailing: IconButton(
          onPressed: onPressed,
          icon: icon,
        ),
      ),
    );
  }
}
