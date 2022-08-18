// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  const CustomAppBar({Key? key, required this.icon, required this.iconVisible})
      : super(key: key);
  final IconData icon;
  final bool iconVisible;
  final Size appBarHeight = const Size.fromHeight(56.0);

  @override
  Size get preferredSize => appBarHeight;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.white,
      leading: Visibility(
        visible: iconVisible,
        child: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: _icon(context, icon)),
      ),
      title: SizedBox(
        height: size.height * .095,
        width: size.width * .095,
        child: Image.asset("assets/logo/twitter_logo.png"),
      ),
      centerTitle: true,
    );
  }

  Widget _icon(BuildContext context, IconData icon) {
    final size = MediaQuery.of(context).size;
    return Icon(
      icon,
      color: Colors.black,
      size: size.width * .088,
    );
  }
}

class ConditionsAppBar extends StatelessWidget with PreferredSizeWidget {
  const ConditionsAppBar({Key? key, required this.toClass}) : super(key: key);

  final toClass;
  final Size appBarHeight = const Size.fromHeight(56.0);

  @override
  Size get preferredSize => appBarHeight;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.white,
      leading: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: const Icon(
          Icons.arrow_back_rounded,
          color: Colors.black,
        ),
      ),
      title: const Text(
        "Twitter",
        style: TextStyle(color: Colors.black),
      ),
      actions: [
        GestureDetector(
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => toClass));
            },
            child: SizedBox(
              width: size.width * .25,
              child: Center(
                child: Text(
                  "Open in Browser".toUpperCase(),
                  style: const TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),
            ))
      ],
    );
  }
}
