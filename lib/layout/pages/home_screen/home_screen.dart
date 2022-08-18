import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:twiiter_clone/layout/pages/authentication/auth_method_selection.dart';
import 'package:twiiter_clone/layout/widgets/custom_app_bar.dart';
import 'package:twiiter_clone/main.dart';

import '../drawer/drawer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() {
    return _HomeScreenState();
  }
}

class _HomeScreenState extends State<HomeScreen> {
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  void signOutGoogle() async {
    await _googleSignIn.signOut();
    log("User Sign Out");
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        drawer: DrawerXX(),
        appBar: CustomAppBar(iconVisible: true, icon: Icons.person,),
        body: Padding(
          padding: const EdgeInsets.all(48.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              const Center(
                child: Text(
                  'Welcome to twitter',
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.black54),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  signOutGoogle();
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const MyHomePage()));
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40)),
                ),
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Sign Out',
                    style: TextStyle(fontSize: 25, color: Colors.white),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
