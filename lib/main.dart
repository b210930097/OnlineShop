import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:online_shop/firebase_options.dart';
import 'package:online_shop/pages/sign_in.dart';
import 'package:online_shop/pages/home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
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
        '/': (context) => Home(),
        // SignIn.route: (context) => const SignIn(),
        Home.route: (context) => Home(),
      },
      initialRoute: '/',
    );
  }
}
