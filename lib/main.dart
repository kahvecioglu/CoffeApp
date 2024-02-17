import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:kendicoffeshop/modeller/providermodel.dart';
import 'package:kendicoffeshop/sayfalar/admin_page.dart';
import 'package:kendicoffeshop/sayfalar/home_page.dart';
import 'package:kendicoffeshop/sayfalar/signin_page.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Platform.isAndroid
      ? await Firebase.initializeApp(
          options: const FirebaseOptions(
            apiKey: "AIzaSyD8QxcWPoWqaH3B5NOSjU4fx2uYVCVo_50",
            appId: "1:613647940754:android:cf76882735bc94f897ba4b",
            messagingSenderId: "613647940754",
            projectId: "todoapp-e97ba",
          ),
        )
      : await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ProviderModel(),
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SignInPage(),
      ),
    );
  }
}
