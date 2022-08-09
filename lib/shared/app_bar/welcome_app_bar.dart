import 'package:flutter/material.dart';

class WelcomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const WelcomeAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Center(
          child: Column(
        children: const [
          Text(
            "Welcome to",
            style: TextStyle(fontSize: 14),
          ),
          Text("Norwegian Cruise Lines"),
        ],
      )),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
