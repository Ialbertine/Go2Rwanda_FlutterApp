// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

class Place {
  final String name;
  final String category;
  final String image;
  final String description;
  final String? bookingUrl;

  Place({
    required this.name, 
    required this.category, 
    required this.image, 
    required this.description,
    this.bookingUrl
  });
}

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController searchController = TextEditingController();
  List<Place> filteredPlaces = [];
  String selectedCategory = 'All';
  bool isLoading = false;

  final List<String> categories = [
    'All', 'Accommodation', 'National Park', 'Lake', 'Shopping'
  ];

  @override
  void initState() {
    super.initState();
    _fetchPlaces();
  }

  Future<void> _fetchPlaces() async {
    setState(() {
      filteredPlaces = [
        Place(
          name: 'cleo hotel', 
          category: 'Accommodation', 
          image: 'assets/cleo.jpg',
          description: 'A beautiful accommodation'
        ),
        Place(
          name: 'gishwati park', 
          category: 'National Park', 
          image: 'assets/gishwati.jpg',
          description: 'A scenic national park'
        ),
      ];
      isLoading = false;
    });
  }

  void _filterPlaces(String query, String category) {
    setState(() {
      filteredPlaces = [
        Place(
          name: 'cleo hotel', 
          category: 'Accommodation', 
          image: 'cleo.jpg', 
          description: 'A beautiful accommodation'
        ),
        Place(
          name: 'gishwati park', 
          category: 'National Park', 
          image: 'gishwati.jpg', 
          description: 'A scenic national park'
        ),
      ].where((place) {
        final nameMatch = place.name.toLowerCase().contains(query.toLowerCase());
        final descriptionMatch = place.description.toLowerCase().contains(query.toLowerCase());
        final categoryMatch = category == 'All' || place.category == category;
        
        return (nameMatch || descriptionMatch) && categoryMatch;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double cardWidth = (screenWidth - 64) / 2;

    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Container(
            height: MediaQuery.of(context).size.height * 0.5,
            width: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/greenybackground.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          
          // Gradient Overlay
          Container(
            height: MediaQuery.of(context).size.height * 0.40,
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.black.withOpacity(0.7),
                  Colors.black.withOpacity(0.5),
                  Colors.black.withOpacity(0.3),
                  Colors.transparent,
                ],
              ),
            ),
          ),
          
          SafeArea(
            child: Column(
              children: [
                // App Bar
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.arrow_back, color: Colors.white, size: 28),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                      // Search Category Dropdown
                      DropdownButton<String>(
                        dropdownColor: const Color(0xFF1B5E20),
                        value: selectedCategory,
                        style: const TextStyle(color: Colors.white),
                        items: categories.map((String category) {
                          return DropdownMenuItem<String>(
                            value: category,
                            child: Text(category),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            selectedCategory = newValue!;
                            _filterPlaces(searchController.text, selectedCategory);
                          });
                        },
                      ),
                    ],
                  ),
                ),
                
                // Search Title
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 32.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Search Places',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 0.5,
                      ),
                    ),
                  ),
                ),
                
                // Search TextField
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 20),
                  child: TextField(
                    controller: searchController,
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.search, color: Colors.white),
                      hintText: 'Search for places...',
                      hintStyle: TextStyle(color: Colors.white.withOpacity(0.7)),
                      fillColor: Colors.white.withOpacity(0.2),
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide.none,
                      ),
                    ),
                    onChanged: (value) {
                      _filterPlaces(value, selectedCategory);
                    },
                  ),
                ),
                
                // Places Grid
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: isLoading
                        ? const Center(child: CircularProgressIndicator())
                        : filteredPlaces.isEmpty
                          ? const Center(child: Text('No places found'))
                          : GridView.builder(
                              padding: EdgeInsets.zero,
                              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                childAspectRatio: cardWidth / (cardWidth + 20),
                                crossAxisSpacing: 16,
                                mainAxisSpacing: 16,
                              ),
                              itemCount: filteredPlaces.length,
                              itemBuilder: (context, index) {
                                return PlaceCard(
                                  place: filteredPlaces[index],
                                );
                              },
                            ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class PlaceCard extends StatelessWidget {
  final Place place;

  const PlaceCard({
    super.key,
    required this.place,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset(
              place.image,
              fit: BoxFit.cover,
            ),
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.center,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    Colors.black.withOpacity(0.8),
                  ],
                ), 
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    place.name,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.5,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xFF1B5E20),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Text(
                      'Book',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 0.5,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}