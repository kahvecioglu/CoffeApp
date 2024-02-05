import 'package:flutter/material.dart';
import 'package:kendicoffeshop/modeller/coffe_card.dart';
import 'package:kendicoffeshop/modeller/coffe_card_iki.dart';
import 'package:kendicoffeshop/modeller/coffemodel.dart';
import 'package:kendicoffeshop/modeller/providermodel.dart';
import 'package:provider/provider.dart';

class OdemeSayfa extends StatefulWidget {
  const OdemeSayfa({super.key});

  @override
  State<OdemeSayfa> createState() => _OdemeSayfaState();
}

class _OdemeSayfaState extends State<OdemeSayfa> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ProviderModel>(
      builder: (context, value, child) => SafeArea(
          child: ListView.builder(
        itemCount: value.secilenkahveler.length,
        itemBuilder: (context, index) {
          CoffeModel sepettekikahveler = value.secilenkahveler[index];

          return CoffeCardiki(
            kahve: sepettekikahveler,
            icon: Icon(Icons.delete, color: Colors.white),
            onPressed: () {
              Provider.of<ProviderModel>(context, listen: false)
                  .kahvelersecsil(sepettekikahveler);
            },
          );
        },
      )),
    );
  }
}
