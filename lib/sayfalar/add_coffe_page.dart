import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AddCoffeePage extends StatelessWidget {
  TextEditingController nameController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController imageUrlController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[700],
      appBar: AppBar(
        title: Text('Add Coffee'),
        backgroundColor: Colors.brown[700], // AppBar rengi
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 20),
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                labelText: 'Name',
                border: OutlineInputBorder(),
                labelStyle: TextStyle(color: Colors.white), // Label text rengi
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: priceController,
              decoration: InputDecoration(
                labelText: 'Price',
                border: OutlineInputBorder(),
                labelStyle: TextStyle(color: Colors.white), // Label text rengi
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: imageUrlController,
              decoration: InputDecoration(
                labelText: 'Image URL',
                border: OutlineInputBorder(),
                labelStyle: TextStyle(color: Colors.white), // Label text rengi
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Add coffee
                FirebaseFirestore.instance.collection('kahveler').add({
                  'name': nameController.text,
                  'price': priceController.text,
                  'imageUrl': imageUrlController.text,
                });
                // Clear text fields after adding coffee
                nameController.clear();
                priceController.clear();
                imageUrlController.clear();
              },
              child: Text('Add Coffee'),
              style: ElevatedButton.styleFrom(
                primary: Colors.brown[700], // Button rengi
              ),
            ),
          ],
        ),
      ),
    );
  }
}
