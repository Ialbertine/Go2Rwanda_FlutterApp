// ignore_for_file: use_super_parameters, unused_import, use_key_in_widget_constructors, prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:front_end/pages/nationalparks.dart';
import './auth/login.dart';
import './auth/register.dart';
import './pages/landingpage.dart';
import './pages/Homepage.dart';
import './pages/accomodation.dart';
import './pages/Profile.dart';
import './pages/search_page.dart';
import './pages/third_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Go2Rwanda',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF2E7D32),
            foregroundColor: Colors.white,
          ),
        ),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
            foregroundColor: Colors.black,
            side: const BorderSide(color: Colors.grey),
          ),
        ),
      ),
      home: const LandingPage(),
      routes: {
        '/login': (context) => const LoginPage(),
        '/register': (context) => const RegisterPage(),
        '/homepage': (context) => const HomePage(),
        '/profile': (context) => ProfilePage(),
        '/accomodation': (context) => const MyAppAccom(),
        '/nationalpark': (context) => const Nationalpark(),
        '/search': (context) => const HomeScreen(),
        '/recent': (context) => ThirdPage()
      },
    );
  }
}
