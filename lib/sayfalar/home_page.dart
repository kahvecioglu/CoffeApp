import 'package:flutter/material.dart';
import 'package:kendicoffeshop/modeller/bottom_nav_bar.dart';
import 'package:kendicoffeshop/modeller/my_drawer.dart';
import 'package:kendicoffeshop/sayfalar/market_page.dart';
import 'package:kendicoffeshop/sayfalar/odemesayfa.dart';

class HomePage extends StatefulWidget {
  final String user;
  const HomePage({super.key, required this.user});

  @override
  State<HomePage> createState() => _HomePageState();
}

int sayfaindexi = 0;

class _HomePageState extends State<HomePage> {
  void Secilensayfa(int index) {
    setState(() {
      sayfaindexi = index;
    });
  }

  final List<Widget> pages = [AnaSayfa(), OdemeSayfa()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[700],
      appBar: AppBar(
        centerTitle: true,
        title: Padding(
          padding: EdgeInsets.only(top: 20),
          child: Text(
            "COFFEM",
            style: TextStyle(fontSize: 50, color: Colors.brown[900]),
          ),
        ),
        backgroundColor: Colors.brown[700],
      ),
      drawer: MyDrawer(user: widget.user),
      bottomNavigationBar: MyBottomNavBar(
        onTabChange: (index) => Secilensayfa(index),
      ),
      body: pages[sayfaindexi],
    );
  }
}
