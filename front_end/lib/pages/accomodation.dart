// ignore_for_file: avoid_print, prefer_const_constructors

import 'package:flutter/material.dart';

class Accomodation extends StatefulWidget {
  const Accomodation({super.key});

  @override
  State<Accomodation> createState() => _AccomodationState();
}

class _AccomodationState extends State<Accomodation> {
  void _showAccommodationModal(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return MouseRegion(
          cursor: SystemMouseCursors.click,
          child: Dialog(
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
                          'Lakes',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        InkWell(
                          onTap: () => Navigator.pop(context),
                          child: MouseRegion(
                            cursor: SystemMouseCursors.click,
                            child: Container(
                              padding: const EdgeInsets.all(4),
                              decoration: BoxDecoration(
                                color: Colors.white24,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: const Icon(
                                Icons.close,
                                color: Colors.white,
                                size: 16,
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
                                  MouseRegion(
                                    cursor: SystemMouseCursors.click,
                                    child: const Text(
                                      'https://www.example.org/live',
                                      style: TextStyle(
                                        color: Colors.blue,
                                        decoration: TextDecoration.underline,
                                        fontSize: 14,
                                      ),
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
          ),
        );
      },
    );
  }

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

          // SafeArea with Green Background
          SafeArea(
            child: Container(
              color: const Color(0xFF025719),
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Icon(Icons.arrow_back,
                            color: Colors.white, size: 28),
                      ),
                    ),
                  ),
                  
                  GestureDetector(
                    onTap: () {
                      _showAccommodationModal(context);
                    },
                    child: MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: Container(
                        padding: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          color: Colors.white24,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Icon(
                          Icons.menu,
                          color: Colors.white,
                          size: 24,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),

          // Overlay Text
          const Positioned(
            top: 100,
            left: 60,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Text(
                'Accommodation',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
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
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: Card(
        elevation: 4,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        child: Stack(
          fit: StackFit.expand,
          children: [
            // Image Background
            ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(20)),
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Image.asset(
                    item.image,
                    fit: BoxFit.cover,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.3),
                    ),
                  ),
                ],
              ),
            ),

            // Content Overlay
            Padding(
              padding: const EdgeInsets.all(12.0),
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
                  Text(
                    item.rating,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w100,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Align(
                    alignment: Alignment.center,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        onTap: () {
                          // Add your booking logic here
                          print('Booking ${item.title}');
                        },
                        child: MouseRegion(
                          cursor: SystemMouseCursors.click,
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              vertical: 12,
                              horizontal: 24,
                            ),
                            decoration: BoxDecoration(
                              color: const Color(0xFF025719),
                              borderRadius: BorderRadius.circular(20),
                            ),
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
