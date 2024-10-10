import 'package:flutter/material.dart';
import 'package:proj_iti/auth.dart';
import 'package:proj_iti/cart.dart';
import 'package:proj_iti/mainpage.dart';
import 'package:provider/provider.dart';
import 'cartclass.dart';
import 'salad.dart';
import 'juices.dart';
import 'login.dart'; 
import 'auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';// Assuming you have a login.dart file

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    ChangeNotifierProvider(
      create: (context) => CartModel(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: Auth(), 
      routes: {
        '/salad': (context) => Salad(),
        '/juices': (context) => Juices(),
        '/cart': (context) => CartPage(), 
      },
    );
  }
}
