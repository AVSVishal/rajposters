import 'package:flutter/material.dart';
import 'home_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(seconds: 3),
      vsync: this,
    );
    _animation = Tween(begin: 0.0, end: 1.0).animate(_controller);
    
    _controller.forward();
    
    // Navigate after 3 seconds
    Future.delayed(Duration(seconds: 3), () {
      if (mounted) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => HomeScreen()),
        );
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFFFFF), // White background
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              flex: 3,
              child: Center(
                child: Container(
                  width: 200,
                  height: 150,
                  decoration: BoxDecoration(
                    color: Color(0xFFF8F9FA), // Light gray container
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: Color(0xFF2196F3),
                      width: 2,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Color(0xFF2196F3).withOpacity(0.1),
                        blurRadius: 10,
                        offset: Offset(0, 5),
                      ),
                    ],
                  ),
                  child: Center(
                    child: Text(
                      'Base App',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF2196F3), // Blue text
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Loading progress bar
                  Container(
                    width: 200,
                    height: 4,
                    decoration: BoxDecoration(
                      color: Color(0xFFE0E0E0),
                      borderRadius: BorderRadius.circular(2),
                    ),
                    child: AnimatedBuilder(
                      animation: _animation,
                      builder: (context, child) {
                        return Container(
                          width: 200 * _animation.value,
                          height: 4,
                          decoration: BoxDecoration(
                            color: Color(0xFF2196F3), // Blue progress
                            borderRadius: BorderRadius.circular(2),
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'SIMPLE BASE APPLICATION',
                    style: TextStyle(
                      fontSize: 12,
                      color: Color(0xFF666666),
                      letterSpacing: 1.5,
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