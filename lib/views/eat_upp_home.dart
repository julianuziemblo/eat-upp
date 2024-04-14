import 'package:eat_upp/components/eat_upp_bottom_navigation_bar.dart';
import 'package:eat_upp/components/eat_upp_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import '../components/eat_upp_app_bar.dart';

class EatUppHome extends HookWidget {
  const EatUppHome({super.key});
  static int numOfClicks = 0;

  final buttonSize = 300.0;

  @override
  Widget build(BuildContext context) {
    final buttonTextColor = useState(0xffffffff);
    final bs = useState(buttonSize);

    return Scaffold(
      appBar: const EatUppAppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AnimatedContainer(
              duration: const Duration(seconds: 1),
              width: bs.value,
              height: bs.value,
              child: TextButton(
                onPressed: () {
                  bs.value = MediaQuery.of(context).size.width;
                  Future.delayed(const Duration(seconds: 1));
                  Navigator.pushNamed(context, '/locations');
                },
                child: Container(
                  width: buttonSize,
                  height: buttonSize,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(250),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        //offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Eat Upp',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Color(buttonTextColor.value),
                              fontSize: 50,
                              fontFamily: 'Sans Serif',
                              fontWeight: FontWeight.bold)),
                      const SizedBox(
                        height: 15,
                      ),
                      const Text(
                        'Przegladaj\nrestauracje w\nTwojej okolicy',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xfff8da78),
                          fontSize: 20,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      drawer: const EatUppDrawer(),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () => {},
      //   tooltip: '🍕',
      //   backgroundColor: MyApp.mainColor,
      //   child: const Icon(Icons.add),
      // ),
      bottomNavigationBar: const EatUppBottomNavigationBar(
        currentIndex: 1,
      ),
    );
  }
}
