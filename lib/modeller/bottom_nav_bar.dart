import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class MyBottomNavBar extends StatelessWidget {
  void Function(int)? onTabChange;

  MyBottomNavBar({super.key, required this.onTabChange});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GNav(
          onTabChange: (value) => onTabChange!(value),
          mainAxisAlignment: MainAxisAlignment.center,
          color: Colors.brown[900],
          activeColor: Colors.brown[900],
          tabBackgroundColor: Color.fromARGB(255, 98, 62, 49),
          tabBorderRadius: 24,
          tabActiveBorder: Border.all(color: Colors.black38),
          tabs: [
            GButton(
              icon: Icons.home,
              text: "Market",
            ),
            GButton(
              icon: Icons.shopping_bag_outlined,
              text: "Ödeme",
            ),
          ]),
    );
  }
}
