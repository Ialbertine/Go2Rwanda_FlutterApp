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
      title: "Luxury Suite",
      image: "assets/Homepage.jpg",
      price: "\$200/night",
      rating: "4.8",
    ),
    AccommodationItem(
      title: "Ocean View Room",
      image: "assets/Homepage.jpg",
      price: "\$180/night",
      rating: "4.6",
    ),
    AccommodationItem(
      title: "Garden Villa",
      image: "assets/Homepage.jpg",
      price: "\$250/night",
      rating: "4.9",
    ),
    AccommodationItem(
      title: "Deluxe Room",
      image: "assets/Homepage.jpg",
      price: "\$150/night",
      rating: "4.5",
    ),
    AccommodationItem(
      title: "Family Suite",
      image: "assets/Homepage.jpg",
      price: "\$220/night",
      rating: "4.7",
    ),
    AccommodationItem(
      title: "Penthouse",
      image: "assets/Homepage.jpg",
      price: "\$300/night",
      rating: "5.0",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Background and Header Section
        Column(
          children: [
            Container(
              height: 250, // Increased height for overlap
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/Homepage.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Expanded(
              child: Container(
                color: Colors.grey[100],
              ),
            ),
          ],
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

        // Main Content with Overlap
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
            borderRadius: const BorderRadius.vertical(top: Radius.circular(30)),
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
              // Title Section
              // const Padding(
              //   padding: EdgeInsets.fromLTRB(20, 25, 0, 10),
              //   child: Column(
              //     crossAxisAlignment: CrossAxisAlignment.start,
              //     children: [
              //       Text(
              //         'Available Accommodations',
              //         style: TextStyle(
              //           fontSize: 24,
              //           fontWeight: FontWeight.bold,
              //         ),
              //       ),
              //       SizedBox(height: 8),
              //       Text(
              //         'Find your perfect stay from our carefully curated selection',
              //         style: TextStyle(
              //           fontSize: 16,
              //           color: Colors.grey,
              //         ),
              //       ),
              //     ],
              //   ),
              // ),

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
  final String price;
  final String rating;

  AccommodationItem({
    required this.title,
    required this.image,
    required this.price,
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
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
            child: Image.asset(
              item.image,
              height:140,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          
          // Content
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height:20),
                Row(
                  children: [
                    const Icon(Icons.star, color: Colors.amber, size: 16),
                    const SizedBox(width: 4),
                    Text(
                      item.rating,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  item.price,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
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