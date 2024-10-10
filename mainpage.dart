import 'package:flutter/material.dart';
import 'package:proj_iti/cart.dart';
import 'package:proj_iti/login.dart';
import 'salad.dart';
import 'juices.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Mainpage extends StatefulWidget {
  final String username;
  const Mainpage({required this.username});

  @override
  State<Mainpage> createState() => _MainpageState();
}

class _MainpageState extends State<Mainpage> {
  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      Navigator.push(context, MaterialPageRoute(builder: (context) => login()));
    }
    return Scaffold(
      appBar: AppBar(
        title: Text("Main Page", style: TextStyle(color: Colors.white)),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart, color: Colors.white),
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => CartPage()));
            },
          ),
        ],
        backgroundColor: Color(0xff6b7c38),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 20.0),
        child: Column(
          children: [
            Text("Hello our fav customer ${widget.username}",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                )),
            SizedBox(
              height: 10,
            ),
            IconButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Juices()));
                },
                icon: Image.asset("assets/images/juices.jpg")),
            SizedBox(
              height: 20,
            ),
            IconButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Salad()));
                },
                icon: Image.asset("assets/images/salad.jpg")),
            SizedBox(
              height: 300,
            ),
            ElevatedButton(
                onPressed: () => {
                      FirebaseAuth.instance.signOut(),
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => login()))
                },
                child: Text("Sign Out"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xff6b7c38),
                  foregroundColor: Colors.white,
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                  textStyle:
                      TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                )),
          ],
        ),
      ),
    );
  }
}
