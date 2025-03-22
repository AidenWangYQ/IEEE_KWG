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
        scaffoldBackgroundColor: Colors.black,  // Black background for the entire scaffold
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.teal, // Accent color for the theme
          brightness: Brightness.dark,  // Dark theme
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textTheme: TextTheme(
          // New TextTheme properties for Flutter 3.x
          headlineSmall: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white), // AppBar title
          bodyLarge: TextStyle(fontSize: 18, color: Colors.white),  // Body text color for readability
          bodyMedium: TextStyle(fontSize: 16, color: Colors.grey),  // Secondary body text color
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.teal, // Button color (Teal)
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
      appBar: AppBar(
        title: Text('LLM Website'),
        centerTitle: true,
        elevation: 0,  // Removes the shadow under the AppBar for a cleaner look
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),  // Padding around the content
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  // Handle Context button press
                },
                child: Text('Context'),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Handle Discussion button press
                },
                child: Text('Discussion'),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Handle Review button press
                },
                child: Text('Review'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
