import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:kendicoffeshop/modeller/coffe_card.dart';
import 'package:kendicoffeshop/modeller/coffemodel.dart';
import 'package:kendicoffeshop/sayfalar/kahve_boyutu_sayfasi.dart';

class AnaSayfa extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance.collection('kahveler').snapshots(),
      builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          final kahveler = snapshot.data!.docs.map((doc) {
            final data = doc.data() as Map<String, dynamic>? ?? {};
            return CoffeModel.fromJson(data);
          }).toList();

          return SafeArea(
            child: ListView.builder(
              itemCount: kahveler.length,
              itemBuilder: (context, index) {
                return CoffeCard(
                  kahve: kahveler[index],
                  icon: Icon(Icons.add),
                  onPressed: () => KahveEkle(context, kahveler[index]),
                );
              },
            ),
          );
        }
      },
    );
  }

  void KahveEkle(BuildContext context, CoffeModel coffeModel) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => KahveBoyutuSayfasi(),
        settings: RouteSettings(
          arguments: coffeModel,
        ),
      ),
    );
  }
}
