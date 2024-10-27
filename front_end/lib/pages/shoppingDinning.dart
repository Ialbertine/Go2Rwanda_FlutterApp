// ignore_for_file: unused_element

import 'package:flutter/material.dart';

void main() {
  runApp(const ShoppindAndDinning());
}

class ShoppindAndDinning extends StatelessWidget {
  const ShoppindAndDinning({super.key});


  void _showShoppingDinningModal(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          backgroundColor: const Color(0xFF1B5E20),
          child: Container(
            constraints: const BoxConstraints(maxHeight: 300),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  padding: const EdgeInsets.all(16.0),
                  decoration: const BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: Colors.white24,
                        width: 0.5,
                      ),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Shopping and Dining',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: Container(
                          padding: const EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            color: Colors.white24,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: const Text(
                            'X',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. '
                            'Vestibulum eget sapien vitae urna accumsan vehicula. '
                            'Aliquam erat volutpat. '
                            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. '
                            'Vestibulum eget sapien vitae urna accumsan vehicula. '
                            'Aliquam erat volutpat. '
                            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. '
                            'Vestibulum eget sapien vitae urna accumsan vehicula. '
                            'Aliquam erat volutpat.'
                            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. ',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              height: 1.5,
                            ),
                          ),
                          const SizedBox(height: 16),
                          Container(
                            width: double.infinity,
                            padding: const EdgeInsets.symmetric(vertical: 8),
                            decoration: BoxDecoration(
                              border: Border(
                                top: BorderSide(
                                  color: Colors.white.withOpacity(0.2),
                                  width: 0.5,
                                ),
                              ),
                            ),
                            child: Row(
                              children: [
                                Text(
                                  'Visit the website: ',
                                  style: TextStyle(
                                    color: Colors.white.withOpacity(0.7),
                                    fontSize: 14,
                                  ),
                                ),
                                const Text(
                                  'https://www.example.org/live',
                                  style: TextStyle(
                                    color: Colors.blue,
                                    decoration: TextDecoration.underline,
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }


  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Accommodation(),
    );
  }
}

class Accommodation extends StatefulWidget {
  const Accommodation({super.key});

  @override
  State<Accommodation> createState() => _AccommodationState();
}

class _AccommodationState extends State<Accommodation> {
  
  final List<AccommodationItem> accommodations = [
    AccommodationItem(
      title: "Cleo Hotel",
      image: "assets/cleo.jpg",
      bookBtn: "Book",
      rating: "View more",
    ),
    AccommodationItem(
      title: "Grand Legacy hotel",
      image: "assets/grandlegacy.jpg",
      bookBtn: "Book",
      rating: "view more",
    ),
    AccommodationItem(
      title: "Lemigo hotel",
      image: "assets/lemigohotel.webp",
      bookBtn: "Book",
      rating: "view more",
    ),
    AccommodationItem(
      title: "Betany Hotel",
      image: "assets/Betanyhotel.jpg",
      bookBtn: "Book",
      rating: "view more",
    ),
    AccommodationItem(
      title: "Serena Hotel",
      image: "assets/kigaliserena.jpg",
      bookBtn: "Book",
      rating: "view more",
    ),
    AccommodationItem(
      title: "Marriot Hotel",
      image: "assets/Marriot.jpg",
      bookBtn: "Book",
      rating: "view more",
    ),
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Stack(
            children: [
              // Background Image Section
              Container(
                height: 250,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/cleo-hotel-lake-kivu.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              // Overlay Text
              Positioned(
                top: 100,
                left: 60,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: const Text(
                    'Accommodation',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),

              // App Bar
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: AppBar(
                  backgroundColor:const Color(0xFF025719),
                  elevation: 0,
                  leading: IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.white),
                    onPressed: () {
                      // Handle back action
                    },
                  ),
                  actions: [
                    IconButton(
                      icon: const Icon(Icons.menu, color: Colors.white, size: 28),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ],
                ),
              ),
            ],
          ),

          // Main Content with Overlap
          SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 190),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: const BorderRadius.all(Radius.circular(30)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 10,
                          offset: const Offset(0, -5),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Grid of Cards
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: GridView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              childAspectRatio: 0.75,
                              crossAxisSpacing: 16,
                              mainAxisSpacing: 16,
                            ),
                            itemCount: accommodations.length,
                            itemBuilder: (context, index) {
                              return AccommodationCard(item: accommodations[index]);
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                // Add extra padding at the bottom for the navigation bar
                const SizedBox(height: 70),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class AccommodationItem {
  final String title;
  final String image;
  final String bookBtn;
  final String rating;

  AccommodationItem({
    required this.title,
    required this.image,
    required this.bookBtn,
    required this.rating,
  });
}

class AccommodationCard extends StatelessWidget {
  final AccommodationItem item;

  const AccommodationCard({
    super.key,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      child: Stack(
        children: [
          // Image Background
          Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(15)),
                  image: DecorationImage(
                    image: AssetImage(item.image),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.1),
                  borderRadius: const BorderRadius.all(Radius.circular(15)),
                ),
              ),
            ],
          ),

          // Content Overlay
          Container(
            padding: const EdgeInsets.all(12.0),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.black.withOpacity(0.6),
                  Colors.black.withOpacity(0.3),
                ],
                begin: Alignment.center,
                end: Alignment.center,
              ),
              borderRadius: const BorderRadius.all(Radius.circular(12)),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.title,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      item.rating,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w100,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: const Color(0xFF025719),
                      padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 20),
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                    ),
                    onPressed: () {
                      // Define your onPressed action here
                    },
                    child: Text(
                      item.bookBtn,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w100,
                        color: Colors.white,
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