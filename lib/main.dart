import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:twiiter_clone/layout/pages/authentication/login.dart';
import 'package:twiiter_clone/logic_source/provider_logic/business_logic.dart';
import 'layout/pages/authentication/sign_up.dart';

void main() async {
  runZonedGuarded(
    () {
      runApp(const MyApp());
    },
    (error, stack) {
      log(error.toString());
    },
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      // create: (BuildContext context) => LogicalClass(),
      providers: [
        ChangeNotifierProvider(create: (_) => LogicalClass()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Twitter Clone',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),

        home: const MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Twitter Clone'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const SignUp()));
                },
                child: const Text("Sign Up")),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const Login()));
                },
                child: const Text("Go to Login")),
          ],
        ),
      ),
    );
  }
}
