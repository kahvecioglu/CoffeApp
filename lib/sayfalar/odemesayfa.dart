import 'package:flutter/material.dart';
import 'package:kendicoffeshop/modeller/coffe_card.dart';
import 'package:kendicoffeshop/modeller/coffe_card_iki.dart';
import 'package:kendicoffeshop/modeller/coffemodel.dart';
import 'package:kendicoffeshop/modeller/providermodel.dart';
import 'package:kendicoffeshop/sayfalar/market_page.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class OdemeSayfa extends StatefulWidget {
  final String user;

  const OdemeSayfa({Key? key, required this.user}) : super(key: key);

  @override
  State<OdemeSayfa> createState() => _OdemeSayfaState();
}

class _OdemeSayfaState extends State<OdemeSayfa> {
  void odemeislemi(List<CoffeModel> secilenKahveler) {
    FirebaseFirestore.instance
        .collection('orders')
        .doc(widget.user)
        .get()
        .then((doc) {
      List<Map<String, dynamic>> currentItems = [];
      if (doc.exists) {
        currentItems = List<Map<String, dynamic>>.from(doc['items']);
      }

      // Yeni eklenen kahveleri siparişe ekleyin
      List<Map<String, dynamic>> newItems = [];
      secilenKahveler.forEach((coffeModel) {
        Map<String, dynamic> newItem = {
          'id': coffeModel.name + "id",
          'name': coffeModel.name,
          'price': coffeModel.price,
          'imageUrl': coffeModel.imageUrl,
        };
        newItems.add(newItem);
      });

      // Mevcut ve yeni eklenen kahveleri birleştirin
      List<Map<String, dynamic>> allItems = [];
      allItems.addAll(currentItems);
      allItems.addAll(newItems);

      // Toplam fiyatı hesaplayın
      double totalPrice = allItems.fold<double>(
        0,
        (previousValue, element) =>
            previousValue + double.parse(element['price']),
      );

      // Güncellenmiş siparişi Firestore'a kaydedin
      FirebaseFirestore.instance.collection('orders').doc(widget.user).set({
        'user_id': widget.user,
        'order_date': DateTime.now(),
        'status': 'Hazırlanıyor',
        'items': allItems,
        'total_price': totalPrice,
      }).then((value) {
        // Sipariş başarıyla kaydedildiğinde kullanıcıya teşekkür mesajı göster
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Teşekkürler!'),
              content: Text('Siparişiniz başarıyla alındı. Teşekkür ederiz!'),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('Tamam'),
                ),
              ],
            );
          },
        );

        // Seçili kahve listesini temizle
        Provider.of<ProviderModel>(context, listen: false).clear();

        // Ödeme sayfasından çıkma işlemi
        Navigator.of(context).pop();
      }).catchError((error) {
        print(error);
        // Hata durumunda kullanıcıya bilgi verme
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Hata'),
              content: Text('Siparişiniz alınamadı. Lütfen tekrar deneyin.'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('Tamam'),
                ),
              ],
            );
          },
        );
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ProviderModel>(
      builder: (context, value, child) => SafeArea(
        child: Column(
          children: [
            Expanded(
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
              ),
            ),
            ElevatedButton(
              onPressed: () {
                odemeislemi(Provider.of<ProviderModel>(context, listen: false)
                    .secilenkahveler); // Ödeme işlemini başlat
              },
              child: Text('Öde'),
            ),
          ],
        ),
      ),
    );
  }
}
