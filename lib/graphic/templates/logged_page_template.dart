// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:post_box/constans/colors.dart';
import 'package:post_box/constans/strings.dart';
import 'package:post_box/utils/userSharedPreferences.dart';

class LoggedPageTemplate extends StatelessWidget {
  final Widget? body;
  final String title;
  const LoggedPageTemplate({
    Key? key,
    this.body,
    this.title = "",
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //final login = UserSharedPreferences.getLogin();
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        bottomOpacity: 0.0,
        elevation: 0.0,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFFE0852F), Color(0xFFE6AB75)],
            ),
          ),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text(UserSharedPreferences.getLogin().toString(),
                  style: const TextStyle(fontSize: 20)),
              accountEmail: null,
              currentAccountPicture: const CircleAvatar(
                backgroundImage: AssetImage('assets/images/def_avatar.png'),
              ),
              //decoration: BoxDecoration(color: DARK_GRADIENT_COLOR),
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      colors: [DARK_GRADIENT_COLOR, LIGHT_GRADIENT_COLOR])),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text("Home"),
              onTap: () => Navigator.pushNamed(context, HOME_ROUTE),
            ),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text("Profile"),
              onTap: () => Navigator.pushNamed(context, PROFILE_ROUTE),
            ),
            ListTile(
              //tileColor: Colors.red[00],
              leading: const Icon(Icons.logout),
              title: const Text("Logout"),
              onTap: () async {
                await UserSharedPreferences.setToken("");
                await UserSharedPreferences.setLogin("");
                Navigator.pushNamedAndRemoveUntil(
                    context, START_ROUTE, (Route<dynamic> route) => false);
              },
            )
          ],
        ),
      ),
      backgroundColor: const Color.fromARGB(255, 242, 221, 202),
      body: body,
    );
  }
}
