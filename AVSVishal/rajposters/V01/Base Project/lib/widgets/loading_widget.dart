import 'package:flutter/material.dart';

class LoadingWidget extends StatefulWidget {
  final String message;
  final bool showProgress;
  final double? progress;

  const LoadingWidget({
    Key? key,
    this.message = 'Loading...',
    this.showProgress = false,
    this.progress,
  }) : super(key: key);

  @override
  _LoadingWidgetState createState() => _LoadingWidgetState();
}

class _LoadingWidgetState extends State<LoadingWidget>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(seconds: 2),
      vsync: this,
    )..repeat();
    _animation = Tween(begin: 0.0, end: 1.0).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Rotating loading indicator
          AnimatedBuilder(
            animation: _animation,
            builder: (context, child) {
              return Transform.rotate(
                angle: _animation.value * 2 * 3.14159,
                child: Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Color(0xFF2196F3),
                      width: 3,
                    ),
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Center(
                    child: Container(
                      width: 20,
                      height: 20,
                      decoration: BoxDecoration(
                        color: Color(0xFF2196F3),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
          SizedBox(height: 20),
          
          // Progress bar (if needed)
          if (widget.showProgress) ...[
            Container(
              width: 200,
              height: 4,
              decoration: BoxDecoration(
                color: Color(0xFFE0E0E0),
                borderRadius: BorderRadius.circular(2),
              ),
              child: widget.progress != null
                  ? Container(
                      width: 200 * widget.progress!,
                      height: 4,
                      decoration: BoxDecoration(
                        color: Color(0xFF2196F3),
                        borderRadius: BorderRadius.circular(2),
                      ),
                    )
                  : LinearProgressIndicator(
                      backgroundColor: Color(0xFFE0E0E0),
                      valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF2196F3)),
                    ),
            ),
            SizedBox(height: 15),
          ],
          
          // Loading message
          Text(
            widget.message,
            style: TextStyle(
              fontSize: 16,
              color: Color(0xFF666666),
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}