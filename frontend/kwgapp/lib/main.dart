import 'package:flutter/material.dart';
import 'context.dart';
import 'discussion.dart';
import 'review.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.teal,  // Teal as the primary color
        scaffoldBackgroundColor: Colors.white,  // White background for the scaffold
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue, // Accent color for the theme
          brightness: Brightness.light,  // Light theme
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textTheme: TextTheme(
          headlineSmall: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black), // Title text
          bodyLarge: TextStyle(fontSize: 18, color: Colors.black),  // Body text color
          bodyMedium: TextStyle(fontSize: 16, color: Colors.grey),  // Secondary body text color
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.black, // Button color (Black)
            foregroundColor: Colors.white, // Text color on buttons (White)
            minimumSize: Size(200, 50),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            padding: EdgeInsets.symmetric(vertical: 12, horizontal: 20), // Add padding inside buttons
          ),
        ),
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Blue Sidebar on the right
          Positioned.fill(
            child: Align(
              alignment: Alignment.centerRight,
              child: Container(
                width: 250,
                color: Colors.cyan,  // Blue sidebar color
              ),
            ),
          ),
          // Main Content
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Text at the top
                  Text(
                    'Hi, I am KWGmate.\nPleased to be working with you today!',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 40),
                  // Buttons arranged in a column with space between
                  Column(
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => ContextPage()),
                          );
                        },
                        child: Text('Contextualise'),
                      ),
                      SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => DiscussionPage()),
                          );
                        },
                        child: Text('Discuss'),
                      ),
                      SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => ReviewPage()),
                          );
                        },
                        child: Text('Review'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          // Brought to you by KWG text at the bottom
          Positioned(
            bottom: 20,
            left: 16,
            child: Text(
              'Brought to you by KWG',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
