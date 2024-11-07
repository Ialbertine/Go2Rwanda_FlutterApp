import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
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

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Add Firebase configuration
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyDmkJcMcwRzphV5_FYBxqhqVv4rnjCCLCA",  // Replace with your Firebase API key
      appId: "1:2175104588:web:d0aab3fcb5e6cec91266e9",    // Replace with your Firebase App ID
      messagingSenderId: "2175104588", // Replace with your Messaging Sender ID
      projectId: "gotorwanda-3b144",    // Replace with your Firebase Project ID
      authDomain: "gotorwanda-3b144.firebaseapp.com",  // Replace with your Auth Domain
      storageBucket: "gotorwanda-3b144.firebasestorage.app", // Replace with your Storage Bucket
    ),
  );
  
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
      home: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          
          if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          }

          if (snapshot.hasData) {
            return const HomePage();
          }

          return const LandingPage();
        },
      ),
      routes: {
        '/login': (context) => const LoginPage(),
        '/register': (context) => const RegisterPage(),
        '/homepage': (context) => const HomePage(),
        '/profile': (context) => const ProfilePage(),
        '/accomodation': (context) => const Accomodation(),
        '/nationalpark': (context) => const Nationalpark(),
        '/third_page': (context) => ThirdPage(),
        '/search': (context) => const HomeScreen(),
        '/lake': (context) => const Lake(),
      },
    );
  }
}