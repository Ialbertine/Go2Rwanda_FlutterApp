import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Hotels List Widget Tests', () {
    final List<Map<String, String>> hotels = [
      {'name': 'Cleo Hotel', 'image': 'assets/cleo.jpg'},
      {'name': 'Grand Legacy', 'image': 'assets/grandlegacy.jpg'},
      {'name': 'Lemigo Hotel', 'image': 'assets/lemigohotel.webp'},
    ];

    testWidgets('should display all hotels', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: ListView.builder(
              itemCount: hotels.length,
              itemBuilder: (context, index) {
                final hotel = hotels[index];
                return ListTile(
                  leading: Image.asset(hotel['image']!),
                  title: Text(hotel['name']!),
                );
              },
            ),
          ),
        ),
      );

      for (var hotel in hotels) {
        expect(find.text(hotel['name']!), findsOneWidget);
      }
    });

    testWidgets('should display fallback when image asset is missing',
        (WidgetTester tester) async {
      final List<Map<String, String>> hotels = [
        {'name': 'Cleo Hotel', 'image': 'assets/non_existent_image.jpg'},
        {'name': 'Grand Legacy', 'image': 'assets/grandlegacy.jpg'},
        {'name': 'Lemigo Hotel', 'image': 'assets/lemigohotel.webp'},
      ];
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: ListView.builder(
              itemCount: hotels.length,
              itemBuilder: (context, index) {
                final hotel = hotels[index];
                return ListTile(
                  leading: Image.asset(
                    hotel['image']!,
                    errorBuilder: (context, error, stackTrace) {
                      return const Icon(Icons.broken_image);
                    },
                  ),
                  title: Text(hotel['name']!),
                );
              },
            ),
          ),
        ),
      );

      await tester.pumpAndSettle();
      expect(find.byIcon(Icons.broken_image), findsWidgets);
    });
  });
}
