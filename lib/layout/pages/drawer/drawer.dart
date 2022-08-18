import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class DrawerXX extends StatefulWidget {
  const DrawerXX({Key? key, this.scaffoldKey}) : super(key: key);

  final GlobalKey<ScaffoldState>? scaffoldKey;

  @override
  State<DrawerXX> createState() {
    return _DrawerXXState();
  }
}

class _DrawerXXState extends State<DrawerXX> {

  Widget _drawerHeader() {
    return Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              height: 56,
              width: 56,
              margin: const EdgeInsets.only(left: 17, top: 10),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white, width: 2),
                borderRadius: BorderRadius.circular(28),
                image: DecorationImage(
                  image: NetworkImage('https://t3.ftcdn.net/jpg/03/46/83/96/240_F_346839683_6nAPzbhpSkIpb8pmAwufkC7c5eD7wYws.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            ListTile(
              onTap: () {},
              title: Row(
                children: <Widget>[
                  AutoSizeText("Account Name"),
                  const SizedBox(
                    width: 3,
                  ),
                  // Image.network("data:image/jpeg;base64,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")
                ],
              ),
              subtitle: AutoSizeText('@ account_user_name'),
              trailing: Icon(Icons.arrow_drop_down),
            ),
            Container(
              alignment: Alignment.center,
              child: Row(
                children: <Widget>[
                  const SizedBox(
                    width: 17,
                  ),
                  AutoSizeText("0 Following"),
                  const SizedBox(width: 10),
                  AutoSizeText("0 Follower"),
                ],
              ),
            ),
          ],
        ),
      );
  }

  ListTile _drawerListTiles(String title, IconData icon) {
    return ListTile(
      onTap: () {},
      leading: Padding(
        padding: const EdgeInsets.only(top: 5),
        child: Icon(icon)
      ),
      title: Padding(
        padding: const EdgeInsets.only(top: 5),
        child: AutoSizeText(title),
      )
    );
  }

  ListTile _drawerBottomListTiles(String title) {
    return ListTile(
        onTap: () {},
        title: Padding(
          padding: const EdgeInsets.only(top: 5),
          child: AutoSizeText(title),
        )
    );
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Drawer(
      child: SafeArea(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: size.height * .235,
              width: size.width,
              child: _drawerHeader(),
            ),
            SizedBox(width: size.width,child: const Divider()),
            Padding(
              padding: const EdgeInsets.only(bottom: 45),
              child: SizedBox(
                height: size.height * 0.57,
                width: size.width,
                child: ListView(
                  scrollDirection: Axis.vertical,
                  physics: const BouncingScrollPhysics(),
                  children: <Widget>[
                    _drawerListTiles('Profile', Icons.person),
                    _drawerListTiles('Lists', Icons.list_alt_sharp),
                    _drawerListTiles('Topics', Icons.topic),
                    _drawerListTiles("Bookmarks", Icons.bookmark_border_rounded),
                    _drawerListTiles("Moments", Icons.electric_bolt_rounded),
                    _drawerListTiles('Monetisation', Icons.money_rounded),
                    const Divider(),
                    _drawerListTiles("Twitter for Professionals", Icons.rocket_launch_rounded),
                    const Divider(),
                    _drawerBottomListTiles("Settings and privacy"),
                    _drawerBottomListTiles("Help Centre"),
                    ],
                ),
              ),
            ),
            const Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 16),
                child: Align(alignment: Alignment.centerLeft,child: Icon(Icons.light_mode_sharp),),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 16),
                child: Align(alignment: Alignment.centerRight, child: Icon(Icons.qr_code),),
              )
            ],
            )
          ],
        ),
      ),
    );
  }
}