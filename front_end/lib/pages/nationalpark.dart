import 'package:flutter/material.dart';

class Nationalpark extends StatelessWidget {
  const Nationalpark({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Images
          Column(
            children: [
              // First image at the top with text
              Expanded(
                flex: 2,
                child: Stack(
                  children: [
                    Image.asset(
                      'assets/bgimage.png', // Top image
                      fit: BoxFit.cover,
                      width: double.infinity,
                    ),
                    // Overlay text on the top image
                    Center(
                      child: Container(
                        padding: const EdgeInsets.all(16.0),
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.5), // Semi-transparent overlay
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: const Text(
                          'Nationalpark',
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10), // Space between rows
              // First row of two images
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildImageCard('assets/bgimage.png', 'Cleo Hotel'),
                  _buildImageCard('assets/bgimage.png', 'Cleo Hotel'),
                ],
              ),
              const SizedBox(height: 10), // Space between rows
              // Second row of two images
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildImageCardWithButton('assets/bgimage.png', 'Nationalpark'),
                  _buildImageCardWithButton('assets/bgimage.png', 'Book Now'), // Added "Book Now"
                ],
              ),
            ],
          ),
          // Green background content with reduced width and increased border radius
          Positioned(
            top: 60, // Move the card up by reducing this value
            left: 0,
            right: 0,
            child: Center( // Center the content horizontally
              child: Container(
                width: MediaQuery.of(context).size.width * 0.8, // Reduce width to 80% of the screen
                decoration: BoxDecoration(
                  color: const Color(0xFF2E7D32).withOpacity(0.9), // Green background
                  borderRadius: BorderRadius.circular(16.0), // Increased border radius
                ),
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Close icon button
                    Align(
                      alignment: Alignment.topRight,
                      child: IconButton(
                        icon: const Icon(
                          Icons.close,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          // Add close functionality (e.g., Navigator.pop(context);)
                        },
                      ),
                    ),
                    const Text(
                      'National park',
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. '
                      'Vestibulum eget sapien vitae urna accumsan vehicula. '
                      'Aliquam erat volutpat.'
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. '
                      'Vestibulum eget sapien vitae urna accumsan vehicula. '
                      'Aliquam erat volutpat.'
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. '
                      'Vestibulum eget sapien vitae urna accumsan vehicula. '
                      'Aliquam erat volutpat.'
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. '
                      'Vestibulum eget sapien vitae urna accumsan vehicula. '
                      'Aliquam erat volutpat.'
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. '
                      'Vestibulum eget sapien vitae urna accumsan vehicula. '
                      'Aliquam erat volutpat.',
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                    const SizedBox(height: 20),
                    Row( // Use a Row to align the text and link
                      children: [
                        const Text(
                          'Visit the website: ',
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                        Expanded( // Use Expanded to make the link fit in the available space
                          child: GestureDetector(
                            child: const Text(
                              'https://www.africanparks.org/the-parks/akagera',
                              style: TextStyle(color: Colors.blue, fontSize: 16, decoration: TextDecoration.underline),
                            ),
                            onTap: () {
                              // Add logic to open the URL (for example, using url_launcher)
                            },
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Helper method to build image cards with button
  Widget _buildImageCardWithButton(String imagePath, String title) {
    return Container(
      width: 150, // Set width for the card
      height: 150, // Set height for the card
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16), // Increased border radius
        image: DecorationImage(
          image: AssetImage(imagePath), // Image asset
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: [
          // Overlay for the title
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16), // Increased border radius
              color: Colors.black.withOpacity(0.5), // Semi-transparent overlay
            ),
            child: Center(
              child: Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          // Book Now button
          Positioned(
            bottom: 8,
            left: 8,
            right: 8,
            child: ElevatedButton(
              onPressed: () {
                // Add your booking functionality here
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white, // Button color
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8), // Button border radius
                ),
              ),
              child: const Text(
                'Book Now',
                style: TextStyle(color: Colors.black),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Helper method to build image cards
  Widget _buildImageCard(String imagePath, String title) {
    return Container(
      width: 150, // Set width for the card
      height: 150, // Set height for the card
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16), // Increased border radius
        image: DecorationImage(
          image: AssetImage(imagePath), // Image asset
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16), // Increased border radius
          color: Colors.black.withOpacity(0.5), // Semi-transparent overlay
        ),
        child: Center(
          child: Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
