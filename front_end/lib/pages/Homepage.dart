// ignore_for_file: library_private_types_in_public_api, use_super_parameters, prefer_const_constructors

import 'package:flutter/material.dart';
import './accomodation.dart';
import './nationalparks.dart';
import './shoppingDinning.dart';
import './lake.dart';
import './Profile.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  // Pages that will correspond to the BottomNavigationBar items 
  final List<Widget> _pages = [
    const MainContent(),
    Placeholder(), // Search page placeholders
    ProfilePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex], // Show the selected page
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white70,
        backgroundColor: const Color(0xFF025719),
        onTap: _onItemTapped,
      ),
    );
  }
}

class MainContent extends StatelessWidget {
  const MainContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeader(context),
          const SizedBox(height: 20),
          _buildCategories(context),
          const SizedBox(height: 30),
          _buildViewPlaces(),
          const SizedBox(height: 20),
          _buildHotelGrid(),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      color: const Color(0xFF025719),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: Row(
        children: [
          IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.pop(context),
          ),
          const Spacer(),
          IconButton(
            icon: const Icon(Icons.menu, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
    );
  }

  Widget _buildCategories(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.0),
          child: Text(
            'Select category',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        const SizedBox(height: 16),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildCategoryItem(
                  context, Icons.apartment, 'Accommodation', Accomodation()),
              _buildCategoryItem(
                  context, Icons.landscape, 'National Parks', Nationalpark()),
              _buildCategoryItem(context, Icons.water, 'Lakes', Lake()),
              _buildCategoryItem(context, Icons.shopping_cart, 'Shopping',
                  ShoppindAndDinning()),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildCategoryItem(
      BuildContext context, IconData icon, String label, Widget page) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CategoryPageWrapper(
              page: page,
            ),
          ),
        );
      },
      child: Container(
        width: 85,
        height: 80,
        decoration: BoxDecoration(
          color: const Color(0xFFE8F5E9),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: const Color(0xFF4CAF50), size: 20),
            const SizedBox(height: 4),
            Text(
              label,
              style: const TextStyle(fontSize: 11),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildViewPlaces() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Text(
        'View places',
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  Widget _buildHotelGrid() {
    final List<Map<String, String>> places = [
      {'name': 'Cleo Hotel', 'image': 'assets/cleoimage.jpeg'},
      {'name': 'Rwiza Village', 'image': 'assets/rwizaa.jpg'},
      {'name': 'Grand Legacy', 'image': 'assets/legacy.jpg'},
      {'name': 'Marriot', 'image': 'assets/marriot.png'},
    ];

    return Expanded(
      child: GridView.builder(
        padding: const EdgeInsets.all(16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1.0,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemCount: places.length,
        itemBuilder: (context, index) {
          return _buildHotelCard(places[index]);
        },
      ),
    );
  }

  Widget _buildHotelCard(Map<String, String> place) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF4CAF50),
        borderRadius: BorderRadius.circular(12),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Stack(
          fit: StackFit.expand,
          children: [
            if (place['image'] != null)
              Image.asset(place['image']!, fit: BoxFit.cover),
            Positioned(
              left: 12,
              bottom: 12,
              child: Text(
                place['name']!,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Widget that wraps the pages from categories (Accommodation, Shopping, etc.) with the bottom navigation
class CategoryPageWrapper extends StatefulWidget {
  final Widget page;

  const CategoryPageWrapper({required this.page, Key? key}) : super(key: key);

  @override
  _CategoryPageWrapperState createState() => _CategoryPageWrapperState();
}

class _CategoryPageWrapperState extends State<CategoryPageWrapper> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const MainContent(),
    Placeholder(),
    ProfilePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    // Navigate to the correct page when tapping bottom nav item
    if (index == 0) {
      Navigator.pop(context); // Go back to home
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _selectedIndex == 0 ? widget.page : _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white70,
        backgroundColor: const Color(0xFF025719),
        onTap: _onItemTapped,
      ),
    );
  }
}
