import 'dart:math';

import 'package:easy_search_bar/easy_search_bar.dart';
import 'package:eat_upp/components/eat_upp_app_bar.dart';
import 'package:eat_upp/components/eat_upp_bottom_navigation_bar.dart';
import 'package:eat_upp/components/eat_upp_drawer.dart';
import 'package:eat_upp/views/restaurant_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:photo_view/photo_view.dart';

class LocationScreen extends HookWidget {
  LocationScreen({super.key});

  final suggestions = <Marker>[
    const Marker('McDonald', 15, 15),
    const Marker('Burger King', 20.970015, 52.255585),
    const Marker('Pod Złotym Okoniem', 21.054241, 52.169457),
    const Marker('Niebo', 20.829321, 52.002931),
    const Marker('Chmury', 20.99992, 52.111111),
  ];

  static List<Color> colors = <Color>[
    const Color(0xffDDFFBB),
    const Color(0xffC7E9B0),
    const Color(0xffB3C99C),
    const Color(0xffA4BC92),
  ];

  final districts = <District>[
    District('Bemowo', colors[Random().nextInt(colors.length)]),
    District('Białołęka', colors[Random().nextInt(colors.length)]),
    District('Bielany', colors[Random().nextInt(colors.length)]),
    District('Mokotów', colors[Random().nextInt(colors.length)]),
    District('Ochota', colors[Random().nextInt(colors.length)]),
    District('Praga Południe', colors[Random().nextInt(colors.length)]),
    District('Praga Północ', colors[Random().nextInt(colors.length)]),
    District('Rembertów', colors[Random().nextInt(colors.length)]),
    District('Śródmieście', colors[Random().nextInt(colors.length)]),
    District('Targówek', colors[Random().nextInt(colors.length)]),
    District('Ursus', colors[Random().nextInt(colors.length)]),
    District('Ursynów', colors[Random().nextInt(colors.length)]),
    District('Warszawa', colors[Random().nextInt(colors.length)]),
    District('Wawer', colors[Random().nextInt(colors.length)]),
    District('Wesoła', colors[Random().nextInt(colors.length)]),
    District('Wilanów', colors[Random().nextInt(colors.length)]),
    District('Włochy', colors[Random().nextInt(colors.length)]),
    District('Wola', colors[Random().nextInt(colors.length)]),
    District('Żoliborz', colors[Random().nextInt(colors.length)]),
  ];

  List<String> getSuggestionNames() {
    List<String> res = [];
    for (var s in suggestions) {
      res.add(s.location);
    }
    return res;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const EatUppAppBar(),
      body: Stack(
        children: [
          SizedBox(
            height: 1000,
            child: TextButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => RestaurantScreen(
                    restaurantData: Restaurant(
                      image: Image.asset('assets/restaurant1.png'),
                      name: 'Krem',
                      stars: 4,
                      address:
                          'Jana i Jędrzeja\nŚniadeckich 18,\n00-656 Warszawa',
                      hours: '12:00 - 21:00',
                    ),
                  ),
                ),
              ),
              child: PhotoView(
                imageProvider: const AssetImage('assets/map.jpg'),
                minScale: 0.6,
              ),
            ),
          ),
          Positioned(
            top: 25,
            left: 25,
            right: 25,
            height: 60,
            child: EasySearchBar(
              title: const Text(''),
              suggestions: getSuggestionNames(),
              putActionsOnRight: true,
              onSuggestionTap: (data) => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => RestaurantScreen(
                    restaurantData: Restaurant(
                      image: Image.asset('assets/restaurant1.png'),
                      name: data,
                      stars: 4,
                      address:
                          'Jana i Jędrzeja\nŚniadeckich 18,\n00-656 Warszawa',
                      hours: '12:00 - 21:00',
                    ),
                  ),
                ),
              ),
              actions: [
                PopupMenuButton<Filter>(
                  constraints:
                      const BoxConstraints(minWidth: 300, minHeight: 500),
                  offset: const Offset(-20, 53),
                  color: Colors.grey[300],
                  itemBuilder: (context) => [
                    PopupMenuItem<Filter>(
                      value: Filter(name: ''),
                      child: const Text('Kuchnia'),
                    ),
                    PopupMenuItem<Filter>(
                      value: Filter(name: ''),
                      child: const Text('  \t\u2022 włoska'),
                    ),
                    PopupMenuItem<Filter>(
                      value: Filter(name: ''),
                      child: const Text('  \t\u2022 tajska'),
                    ),
                    PopupMenuItem<Filter>(
                      value: Filter(name: ''),
                      child: const Text('  \t\u2022 chińska'),
                    ),
                    PopupMenuItem<Filter>(
                      value: Filter(name: ''),
                      child: const Text('  \t\u2022 węgierska'),
                    ),
                    PopupMenuItem<Filter>(
                      value: Filter(name: ''),
                      child: const Text.rich(
                        TextSpan(
                          text: '    ',
                          children: [
                            TextSpan(
                              text: 'pokaż więcej',
                              style: TextStyle(
                                  decoration: TextDecoration.underline),
                            ),
                          ],
                        ),
                      ),
                    ),
                    PopupMenuItem<Filter>(
                      value: Filter(name: ''),
                      child: const Text('Czynne'),
                    ),
                    PopupMenuItem<Filter>(
                      value: Filter(name: ''),
                      child: const Text('  \t\u2022 12:00 - 21:00'),
                    ),
                    PopupMenuItem<Filter>(
                        value: Filter(name: ''),
                        child: const Text('  \t\u2022 całą dobę')),
                    PopupMenuItem<Filter>(
                      value: Filter(name: ''),
                      child: const Text.rich(
                        TextSpan(
                          text: '    ',
                          children: [
                            TextSpan(
                              text: 'pokaż więcej',
                              style: TextStyle(
                                  decoration: TextDecoration.underline),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                  icon: Icon(
                    Icons.more_vert_rounded,
                    color: Theme.of(context).primaryColor,
                    shadows: const [
                      Shadow(
                        blurRadius: 5,
                        color: Colors.black,
                      )
                    ],
                  ),
                ),
              ],
              searchClearIconTheme: IconThemeData(
                color: Theme.of(context).primaryColor,
              ),
              searchBackIconTheme: IconThemeData(
                color: Theme.of(context).primaryColor,
              ),
              searchHintText: 'Na co masz dziś ochotę...',
              searchHintStyle:
                  const TextStyle(color: Color.fromARGB(255, 90, 78, 41)),
              onSearch: (p0) => null,
              backgroundColor: const Color(0xfff8da78),
            ),
          ),
        ],
      ),
      drawer: const EatUppDrawer(),
      bottomNavigationBar: const EatUppBottomNavigationBar(currentIndex: 2),
    );
  }
}

class Marker {
  const Marker(this.location, this.latitude, this.longitude);

  final String location;
  final double latitude;
  final double longitude;
}

class District {
  const District(this.name, this.color);

  final String name;
  final Color color;
}

class Filter {
  Filter({required this.name});
  final String name;
}
