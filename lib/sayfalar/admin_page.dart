import 'package:flutter/material.dart';
import 'package:kendicoffeshop/sayfalar/signin_page.dart';

class AdminPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[700],
      appBar: AppBar(
        title: Text('Admin Panel'),
        backgroundColor: Colors.brown[700], // AppBar rengi
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              // Logout işlemi, SignInPage'e dönüş
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => SignInPage()),
              );
            },
          ),
        ],
      ),
      body: Center(
        child: Text(
          'Welcome Admin!',
          style: TextStyle(fontSize: 24, color: Colors.white),
        ),
      ),
    );
  }
}
