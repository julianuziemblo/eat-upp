import 'package:eat_upp/components/eat_upp_app_bar.dart';
import 'package:eat_upp/components/eat_upp_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class SecondScreen extends HookWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const EatUppAppBar(),
      backgroundColor: const Color.fromARGB(255, 175, 226, 140),
      body: Center(
        child: Container(
          width: 350,
          height: 550,
          alignment: Alignment.center,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(
              Radius.circular(15),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black,
              ),
            ],
          ),
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Dziękujemy!',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.black, fontSize: 40, fontFamily: 'Limelight'),
              ),
              SizedBox(height: 10),
              Text(
                'Potwierdzenie\nrezerwacji wyślemy\nna twój email.',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.black, fontSize: 20),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const EatUppBottomNavigationBar(
        currentIndex: 0,
      ),
    );
  }
}
