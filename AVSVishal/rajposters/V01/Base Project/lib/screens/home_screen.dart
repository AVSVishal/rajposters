import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFFFFF), // White background
      appBar: AppBar(
        title: Text(
          'Base App',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Color(0xFF2196F3),
          ),
        ),
        backgroundColor: Color(0xFFFFFFFF),
        elevation: 1,
        centerTitle: true,
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Main title
              Container(
                padding: EdgeInsets.all(30),
                decoration: BoxDecoration(
                  color: Color(0xFFFFFFFF),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: Color(0xFF2196F3),
                    width: 2,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xFF2196F3).withOpacity(0.1),
                      blurRadius: 15,
                      offset: Offset(0, 8),
                    ),
                  ],
                ),
                child: Text(
                  'Base App',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF2196F3),
                    letterSpacing: 1.2,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              
              SizedBox(height: 40),
              
              // Subtitle
              Text(
                'Simple Base Flutter Application',
                style: TextStyle(
                  fontSize: 18,
                  color: Color(0xFF666666),
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
              ),
              
              SizedBox(height: 20),
              
              // Description
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 40),
                child: Text(
                  'A clean and simple base template for Flutter applications',
                  style: TextStyle(
                    fontSize: 14,
                    color: Color(0xFF888888),
                    height: 1.5,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              
              SizedBox(height: 60),
              
              // Version info
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                decoration: BoxDecoration(
                  color: Color(0xFFF8F9FA),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: Color(0xFFE0E0E0),
                    width: 1,
                  ),
                ),
                child: Text(
                  'Version 0.10.0',
                  style: TextStyle(
                    fontSize: 12,
                    color: Color(0xFF666666),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}