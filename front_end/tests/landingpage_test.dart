
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:front_end/pages/landingpage.dart';

void main() {
  group('LandingPage Widget Tests', () {
    testWidgets('should display the correct texts and button',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: LandingPage(),
        ),
      );

      expect(find.text('Go2Rwanda'), findsOneWidget);
      expect(find.text('Travel  |  Discover  |  the beauty'), findsOneWidget);
      expect(find.text('Get Started'), findsOneWidget);
    });

    testWidgets('should navigate to /register on button press',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: const LandingPage(),
          onGenerateRoute: (settings) {
            if (settings.name == '/register') {
              return MaterialPageRoute(
                builder: (context) =>
                    const Scaffold(body: Center(child: Text('Register Page'))),
              );
            }
            return null;
          },
        ),
      );

      await tester.tap(find.text('Get Started'));
      await tester.pumpAndSettle();
      expect(find.text('Register Page'), findsOneWidget);
    });
  });
}
