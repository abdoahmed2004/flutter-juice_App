
import 'package:flutter/material.dart';
import 'Signup.dart';
import 'mainpage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
class login extends StatefulWidget {
  const login({super.key});

  @override
  State<login> createState() => _loginState();
}
class _loginState extends State<login> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController(); 
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
   Future<void> SignIN() async {
    if (emailController.text.isEmpty || passwordController.text.isEmpty) {
      // Handle empty fields
      print('Email or password is empty');
      return;
    }

    try {
      UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );

      // Retrieve additional user information from Firestore
      DocumentSnapshot userDoc = await FirebaseFirestore.instance.collection('users').doc(userCredential.user!.uid).get();
      String userName = userDoc['name'];

      // Navigate to the main page after successful sign-in
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Mainpage(username: userName)),
      );
    } catch (e) {
      print('Failed to sign in: $e');
      // Handle sign-in error (e.g., show a message to the user)
    }
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 150),
            child: Column(
              children: [
                Image.asset("assets/images/fruit.jpg"),
                SizedBox(
                  height: 30,
                ),
                Text("Let's Get Started",
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff6b7c38),
                    )),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextFormField(
                    controller: emailController,
                    decoration: InputDecoration(
                      label: Text("Email"),
                      suffixIcon: Icon(Icons.email),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextFormField(
                    controller: passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: "Password",
                      suffixIcon: Icon(Icons.lock),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: double.infinity,
                  height: 50,
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: ElevatedButton(
                    onPressed: () {
                      SignIN();
                    },
                    child: Text("Login"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xff6b7c38),
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(1),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Divider(
                        thickness: 2,
                        color: Colors.black,
                        indent: 20,
                        endIndent: 10,
                      ),
                    ),
                    Text("OR"),
                    Expanded(
                      child: Divider(
                        thickness: 2,
                        color: Colors.black,
                        indent: 10,
                        endIndent: 20,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: double.infinity,
                  height: 50,
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Signup()),
                      );
                    },
                    child: Text("Sign Up"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 58, 14, 204),
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(1),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
