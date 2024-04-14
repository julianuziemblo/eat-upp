import 'package:eat_upp/components/eat_upp_app_bar.dart';
import 'package:eat_upp/components/eat_upp_bottom_navigation_bar.dart';
import 'package:eat_upp/components/eat_upp_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class MenuScreen extends HookWidget {
  MenuScreen({super.key});

  final _menuItems = [
    MenuItem(
        image: const AssetImage('assets/grecka.png'),
        name: 'Sałatka grecka',
        price: 32.0),
    MenuItem(
        image: const AssetImage('assets/burger.png'),
        name: 'Hamburger',
        price: 42.0),
    MenuItem(
        image: const AssetImage('assets/french-toast.png'),
        name: 'Tosty na słodko',
        price: 25.0),
    MenuItem(
        image: const AssetImage('assets/pizza.png'),
        name: 'Pizza',
        price: 35.0),
    MenuItem(
        image: const AssetImage('assets/lody.png'),
        name: 'Deser lodowy',
        price: 20.0),
  ];

  Widget createMenuItems(menuItems, index, context) {
    if (index == -1) {
      return TextButton(
        onPressed: () => Navigator.pop(context),
        child: Container(
          margin: const EdgeInsets.all(5),
          width: 50,
          height: 50,
          child: Image.asset('assets/back-icon.png'),
        ),
      );
    }
    return Container(
      margin: const EdgeInsets.all(5),
      width: 400,
      height: 120,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: const Color(0x77777777)),
        borderRadius: const BorderRadius.all(
          Radius.circular(15),
        ),
        boxShadow: const [
          BoxShadow(
            color: Colors.black,
          ),
        ],
        image: DecorationImage(
          alignment: Alignment.center,
          fit: BoxFit.fitWidth,
          image: menuItems[index].image,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            width: 150,
            height: 70,
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: const Color(0x77777777)),
              borderRadius: const BorderRadius.all(
                Radius.circular(15),
              ),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black,
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  menuItems[index].name,
                  style: const TextStyle(
                    fontSize: 20,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  '${menuItems[index].price}0 PLN',
                  style: const TextStyle(
                    fontSize: 15,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const EatUppAppBar(),
      body: Container(
        alignment: Alignment.center,
        color: const Color.fromARGB(255, 175, 226, 140),
        child: ListView.builder(
          itemCount: _menuItems.length + 1,
          itemBuilder: (context, index) =>
              createMenuItems(_menuItems, index - 1, context),
        ),
      ),
      drawer: const EatUppDrawer(),
      bottomNavigationBar: const EatUppBottomNavigationBar(currentIndex: 0),
    );
  }
}

class MenuItem {
  MenuItem({required this.name, required this.price, required this.image});
  String name;
  double price;
  AssetImage image;
}
