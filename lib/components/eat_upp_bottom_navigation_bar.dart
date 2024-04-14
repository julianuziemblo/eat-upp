import 'package:flutter/material.dart';

class EatUppBottomNavigationBar extends StatelessWidget {
  const EatUppBottomNavigationBar({
    super.key,
    required this.currentIndex,
  });

  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const [
        BottomNavigationBarItem(
            icon: ImageIcon(AssetImage("assets/utensils.png"), size: 45),
            label: ''),
        BottomNavigationBarItem(
            icon: ImageIcon(AssetImage('assets/home.png'), size: 54),
            label: ''),
        BottomNavigationBarItem(
            icon: ImageIcon(AssetImage('assets/location_pin.png'), size: 58),
            label: ''),
      ],
      backgroundColor: Colors.white,
      fixedColor: Colors.black,
      showUnselectedLabels: true,
      unselectedItemColor: const Color(0x44ffffff),
      selectedIconTheme: IconThemeData(
        color: Theme.of(context).primaryColor,
        shadows: const [
          Shadow(
            blurRadius: 10,
            offset: Offset.zero,
            color: Color(0xfff8da78),
          ),
        ],
      ),
      unselectedIconTheme: IconThemeData(
        color: const Color(0xfff8da78),
        shadows: [
          Shadow(
            blurRadius: 10,
            offset: Offset.zero,
            color: Theme.of(context).primaryColor,
          ),
        ],
      ),
      currentIndex: currentIndex,
      onTap: (value) => {
        if (value != currentIndex)
          {
            if (value == 0)
              Navigator.pushNamed(context, "/restaurants")
            else if (value == 1)
              {
                if (Navigator.canPop(context))
                  Navigator.popUntil(context, ModalRoute.withName('/home'))
                else
                  Navigator.pushNamed(context, "/home")
              }
            else if (value == 2)
              Navigator.pushNamed(context, "/locations")
          }
      },
    );
  }
}
