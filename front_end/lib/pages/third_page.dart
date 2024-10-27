import 'package:flutter/material.dart';

//Recent searches

class ThirdPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          const Color.fromARGB(255, 10, 94, 10), // Green background
      appBar: AppBar(
        backgroundColor: const Color(0xFF006400),
        elevation: 0, // Remove the shadow
        title: const Text(
          'Go2Rwanda',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            const SizedBox(height: 16),
            // Search bar
            TextField(
              decoration: InputDecoration(
                hintText: 'Search for places............',
                prefixIcon: const Icon(Icons.search),
                filled: true,
                fillColor: Colors.white,
                contentPadding: const EdgeInsets.symmetric(vertical: 10),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
              ),
            ),
            const SizedBox(height: 20),

            // List of cards with place information
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: 0.75,
                ),
                itemCount: 3, // Number of cards to display
                itemBuilder: (context, index) {
                  return const PlaceCard(
                    placeName: 'Musanze',
                    activity: '~ Hiking',
                    description: 'Lorem ipsum lorem ipsum lorem ipsum',
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0xFF006400),
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white54,
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
    );
  }
}

class PlaceCard extends StatelessWidget {
  final String placeName;
  final String activity;
  final String description;

  const PlaceCard({
    super.key,
    required this.placeName,
    required this.activity,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      elevation: 2, // Subtle shadow for the card
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Green top section with background image
          Container(
            height: 100,
            width: double.infinity, // Ensures the image occupies full width
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(16.0),
              ),
              image: DecorationImage(
                image: AssetImage(
                    'assets/images/greenybackground.jpeg'), // Background image
                fit: BoxFit.cover, // Ensures image covers entire space
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    placeName,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.white, // White text for the green section
                    ),
                  ),
                  Text(
                    activity,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.white70, // Lighter white for subtitle
                    ),
                  ),
                ],
              ),
            ),
          ),
          // White middle section
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(12.0),
              color: Colors.white,
              child: Text(
                description,
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.black54,
                ),
              ),
            ),
          ),
          // Green "Learn More" button
          Container(
            padding: const EdgeInsets.all(8.0),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(16.0),
              ),
            ),
            child: Center(
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF006400), // Green button
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: const Text(
                  'Learn More',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.white, // White text on the button
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
