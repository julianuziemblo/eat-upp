import 'package:eat_upp/components/eat_upp_app_bar.dart';
import 'package:eat_upp/components/eat_upp_bottom_navigation_bar.dart';
import 'package:eat_upp/components/eat_upp_drawer.dart';
import 'package:eat_upp/views/menu_screen.dart';
import 'package:eat_upp/views/reservation_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class RestaurantScreen extends HookWidget {
  const RestaurantScreen({super.key, required this.restaurantData});
  final Restaurant restaurantData;

  List<Container> getStars(int stars) {
    List<Container> starsList = [];
    for (int i = 0; i < stars; i++) {
      starsList.add(
        Container(
          margin: const EdgeInsets.all(8),
          child: Image.asset('assets/star.png'),
        ),
      );
    }

    return starsList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const EatUppAppBar(),
      body: Container(
        color: const Color.fromARGB(255, 175, 226, 140),
        width: 500,
        height: 1000,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              restaurantData.name,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontFamily: 'Limelight',
                fontSize: 40,
                color: Colors.black,
              ),
            ),
            Container(
              alignment: Alignment.center,
              width: 300,
              height: 1,
              color: Colors.black,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Image.asset('assets/location_pin.png', scale: 2.0),
                    Text(restaurantData.address),
                  ],
                ),
                Container(
                  margin: const EdgeInsets.only(left: 15, right: 15),
                  alignment: Alignment.center,
                  width: 1,
                  height: 50,
                  color: Colors.black,
                ),
                Container(
                  margin: const EdgeInsets.only(right: 58),
                  child: Text(
                    'Czynne:\n${restaurantData.hours}',
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 20),
                  ),
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.only(top: 10),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(15),
                ),
              ),
              child: restaurantData.image,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: getStars(restaurantData.stars),
            ),
            TextButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MenuScreen(),
                ),
              ),
              child: Container(
                width: 250,
                height: 50,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(15),
                  ),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black,
                    ),
                  ],
                ),
                child: const Text(
                  'ZOBACZ MENU',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 29,
                      fontFamily: 'LaoSansPro'),
                ),
              ),
            ),
            TextButton(
                onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ReservationScreen(),
                      ),
                    ),
                child: Container(
                  width: 250,
                  height: 50,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(15),
                    ),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black,
                      ),
                    ],
                  ),
                  child: const Text(
                    'REZERWUJ',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 29,
                        fontFamily: 'LaoSansPro'),
                  ),
                )),
          ],
        ),
      ),
      drawer: const EatUppDrawer(),
      bottomNavigationBar: const EatUppBottomNavigationBar(currentIndex: 0),
    );
  }
}

class Restaurant {
  Restaurant({
    required this.name,
    required this.address,
    required this.hours,
    required this.stars,
    required this.image,
  });

  String name;
  String address;
  String hours;
  int stars;
  Image image;
}
