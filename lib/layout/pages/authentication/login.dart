import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:twiiter_clone/layout/widgets/custom_app_bar.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() {
    return _LoginState();
  }
}

class _LoginState extends State<Login> {
  late TextEditingController _controller;

  @override
  void initState() {
    _controller = TextEditingController();
    super.initState();
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
      maintainBottomViewPadding: true,
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: Colors.white,
        appBar: const CustomAppBar(
          iconVisible: true,
          icon: Icons.close_rounded,
        ),
        body: SizedBox(
          width: size.width,
          height: size.height,
          child: Stack(
            children: [
              Positioned(
                top: size.height * .025,
                right: size.width * .01,
                left: size.width * .01,
                child: _topPortion(size),
              ),
              Positioned(
                bottom: 0,
                child: _bottomArea(size),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _topPortion(Size size) {
    return Padding(
      padding: EdgeInsets.only(
        right: size.height * .03,
        left: size.height * .03,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          AutoSizeText(
            'To get started, first enter your phone, email address or @username',
            textAlign: TextAlign.left,
            style: TextStyle(
              fontSize: size.width * 0.066,
              fontWeight: FontWeight.w800,
              letterSpacing: 2,
              wordSpacing: 1,
              height: 1.3,
            ),
          ),
          SizedBox(
            height: size.height * .02,
          ),
          SizedBox(
            height: size.height * .09,
            width: size.width,
            child: TextFormField(
              controller: _controller,
              style: TextStyle(
                fontSize: size.width * .045,
                color: Colors.black,
              ),
              decoration: InputDecoration(
                focusColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(6.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: Colors.blue,
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.circular(6.0),
                ),
                fillColor: Colors.grey,
                labelText: 'Phone, email address, or username',
                labelStyle: TextStyle(
                  color: Colors.grey,
                  fontSize: size.width * .048,
                  fontWeight: FontWeight.w400,
                ),
                floatingLabelStyle: TextStyle(
                  color: Colors.blueAccent,
                  fontSize: size.width * .045,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _bottomArea(Size size) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            width: 1,
            color: Colors.black.withOpacity(0.1),
          ),
        ),
        color: Colors.white,
      ),
      height: size.height * .1,
      width: size.width,
      child: Stack(
        children: [
          Positioned(
            left: size.width * .03,
            top: size.height * .025,
            child: Container(
              height: size.height * .05,
              width: size.width * .48,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  width: 1.5,
                  color: Colors.black.withOpacity(0.25),
                ),
              ),
              child: Center(
                child: Text(
                  "Forgot password?",
                  style: TextStyle(
                    fontSize: size.width * .04,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            right: size.width * .03,
            top: size.height * .025,
            child: Container(
              height: size.height * .05,
              width: size.width * .2,
              decoration: BoxDecoration(
                color: Colors.black54,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  width: 1.5,
                  color: Colors.black.withOpacity(0.25),
                ),
              ),
              child: Center(
                child: Text(
                  "Next",
                  style: TextStyle(
                    fontSize: size.width * .04,
                    fontWeight: FontWeight.bold,
                    color: Colors.white54,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

