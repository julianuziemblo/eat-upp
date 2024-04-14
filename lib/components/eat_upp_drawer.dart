import 'package:flutter/material.dart';

class EatUppDrawer extends StatelessWidget {
  const EatUppDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: const EdgeInsets.all(8.0),
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(color: Colors.white),
            child: IconButton(
              icon: Image.asset('assets/logo-full.png', height: 150),
              onPressed: () => Navigator.popUntil(
                context,
                ModalRoute.withName("/home"),
              ),
            ),
          ),
          ListTile(
            title: const Text('Mój profil'),
            leading: CircleAvatar(
              backgroundColor: Theme.of(context).primaryColor,
              backgroundImage: const NetworkImage(
                  'https://cdn-icons-png.flaticon.com/512/6386/6386976.png',
                  scale: 0.000001),
            ),
          ),
          const ListTile(
            title: Text('Języki'),
            leading: Icon(Icons.language),
          ),
          const ListTile(
            title: Text('Ustawienia'),
            leading: Icon(Icons.settings),
          ),
        ],
      ),
    );
  }
}
