// ignore_for_file: use_super_parameters, unused_import
import 'package:flutter/material.dart';
import './auth/login.dart';
import './auth/register.dart';
import './pages/landingpage.dart';
import './pages/Homepage.dart';
import './pages/Accomodationpop.dart';
import './pages/lake.dart';
import './pages/shoppingpopup.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ProfilePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.0), // Adjust the height of the AppBar
        child: Container(
          decoration: BoxDecoration(
            color: Colors.green[700], // Green background for the AppBar
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.3), // Shadow color
                spreadRadius: 2, // Spread radius
                blurRadius: 8, // Blur radius
                offset: Offset(
                    0, 3), // Offset to make the shadow visible at the bottom
              ),
            ],
          ),
          child: AppBar(
            backgroundColor:
                Colors.transparent, // Transparent to show custom color
            elevation: 0, // Remove default elevation
            title: Row(
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
                icon: Icon(Icons.menu),
                onPressed: () {},
                color: Colors
                    .white, // Ensures the icon remains visible on green background
              ),
            ],
          ),
        ),
      ),
      body: Stack(
        children: [
          // Background split into green and white (2/4)
          Column(
            children: [
              Expanded(
                flex: 2, // Green 50% of the screen
                child: Container(
                  color: Colors.green[700],
                ),
              ),
              Expanded(
                flex: 4, // White bottom 50% of the screen
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
                      margin: EdgeInsets.only(top: 120, left: 20, right: 20),
                      padding:
                          EdgeInsets.symmetric(vertical: 30, horizontal: 20),
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          SizedBox(height: 70), // Space for the profile image
                          buildTextField("Full names", "Divine Birasa Ishimwe"),
                          SizedBox(height: 20),
                          buildTextField("Address", "Kigali, Rwanda"),
                          SizedBox(height: 20),
                          buildTextField("Contact", ""),
                          SizedBox(height: 20),
                          buildTextField("Email", "hello@gmail.com"),
                          SizedBox(height: 20),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green[700],
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            onPressed: () {},
                            child: Text("Edit Profile"),
                          ),
                        ],
                      ),
                    ),
                    // Profile Image
                    Positioned(
                      top: 50,
                      left: MediaQuery.of(context).size.width / 2 - 50,
                      child: CircleAvatar(
                        radius: 50,
                        backgroundImage: AssetImage(
                            'assets/profile.jpg'), // Ensure the path is correct
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
              color: Colors.black.withOpacity(0.2), // Shadow color
              spreadRadius: 5, // Spread radius of the shadow
              blurRadius: 10, // How much the shadow will blur
              offset: Offset(0, 3), // Changes position of shadow
            ),
          ],
        ),
        child: BottomNavigationBar(
          backgroundColor: Colors.green[700],
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white70,
          items: [
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

  // Custom TextField Builder
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
}

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
      '/lakepopup':(context)=>const Lake(),
      '/shoppopup':(context)=>const shopping(),
    },
  );
}