import 'package:flutter/material.dart';

class EatUppAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title = 'EatUpp';

  const EatUppAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: const Color(0xff70ad47),
      title: Row(
        children: [
          TextButton(
            child: Image.asset("assets/logo.png", width: 50, height: 50),
            onPressed: () =>
                Navigator.popUntil(context, ModalRoute.withName('/home')),
          ),
          Text(title),
        ],
      ),
      actions: [
        IconButton(
          icon: Image.asset('assets/search-icon.png'),
          onPressed: () => Navigator.pushNamed(context, '/locations'),
        )
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
