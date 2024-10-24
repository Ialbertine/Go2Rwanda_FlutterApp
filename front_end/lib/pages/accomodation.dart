import 'package:flutter/material.dart';

void main() {
  runApp(const MyAppAccom());
}

class MyAppAccom extends StatelessWidget {
  const MyAppAccom({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Accommodation(),
      ),
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
    return Stack(
      children: [
        Stack(
          children: [
            // Background Image Section
            Container(
              height: 250, // Increased height for overlap
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/cleo-hotel-lake-kivu.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),

            // Overlay Text
            Positioned(
              top: 100, // Adjust position as needed
              left: 60, // Adjust position as needed
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
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
                backgroundColor: Colors.green,
                elevation: 0,
                leading: IconButton(
                  icon: const Icon(Icons.arrow_back, color: Colors.white),
                  onPressed: () {
                    // Handle back action
                  },
                ),
                actions: [
                  IconButton(
                    icon: const Icon(Icons.menu, color: Colors.white),
                    onPressed: () {
                      // Handle menu action
                    },
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
              const SizedBox(height: 190), // Adjust this for overlap amount
              Padding(
                padding: const EdgeInsets.all(20.0), // Add padding here
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
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 0.75,
                            crossAxisSpacing: 16,
                            mainAxisSpacing: 16,
                          ),
                          itemCount: accommodations.length,
                          itemBuilder: (context, index) {
                            return AccommodationCard(
                                item: accommodations[index]);
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
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
                    image: AssetImage(item.image), // Use item.image here
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color:
                      Colors.black.withOpacity(0.1), // Adjust opacity as needed
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
                      padding: const EdgeInsets.symmetric(
                          vertical: 14,
                          horizontal: 20), // Add padding to the button
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(
                            20)), // Optional: Add rounded corners
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