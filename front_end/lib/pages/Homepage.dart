// ignore_for_file: library_private_types_in_public_api, use_super_parameters, prefer_const_constructors, unused_element

import 'package:flutter/material.dart';
import './accomodation.dart';
import './nationalparks.dart';
import './shoppingDinning.dart';
import './lake.dart';
import './Profile.dart';
import './search_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  bool _isMenuOpen = false;

  // Pages that will correspond to the BottomNavigationBar items
  final List<Widget> _pages = [
    const MainContent(),
    SearchScreen(),
    ProfilePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _toggleMenu() {
    setState(() {
      _isMenuOpen = !_isMenuOpen;
    });
  }

  void _navigateToPage(String route) {
    Navigator.of(context).push(MaterialPageRoute(builder: (_) {
      switch (route) {
        case '/accomodation':
          return Accomodation();
        case '/nationalparks':
          return Nationalpark();
        case '/lakes':
          return Lake();
        case '/shopping':
          return ShoppindAndDinning();
        case '/profile':
          return ProfilePage();
        case '/search':
          return SearchScreen();
        default:
          return HomePage();
      }
    }));
    _toggleMenu(); // Close menu after navigation
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _pages[_selectedIndex],
          if (_isMenuOpen)
            GestureDetector(
              onTap: _toggleMenu,
              child: Container(
                color: Colors.black54,
                width: double.infinity,
                height: double.infinity,
              ),
            ),
          if (_isMenuOpen)
            Positioned(
              top: 0,
              right: 0,
              bottom: 0,
              width: MediaQuery.of(context).size.width * 0.75,
              child: _buildMenuDrawer(),
            ),
        ],
      ),
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

  Widget _buildMenuDrawer() {
  return Container(
    color: const Color(0xFF025719),
    child: Column(
      children: [
        Container(
          padding: const EdgeInsets.all(16),
          alignment: Alignment.centerRight,
          child: IconButton(
            icon: const Text(
              'X',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            onPressed: _toggleMenu,
          ),
        ),
         _buildMenuItem('Home', Icons.home, '/homepage'),
            const Divider(color: Colors.white24, height: 1),
            _buildMenuItem('Categories', Icons.category, '/accomodation'),
            const Divider(color: Colors.white24, height: 1),
            _buildMenuItem('Map', Icons.map, '/map'),
            const Divider(color: Colors.white24, height: 1),
            _buildMenuItem('Search', Icons.search, '/search'),
            const Divider(color: Colors.white24, height: 1),
            _buildMenuItem('Profile', Icons.person, '/profile'),
            const Divider(color: Colors.white24, height: 1),
            _buildMenuItem('Support', Icons.support_agent, '/support'),
            const Divider(color: Colors.white24, height: 1),
      ],
    ),
  );
}

  Widget _buildMenuItem(String title, IconData icon, String route) {
    return ListTile(
      leading: Icon(icon, color: Colors.white),
      title: Text(
        title,
        style: const TextStyle(color: Colors.white),
      ),
      onTap: () => _navigateToPage(route),
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
    final homeState = context.findAncestorStateOfType<_HomePageState>();
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
            onPressed: () => homeState?._toggleMenu(),
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
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                _buildCategoryItem(
                    context, Icons.apartment, 'Accommodation', Accomodation()),
                SizedBox(width: 16),
                _buildCategoryItem(
                    context, Icons.landscape, 'National Parks', Nationalpark()),
                SizedBox(width: 16),
                _buildCategoryItem(context, Icons.water, 'Lakes', Lake()),
                SizedBox(width: 16),
                _buildCategoryItem(context, Icons.shopping_cart, 'Shopping',
                    ShoppindAndDinning()),
              ],
            ),
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
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.0),
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
    SearchScreen(),
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
