import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() {
    return _LoginState();
  }
}

class _LoginState extends State<Login> {
  late TextEditingController _controller;
  FocusNode focusNode = FocusNode();
  String hintText = 'Phone, email address, or username';

  @override
  void initState() {
    _controller = TextEditingController();
    super.initState();
    focusNode.addListener(() {
      if (focusNode.hasFocus) {
        hintText = '';
      } else {
        hintText = 'Phone, email address, or username';
      }
      setState(() {});
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      bottom: true,
      // top: true,
      maintainBottomViewPadding: true,
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.close_rounded,
              color: Colors.black,
              size: size.width * .088,
            ),
          ),
          title: SizedBox(
            height: size.height * .095,
            width: size.width * .095,
            child: Image.asset("assets/twitter_logo.png"),
          ),
          centerTitle: true,
        ),
        body: SizedBox(
          width: size.width,
          height: size.height,
          // padding: const EdgeInsets.all(8.0),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Stack(
              children: [
                _topPortion(size),
                _forgotButton(size),
                _nextButton(size),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Align _nextButton(Size size) {
    return Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: size.height * .05,
                    width: size.width * .2,
                    decoration: BoxDecoration(
                        color: Colors.black54,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(width: 1)),
                    child: const Center(
                        child: Text(
                      "Next",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white54),
                    )),
                  ),
                ),
              );
  }

  Align _forgotButton(Size size) {
    return Align(
                alignment: Alignment.bottomLeft,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: size.height * .05,
                    width: size.width * .4,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(width: 1)),
                    child: const Center(
                        child: Text(
                      "Forgot Password?",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )),
                  ),
                ),
              );
  }

  Positioned _topPortion(Size size) {
    return Positioned(
                top: size.height * .01,
                right: 2,
                left: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    AutoSizeText(
                      'To get started, first enter your phone,email address or @username',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          fontSize: size.width * 0.066,
                          fontWeight: FontWeight.w800,
                          letterSpacing: 2,
                          wordSpacing: 1 ),
                    ),
                    SizedBox(
                      height: size.height * .02,
                    ),
                    SizedBox(
                      height: size.height * .09,
                      width: size.width,
                      child: TextFormField(
                        focusNode: focusNode,
                        controller: _controller,
                        style: const TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                        ),
                        decoration: InputDecoration(
                          focusColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(6.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Colors.blue, width: 1.0),
                            borderRadius: BorderRadius.circular(6.0),
                          ),
                          fillColor: Colors.grey,
                          labelText: 'Phone, email address, or username',
                          labelStyle: const TextStyle(
                            color: Colors.grey,
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                          ),
                          floatingLabelStyle: const TextStyle(
                            color: Colors.blueAccent,
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
  }
}

