import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  const CustomAppBar({Key? key, required this.icon}) : super(key: key);
  final IconData icon;
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
          child: _icon(context, icon)),
      title: SizedBox(
        height: size.height * .095,
        width: size.width * .095,
        child: Image.asset("assets/twitter_logo.png"),
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
