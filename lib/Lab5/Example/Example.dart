import 'package:flutter/material.dart';
import 'package:online_shop/Lab5/Example/login_screen.dart';
import 'package:online_shop/Lab5/Example/stopwatch.dart';

class Example1 extends StatefulWidget {
  const Example1({super.key});

  @override
  State<Example1> createState() => _Example1State();
}

class _Example1State extends State<Example1> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/': (context) => const LoginScreen(),
        LoginScreen.route: (context) => const LoginScreen(),
        StopWatch.route: (context) => const StopWatch(),
      },
      initialRoute: '/',
    );
  }
}
