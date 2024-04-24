import 'package:flutter/material.dart';
import 'package:online_shop/pages/login.dart';
import 'package:online_shop/pages/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/': (context) => const LoginScreen(),
        LoginScreen.route: (context) => const LoginScreen(),
        Home.route: (context) => Home(),
      },
      initialRoute: '/',
    );
  }
}
