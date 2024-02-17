import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kendicoffeshop/sayfalar/add_coffe_page.dart';

class OrdersPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[700],
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('orders').snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            final orders = snapshot.data!.docs;
            return ListView.builder(
              itemCount: orders.length,
              itemBuilder: (context, index) {
                final order = orders[index].data() as Map<String, dynamic>;
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    color: Colors.brown[500],
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ListTile(
                      title: Text(
                        'User: ' + order['user_id'].toString(),
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black, // Siyah metin rengi
                        ),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 8),
                          Text(
                            'Order Date: ' +
                                (order['order_date'] as Timestamp)
                                    .toDate()
                                    .toString(),
                            style: TextStyle(
                                color: Colors.white), // Beyaz metin rengi
                          ),
                          SizedBox(height: 8),
                          Text(
                            'Items:',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black // Beyaz metin rengi
                                ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children:
                                (order['items'] as List<dynamic>).map((item) {
                              return Padding(
                                padding: const EdgeInsets.only(left: 16.0),
                                child: Text(
                                  'Name: ' +
                                      item['name'] +
                                      ' | Price: \$' +
                                      item['price'].toString(),
                                  style: TextStyle(
                                    fontStyle: FontStyle.italic,
                                    color: Colors.white, // Beyaz metin rengi
                                  ),
                                ),
                              );
                            }).toList(),
                          ),
                          SizedBox(height: 8),
                          Text(
                            'Total Price: \$' + order['total_price'].toString(),
                            style: TextStyle(
                                color: Colors.white), // Beyaz metin rengi
                          ),
                        ],
                      ),
                      trailing: IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () {
                          // Delete order
                          FirebaseFirestore.instance
                              .collection('orders')
                              .doc(orders[index].id)
                              .delete();
                        },
                      ),
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
