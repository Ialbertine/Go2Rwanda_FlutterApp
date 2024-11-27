// ignore_for_file: prefer_const_constructors, use_super_parameter

import 'package:flutter/material.dart';


class LandingPage extends StatelessWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand( 
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/waterfall.jpg'),
                  fit: BoxFit.cover, 
                  alignment: Alignment.center, 
                ),
              ),
            ),
            Container( // color background containers
              color: const Color.fromARGB(255, 57, 88, 58).withOpacity(0.5), // Black background with 50% opacity
            ),
            Center( // Centered container
              child: Container(
                padding: EdgeInsets.all(20),
                child: Column(
                  mainAxisSize: MainAxisSize.min, 
                  crossAxisAlignment: CrossAxisAlignment.center, 
                  children: [
                    Text(
                      'Go2Rwanda',
                      style: TextStyle(
                        fontSize: 50, 
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 20), 
                    Text(
                      'Travel  |  Discover  |  the beauty',
                      style: TextStyle(
                        fontSize: 23, 
                        color: Colors.white70
                      ),
                    ),
                    SizedBox(height: 70), 
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/register'); 
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: Colors.black,
                          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15), 
                        ),
                        child: Text(
                          'Get Started Here',
                          style: TextStyle(
                            fontSize: 20, 
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
