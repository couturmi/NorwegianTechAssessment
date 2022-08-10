import 'package:flutter/material.dart';
import 'package:norwegian_tech_assessment/shared/app_strings.dart';

class WelcomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const WelcomeAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Center(
          child: Column(
        children: const [
          Text(
            AppStrings.welcomeToPrefix,
            style: TextStyle(fontSize: 14),
          ),
          Text(AppStrings.appTitle),
        ],
      )),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
