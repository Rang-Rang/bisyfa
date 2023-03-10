import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:smart_medic/pages/login/login.dart';
import 'package:smart_medic/pages/my_home.dart';

class Logins extends StatefulWidget {
  static const routeName = '/logins';

  @override
  State<Logins> createState() => _LoginsState();
}

class _LoginsState extends State<Logins> {
  
  // controller password
  final emailController = TextEditingController();

  // controller password
  final passwordController = TextEditingController();

  // login firebase
  void signUserIn() async {

      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );

      Navigator.of(context).pushNamed(MyHome.routeName);

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.white,
        // bottomOpacity: 0.0,
        elevation: 0.0,
        centerTitle: true,
        title: Text(
          "Pasien Lama",
          style: TextStyle(
              fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
        ),
      ),
      body: Container(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(top: 60),
              child: Image.asset("assets/icon.png"),
            ),
            Container(
              padding: EdgeInsets.only(left: 40, right: 40, top: 20),
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.only(right: 277),
                    child: Text("Email"),
                  ),
                  TextField(
                    controller: emailController,
                    maxLines: 1,
                    decoration: InputDecoration(
                      // border: OutlineInputBorder(),
                      isDense: true, // Added this
                      contentPadding: EdgeInsets.all(8), // Added this
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 40, right: 40, top: 12),
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.only(right: 249),
                    child: Text("Password"),
                  ),
                  TextField(
                    controller: passwordController,
                    maxLines: 1,
                    obscureText: true,
                    decoration: InputDecoration(
                      // border: OutlineInputBorder(),
                      isDense: true, // Added this
                      contentPadding: EdgeInsets.all(8), // Added this
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 195),
              child: OutlinedButton(
                onPressed: () {
                  signUserIn();
                },
                child: Text(
                  "Kirim",
                  style: TextStyle(color: Colors.white),
                ),
                style: TextButton.styleFrom(
                  padding: EdgeInsets.only(left: 160, right: 160),
                  backgroundColor: Colors.deepPurple,
                  shape: StadiumBorder(),
                ),
              ),
            ),
            Container(
              // padding: EdgeInsets.only(top),
              child: OutlinedButton(
                onPressed: () {
                   Navigator.of(context).pushReplacementNamed(LoginPage.routeName);
                },
                child: Text(
                  "Pasien Baru",
                  style: TextStyle(color: Colors.white),
                ),
                style: TextButton.styleFrom(
                  padding: EdgeInsets.only(left: 140, right: 140),
                  backgroundColor: Colors.deepPurple,
                  shape: StadiumBorder(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
