import 'package:flutter/material.dart';
import 'package:kendicoffeshop/sayfalar/add_coffe_page.dart';
import 'package:kendicoffeshop/sayfalar/orders_page.dart';
import 'package:kendicoffeshop/sayfalar/signin_page.dart';

class AdminPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[700],
      appBar: AppBar(
        title: Text('Admin Panel'),
        backgroundColor: Colors.brown[700], // AppBar rengi
        centerTitle: true, // Başlığı ortalamak için centerTitle true yapıldı
      ),
      drawer: Drawer(
        backgroundColor: Colors.brown[700],
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.brown[700],
              ),
              child: Text('Admin Menu'),
            ),
            ListTile(
              title: Text('Orders'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Add Coffee'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AddCoffeePage()),
                );
              },
            ),
            ListTile(
              title: Text('Logout'),
              onTap: () {
                // Logout işlemi, SignInPage'e dönüş
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => SignInPage()),
                );
              },
            ),
          ],
        ),
      ),
      body: OrdersPage(),
    );
  }
}
