import 'package:eat_upp/views/eat_upp_home.dart';
import 'package:eat_upp/views/location_screen.dart';
import 'package:eat_upp/views/restaurant_screen.dart';
import 'package:eat_upp/views/second_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  static const _mainColor = Color(0xff70ad47);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'EatUpp',
        initialRoute: '/home',
        theme: ThemeData(fontFamily: 'Sans Serif', primaryColor: _mainColor),
        routes: {
          '/home': (context) => const EatUppHome(),
          '/secondScreen': (context) => const SecondScreen(),
          '/locations': (context) => LocationScreen(),
          '/restaurants': (context) {
            if (EatUppHome.numOfClicks % 11 == 10) {
              return RestaurantScreen(
                restaurantData: Restaurant(
                  name: 'Sussy Restaurant',
                  address:
                      'Stacja Kosmiczna ISS\nOrbita 213-7\n18-209 Geostacjonarna',
                  stars: 1,
                  image: Image.asset('assets/restaurant2.png'),
                  hours: '24h/7dni',
                ),
              );
            } else {
              EatUppHome.numOfClicks++;
              return RestaurantScreen(
                restaurantData: Restaurant(
                  name: 'Polecana: Coffix',
                  address: 'Nowowiejska 15/19\n00-665 Warszawa',
                  stars: 5,
                  image: Image.asset('assets/coffix.png'),
                  hours: '24h/7dni',
                ),
              );
            }
          },
        });
  }
}

class Menu {
  Menu({required this.name, this.icon, this.subMenu});

  final String name;
  final IconData? icon;
  List<Menu>? subMenu = [];
}
