import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kendicoffeshop/sayfalar/signin_page.dart';

class MyDrawer extends StatelessWidget {
  final String user;
  const MyDrawer({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.brown[700],
      child: ListView(children: [
        Padding(padding: EdgeInsets.only(top: 70)),
        Image.asset(
          "lib/images/latte.png",
          width: 170,
          height: 170,
        ),
        Text(user),
        SizedBox(
          height: 70,
        ),
        ListTile(
          leading: Icon(Icons.home, size: 50, color: Colors.brown[900]),
          title: Text(
            "Ana Sayfa",
            style: TextStyle(fontSize: 30, color: Colors.brown[400]),
          ),
          onTap: () => Navigator.of(context).pop(),
        ),
        ListTile(
          leading: Icon(
            Icons.question_mark_sharp,
            color: Colors.brown[900],
            size: 50,
          ),
          title: Text(
            "Hakkında",
            style: TextStyle(fontSize: 30, color: Colors.brown[400]),
          ),
          onTap: () => Navigator.of(context).pop(),
        ),
        ListTile(
          leading: Icon(
            Icons.exit_to_app,
            color: Colors.brown[900],
            size: 50,
          ),
          title: Text(
            "Çıkış",
            style: TextStyle(fontSize: 30, color: Colors.brown[400]),
          ),
          onTap: () {
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => SignInPage()));
          },
        ),
      ]),
    );
  }
}
