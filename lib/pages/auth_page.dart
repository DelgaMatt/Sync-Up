import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:sync_up/features/authentication/auth_card.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              colors: [Colors.black, Color.fromARGB(133, 61, 61, 61)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Animate(
                  effects: const [
                    FadeEffect(duration: Duration(seconds: 3)),
                    ShimmerEffect(
                        duration: Duration(seconds: 3),
                        color: Color.fromARGB(255, 163, 163, 163))
                  ],
                  child: Container(
                    margin: const EdgeInsets.only(
                      top: 30,
                      bottom: 40,
                      left: 20,
                      right: 20,
                    ),
                    width: 300,
                    child:
                        Image.asset('lib/assets/images/logo/sync_up_logo.png'),
                  ),
                ),
                Animate(
                  effects: const [FadeEffect(duration: Duration(seconds: 2))],
                  child: const AuthCard(),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
