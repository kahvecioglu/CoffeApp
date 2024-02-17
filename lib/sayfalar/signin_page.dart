import 'package:flutter/material.dart';
import 'package:kendicoffeshop/sayfalar/admin_page.dart';
import 'package:kendicoffeshop/sayfalar/home_page.dart';

class SignInPage extends StatelessWidget {
  TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[700],
      appBar: AppBar(
        title: Text('Sign In'),
        backgroundColor: Colors.brown[700], // AppBar rengi
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: emailController,
                decoration: InputDecoration(
                  labelText: 'Enter your email',
                  border: OutlineInputBorder(), // Textfield kenarlık
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Girilen e-posta adresini kontrol et
                  String enteredEmail = emailController.text;
                  if (enteredEmail == 'admin@gmail.com') {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => AdminPage()),
                    );
                  } else {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => HomePage(
                                user: enteredEmail,
                              )),
                    );
                  }
                },
                child: Text(
                  'Sign In',
                  style: TextStyle(fontSize: 18), // Buton yazı stili
                ),
                style: ElevatedButton.styleFrom(
                  primary: Colors.brown[700], // Buton rengi
                  padding: EdgeInsets.symmetric(
                      horizontal: 50, vertical: 10), // Buton kenar boşlukları
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
