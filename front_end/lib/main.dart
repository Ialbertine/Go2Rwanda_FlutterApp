import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import './auth/login.dart';
import './auth/register.dart';
import './pages/landingpage.dart';
import './pages/Homepage.dart';
import './pages/accomodation.dart';
import './pages/Profile.dart';
import './pages/lake.dart';
import './pages/shoppingDinning.dart';
import './pages/search_page.dart';
import './pages/third_page.dart';
import './pages/nationalparks.dart';
import './pages/support.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
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
      initialRoute: '/',
      routes: {
        '/': (context) => const LandingPage(),
        '/login': (context) => const LoginPage(),
        '/register': (context) => const RegisterPage(),
        '/homepage': (context) => const HomePage(),
        '/profile': (context) => const ProfilePage(),
        '/accomodation': (context) => const Accomodation(),
        '/nationalpark': (context) => const Nationalpark(),
        '/third_page': (context) => ThirdPage(),
        '/search': (context) => const HomeScreen(),
        '/lake': (context) => const Lake(),
        '/support':(context) => Support(),
      },
    );
  }
}