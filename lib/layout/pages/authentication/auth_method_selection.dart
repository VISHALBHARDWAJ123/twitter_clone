// ignore_for_file: unnecessary_null_comparison, prefer_typing_uninitialized_variables

import 'package:auto_size_text/auto_size_text.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:twiiter_clone/layout/pages/authentication/sign_up.dart';
import 'package:twiiter_clone/layout/widgets/custom_app_bar.dart';
import '../home_screen/home_screen.dart';
import '../twitter_conditions/twitter_conditions.dart';
import 'login.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() {
    return _WelcomeScreenState();
  }
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  final FirebaseAuth authentication = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      bottom: true,
      maintainBottomViewPadding: true,
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: Colors.white,
        appBar: const CustomAppBar(
          iconVisible: false,
          icon: Icons.tag,
        ),
        body: SizedBox(
          width: size.width,
          height: size.height,
          child: Padding(
            padding: EdgeInsets.only(
              right: size.height * .053,
              left: size.height * .053,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _topArea(size),
                _googleOrAccount(context, size),
                _bottomArea(size),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _topArea(Size size) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(top: size.height * .11),
          child: AutoSizeText(
            'See what\'s happening in the world right now.',
            textAlign: TextAlign.left,
            style: TextStyle(
              fontFamily: "Helvetica Neue Font",
              fontSize: size.width * .1,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }

  /*Sign in with google or Create account*/
  Widget _googleOrAccount(BuildContext context, Size size) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          height: size.height * .06,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              width: 1,
              color: Colors.black.withOpacity(0.2),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: size.width * .075,
                width: size.width * .075,
                child: Image.asset("assets/logo/google_logo.png"),
              ),
              InkWell(
                onTap: () {
                  // _googleSignIn(context).then((value) {
                  //   // if(value.contains('Logged In')) {
                  //     Navigator.push(context, MaterialPageRoute(builder: (context) => const SignOut()));
                  //   // } else {
                  //   //   Navigator.push(context, MaterialPageRoute(builder: (context) => const WelcomeScreen()));
                  //   // }
                  // });
                  _googleSignIn(context).whenComplete(() => Navigator.push(context, MaterialPageRoute(builder: (context) => const HomeScreen())));
                },
                child: Padding(
                  padding: EdgeInsets.only(left: size.width * .015),
                  child: Text(
                    "Continue with Google",
                    style: TextStyle(
                      fontSize: size.width * .045,
                      fontFamily: "Helvetica Neue Font",
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            top: size.height * .005,
            bottom: size.height * .005,
          ),
          child: Row(
            children: <Widget>[
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(right: size.width * .05),
                  child: const Divider(),
                ),
              ),
              Text(
                "or",
                style: TextStyle(
                  fontFamily: "Helvetica Neue Font",
                  fontSize: size.width * .03,
                ),
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(left: size.width * .05),
                  child: const Divider(),
                ),
              ),
            ],
          ),
        ),
        InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const SignUp(),
              ),
            );
          },
          splashColor: Colors.white,
          child: Container(
            height: size.height * .06,
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                width: 1,
                color: Colors.black.withOpacity(0.2),
              ),
            ),
            child: Center(
              child: Text(
                "Create account",
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: "Helvetica Neue Font",
                  fontSize: size.width * .045,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: size.height * .03),
          child: RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: "By signing up, you agree to our ",
                  style: TextStyle(
                    fontFamily: "Helvetica Neue Font",
                    fontSize: size.width * .041,
                    color: Colors.black,
                  ),
                ),
                TextSpan(
                  text: "Terms, ",
                  style: TextStyle(
                    fontFamily: "Helvetica Neue Font",
                    fontSize: size.width * .041,
                    color: Colors.blue,
                  ),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () async {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => TwitterConditions(
                                  link: "https://twitter.com/en/tos")));
                    },
                ),
                TextSpan(
                  text: "Privacy Policy",
                  style: TextStyle(
                    fontFamily: "Helvetica Neue Font",
                    fontSize: size.width * .041,
                    color: Colors.blue,
                  ),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () async {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => TwitterConditions(
                                  link: "https://twitter.com/en/privacy")));
                    },
                ),
                TextSpan(
                  text: " and ",
                  style: TextStyle(
                    fontFamily: "Helvetica Neue Font",
                    fontSize: size.width * .041,
                    color: Colors.black,
                  ),
                ),
                TextSpan(
                  text: "Cookie Use",
                  style: TextStyle(
                    fontFamily: "Helvetica Neue Font",
                    fontSize: size.width * .041,
                    color: Colors.blue,
                  ),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () async {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => TwitterConditions(
                                  link:
                                      "https://help.twitter.com/en/rules-and-policies/twitter-cookies")));
                    },
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _bottomArea(Size size) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(bottom: size.height * .06),
          child: RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: "Have an account already?  ",
                  style: TextStyle(
                    fontFamily: "Helvetica Neue Font",
                    fontSize: size.width * .046,
                    color: Colors.black,
                  ),
                ),
                TextSpan(
                  text: "Log in",
                  style: TextStyle(
                    fontFamily: "Helvetica Neue Font",
                    fontSize: size.width * .046,
                    color: Colors.blue,
                  ),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Login(),
                        ),
                      );
                    },
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Future<void> _googleSignIn(BuildContext context) async {

    final GoogleSignInAccount? googleSignInAccount =
        await googleSignIn.signIn();
    // var checkLogin;

    if (googleSignInAccount != null) {
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount.authentication;

      final AuthCredential authCredential = GoogleAuthProvider.credential(
          idToken: googleSignInAuthentication.idToken,
          accessToken: googleSignInAuthentication.accessToken);

      UserCredential result =
          await authentication.signInWithCredential(authCredential);
      User? user = result.user;

      var email = googleSignInAccount.email;
      // checkLogin = await authentication.fetchSignInMethodsForEmail(email);


      // if (result != null) {
      //   if (!mounted)
      //   // Navigator.push(context,
      //   //     MaterialPageRoute(builder: (context) => const MyHomePage()));
      // }
    }

    // if(checkLogin.contains('google.com')) {
    //   return 'Logged In';
    // } else {
    //   return 'Not Logged In';
    // }
  }
}
