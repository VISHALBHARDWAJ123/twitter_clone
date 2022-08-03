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
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
            size: size.width * .085,
          ),
        ),
        title: SizedBox(
          height: size.height * .095,
          width: size.width * .095,
          child: Image.asset("assets/twitter_logo.png"),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: Container(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: size.height * .04,
              ),
              const Center(
                child: AutoSizeText(
                  'To get started, first enter your phone, email address or @username',
                  maxLines: 3,
                  style: TextStyle(fontSize: 27, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: size.height * .02,
              ),
              Center(
                child: SizedBox(
                  height: size.height * .09,
                  width: size.width * .9,
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
                        borderSide:
                            const BorderSide(color: Colors.blue, width: 1.0),
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
              ),
              SizedBox(
                height: size.height * .41,
              ),
              const Divider(
                color: Colors.black,
              ),
              SizedBox(
                height: size.height * .02,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: size.width * .02,
                  ),
                  SizedBox(
                    height: size.height * .05,
                    width: size.width * .4,
                    child: Container(
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
                  SizedBox(
                    width: size.width * .3,
                  ),
                  SizedBox(
                    height: size.height * .05,
                    width: size.width * .2,
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.black54,
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(width: 1)),
                      child: const Center(
                          child: Text(
                        "Next",
                        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white54),
                      )),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
