import 'package:eat_upp/components/eat_upp_app_bar.dart';
import 'package:eat_upp/components/eat_upp_bottom_navigation_bar.dart';
import 'package:eat_upp/components/eat_upp_drawer.dart';
import 'package:eat_upp/views/second_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class ReservationScreen extends HookWidget {
  const ReservationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var liczbaMiejsc = useState(1);
    var rezerwujColor = useState(0x77777777);
    var buttonColor = useState(0xff34660f);
    var enabled = useState(false);
    var opacity = useState(0.0);
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 175, 226, 140),
      appBar: const EatUppAppBar(),
      body: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'Rezerwuj stolik',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Limelight',
                  fontSize: 40,
                  color: Colors.black,
                ),
              ),
              Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.only(top: 5, bottom: 25),
                width: 300,
                height: 1,
                color: Colors.black,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Text('Na godzinę:', style: TextStyle(fontSize: 25)),
                  Container(
                    width: 100,
                    height: 50,
                    margin: const EdgeInsets.only(left: 22),
                    decoration: BoxDecoration(
                      // color: Colors.white,
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
                    child: const TextField(
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 20),
                      decoration: InputDecoration(
                        hintText: '10:00',
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Text('Liczba miejsc:', style: TextStyle(fontSize: 25)),
                  Container(
                    width: 100,
                    height: 50,
                    decoration: BoxDecoration(
                      // color: Colors.white,
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
                    child: TextField(
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 20),
                      decoration: InputDecoration(
                        hintText: '${liczbaMiejsc.value}',
                      ),
                    ),
                  ),
                ],
              ),
              TextButton(
                onPressed: () {
                  enabled.value = true;
                  buttonColor.value = 0xff70ad47;
                  rezerwujColor.value = 0xffffffff;
                },
                child: Container(
                  margin: const EdgeInsets.only(top: 30, bottom: 15),
                  child: Image.asset('assets/room.png'),
                ),
              ),
              TextButton(
                onPressed: () {
                  if (enabled.value) {
                    enabled.value = false;
                    rezerwujColor.value = 0x77777777;
                    opacity.value = 50.0;
                    buttonColor.value = 0xff34660f;
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SecondScreen(),
                      ),
                    );
                  }
                },
                child: Container(
                  width: 250,
                  height: 50,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Color(buttonColor.value),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(15),
                    ),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black,
                      ),
                    ],
                  ),
                  child: Text(
                    'REZERWUJ',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(rezerwujColor.value),
                      fontSize: 29,
                      fontFamily: 'LaoSansPro',
                    ),
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            top: 300,
            left: 200,
            child: Image.asset(
              'assets/overlay-placeholder.png',
              opacity: AlwaysStoppedAnimation(opacity.value),
            ),
          ),
        ],
      ),
      drawer: const EatUppDrawer(),
      bottomNavigationBar: const EatUppBottomNavigationBar(
        currentIndex: 0,
      ),
    );
  }
}
