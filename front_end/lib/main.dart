// ignore_for_file: use_super_parameters, unused_import
import 'package:flutter/material.dart';
import './auth/login.dart';
import './auth/register.dart';
import './pages/landingpage.dart';
import './pages/Homepage.dart';
import './pages/Accomodationpop.dart';
import './pages/lake.dart';
import './pages/shoppingpopup.dart';
import './pages/Profile.dart';

void main() {
  runApp(const MyApp());
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
        '/Accpopup': (context) => const AccommodationScreen(),
        '/lakepopup': (context) => const Lake(),
        '/shoppopup': (context) => const shopping(),
        '/profile': (context) => const ProfilePage(),
      },
    );
  }
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  Widget buildTextField(String labelText, String placeholder) {
    return TextField(
      decoration: InputDecoration(
        labelText: labelText,
        hintText: placeholder,
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60.0),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.green[700],
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.3),
                spreadRadius: 2,
                blurRadius: 8,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            title: const Row(
              children: [
                Expanded(
                  child: Text(
                    'Go2Rwanda',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            actions: [
              IconButton(
                icon: const Icon(Icons.menu),
                onPressed: () {},
                color: Colors.white,
              ),
            ],
          ),
        ),
      ),
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                flex: 2,
                child: Container(
                  color: Colors.green[700],
                ),
              ),
              Expanded(
                flex: 4,
                child: Container(
                  color: Colors.white,
                ),
              ),
            ],
          ),
          Center(
            child: Column(
              children: [
                Stack(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 120, left: 20, right: 20),
                      padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          const SizedBox(height: 70),
                          buildTextField("Full names", "Divine Birasa Ishimwe"),
                          const SizedBox(height: 20),
                          buildTextField("Address", "Kigali, Rwanda"),
                          const SizedBox(height: 20),
                          buildTextField("Contact", ""),
                          const SizedBox(height: 20),
                          buildTextField("Email", "hello@gmail.com"),
                          const SizedBox(height: 20),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green[700],
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            onPressed: () {},
                            child: const Text("Edit Profile"),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      top: 50,
                      left: MediaQuery.of(context).size.width / 2 - 50,
                      child: const CircleAvatar(
                        radius: 50,
                        backgroundImage: AssetImage('assets/profile.jpg'),
                        backgroundColor: Colors.green,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              spreadRadius: 5,
              blurRadius: 10,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: BottomNavigationBar(
          backgroundColor: Colors.green[700],
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white70,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: '',
            ),
          ],
        ),
      ),
    );
  }
}