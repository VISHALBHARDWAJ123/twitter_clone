import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:twiiter_clone/layout/widgets/custom_app_bar.dart';
import 'package:twiiter_clone/logic_source/provider_logic/business_logic.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() {
    return _SignUpState();
  }
}

class _SignUpState extends State<SignUp> {
  late TextEditingController _nameController;
  late TextEditingController _phoneController;
  late TextEditingController _dobController;
  final FocusNode phnFocusNode = FocusNode();
  bool checkVisibility = false;
  String emailOrPhone = 'Use email instead';

  // TextInputType keyboardType = TextInputType.phone;

  LogicalClass _logicalClass = LogicalClass();

  @override
  void initState() {
    super.initState();
    _logicalClass = Provider.of<LogicalClass>(context, listen: false);

    _nameController = TextEditingController();
    _phoneController = TextEditingController();
    _dobController = TextEditingController();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _dobController.dispose();
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
          icon: Icons.arrow_back_rounded,
        ),
        body: SizedBox(
          width: size.width,
          height: size.height,
          child: Stack(
            children: [
              _title(size),
              Positioned(
                top: size.height * .2,
                left: size.width * .1,
                child: _textFormFields(size),
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

  Widget _title(Size size) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(40, 16, 40, 16),
      child: AutoSizeText(
        'Create your account',
        textAlign: TextAlign.left,
        maxLines: 2,
        style: TextStyle(
            fontSize: size.width * 0.075,
            fontWeight: FontWeight.w800,
            letterSpacing: 2,
            wordSpacing: 1),
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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Visibility(
              visible: checkVisibility,
              child: SizedBox(
                height: size.height * .05,
                width: size.width * .52,
                child: Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: ElevatedButton(
                    onPressed: () {
                      FocusScope.of(context).unfocus();

                      _logicalClass.changeKeyboard();

                      Future.delayed(const Duration(milliseconds: 100))
                          .whenComplete(() => phnFocusNode.requestFocus());
                    },
                    style: ButtonStyle(
                      side: MaterialStateProperty.all<BorderSide>(BorderSide(
                          width: 1.5, color: Colors.black.withOpacity(0.25))),
                      elevation: MaterialStateProperty.all<double>(0),
                      shape: MaterialStateProperty.all<OutlinedBorder>(
                          const StadiumBorder()),
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.white),
                      overlayColor: MaterialStateProperty.resolveWith(
                        (states) {
                          return states.contains(MaterialState.pressed)
                              ? Colors.grey
                              : null;
                        },
                      ),
                    ),
                    child: Center(
                      child: Consumer<LogicalClass>(
                        builder: (context, value, _) => Text(
                          value.buttonText,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: size.width * .04,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              )),
          Padding(
            padding: const EdgeInsets.all(16.0),
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

  Widget _textFormFields(Size size) {
    return
       Column(
          children: [
            SizedBox(
              height: size.height * .12,
              width: size.width * .8,
              child: TextFormField(
                controller: _nameController,
                maxLength: 50,
                autofocus: true,
                style: const TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                ),
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                  focusColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(6.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.blue, width: 1.0),
                    borderRadius: BorderRadius.circular(6.0),
                  ),
                  fillColor: Colors.grey,
                  labelText: 'Name',
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
                onTap: () {
                  setState(() {
                    checkVisibility = false;
                  });
                },
              ),
            ),
            SizedBox(
              height: size.height * .02,
            ),
            SizedBox(
              height: size.height * .09,
              width: size.width * .8,
              child: Consumer<LogicalClass>(
                builder: (context, value, _) => TextFormField(
                  controller: _phoneController,
                  focusNode: phnFocusNode,
                  keyboardType: value.keyboardType,
                  textInputAction: TextInputAction.next,
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
                      borderSide: const BorderSide(color: Colors.blue, width: 1.0),
                      borderRadius: BorderRadius.circular(6.0),
                    ),
                    fillColor: Colors.grey,
                    labelText: 'Phone number or email address',
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
                  onTap: () {
                    setState(() {
                      checkVisibility = true;
                    });
                  },
                ),
              ),
            ),
            SizedBox(
              height: size.height * .05,
            ),
            SizedBox(
              height: size.height * .09,
              width: size.width * .8,
              child: TextFormField(
                controller: _dobController,
                textInputAction: TextInputAction.done,
                style: const TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                ),
                decoration: InputDecoration(
                  focusColor: Colors.white,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6.0),
                      borderSide: BorderSide(
                          width: 1, color: Colors.black.withOpacity(0.1))),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.blue, width: 1.0),
                    borderRadius: BorderRadius.circular(6.0),
                  ),
                  fillColor: Colors.grey,
                  labelText: 'Date of birth',
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
                onTap: () {
                  setState(() {
                    checkVisibility = false;
                  });
                },
              ),
            ),
          ],
    );
  }
}
