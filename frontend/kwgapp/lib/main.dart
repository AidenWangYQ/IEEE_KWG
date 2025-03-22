import 'package:flutter/material.dart';

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
            backgroundColor: Colors.blue, // Button color (Blue)
            foregroundColor: Colors.white, // Text color on buttons (White)
            minimumSize: Size(120, 50),
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
      body: Padding(
        padding: const EdgeInsets.all(16.0),  // Padding around the content
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'How can we help?',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black),
              ),
              SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      // Handle Context button press
                    },
                    child: Text('Context'),
                  ),
                  SizedBox(width: 20),
                  ElevatedButton(
                    onPressed: () {
                      // Handle Discussion button press
                    },
                    child: Text('Discussion'),
                  ),
                  SizedBox(width: 20),
                  ElevatedButton(
                    onPressed: () {
                      // Handle Review button press
                    },
                    child: Text('Review'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
