// ignore_for_file: use_super_parameters
import 'package:flutter/material.dart';
import './auth/login.dart';
import './auth/register.dart';
import './pages/landingpage.dart';
import 'pages/accomodation.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Go2Rwanda',
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
      home:MyAppAccom(),
      routes: {
        '/login': (context) => const LoginPage(),
        '/register': (context) => MyAppAccom(),
      },
    );
  }
}
