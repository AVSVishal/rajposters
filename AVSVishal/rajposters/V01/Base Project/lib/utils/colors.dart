import 'package:flutter/material.dart';

class AppColors {
  // Primary Colors (Blue Theme)
  static const Color primary = Color(0xFF2196F3);           // Blue primary
  static const Color primaryDark = Color(0xFF1976D2);       // Darker blue
  static const Color primaryLight = Color(0xFF64B5F6);      // Lighter blue
  
  // Secondary Colors (Teal Theme)
  static const Color secondary = Color(0xFF03DAC6);         // Teal secondary
  static const Color secondaryDark = Color(0xFF00695C);     // Darker teal
  static const Color secondaryLight = Color(0xFF4DD0E1);    // Lighter teal
  
  // Background Colors (White Theme)
  static const Color background = Color(0xFFFFFFFF);        // Pure white
  static const Color surface = Color(0xFFFFFFFF);           // White surface
  static const Color cardBackground = Color(0xFFFFFFFF);    // White cards
  static const Color containerBackground = Color(0xFFF8F9FA); // Light gray container
  
  // Text Colors
  static const Color textPrimary = Color(0xFF000000);       // Black text
  static const Color textSecondary = Color(0xFF666666);     // Gray text
  static const Color textHint = Color(0xFF888888);          // Light gray text
  static const Color textDisabled = Color(0xFFBBBBBB);      // Disabled text
  
  // Status Colors
  static const Color success = Color(0xFF4CAF50);           // Green success
  static const Color warning = Color(0xFFFF9800);           // Orange warning
  static const Color error = Color(0xFFFF5722);             // Red error
  static const Color info = Color(0xFF2196F3);              // Blue info
  
  // Border Colors
  static const Color border = Color(0xFFE0E0E0);            // Light gray border
  static const Color borderFocus = Color(0xFF2196F3);       // Blue focused border
  static const Color borderError = Color(0xFFFF5722);       // Red error border
  
  // Shadow Colors
  static const Color shadow = Color(0x1A000000);            // Light black shadow
  static const Color shadowDark = Color(0x26000000);        // Darker shadow
  
  // Overlay Colors
  static const Color overlay = Color(0x80000000);           // Semi-transparent black
  static const Color overlayLight = Color(0x40000000);      // Light overlay
  
  // Gradient Colors
  static const LinearGradient primaryGradient = LinearGradient(
    colors: [primary, primaryDark],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
  
  static const LinearGradient secondaryGradient = LinearGradient(
    colors: [secondary, secondaryDark],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
  
  // Loading Colors
  static const Color loadingBackground = Color(0xFFF0F0F0); // Light gray loading
  static const Color loadingIndicator = primary;            // Blue loading indicator
  
  // Button Colors
  static const Color buttonPrimary = primary;
  static const Color buttonSecondary = secondary;
  static const Color buttonDisabled = Color(0xFFE0E0E0);
  static const Color buttonText = Color(0xFFFFFFFF);
  static const Color buttonTextDisabled = Color(0xFF999999);
  
  // Input Colors
  static const Color inputBackground = Color(0xFFF8F9FA);
  static const Color inputBorder = border;
  static const Color inputBorderFocus = borderFocus;
  static const Color inputText = textPrimary;
  static const Color inputHint = textHint;
  
  // App Bar Colors
  static const Color appBarBackground = background;
  static const Color appBarText = textPrimary;
  static const Color appBarIcon = textPrimary;
  
  // Bottom Navigation Colors
  static const Color bottomNavBackground = background;
  static const Color bottomNavSelected = primary;
  static const Color bottomNavUnselected = textSecondary;
  
  // Card Colors
  static const Color cardShadow = shadow;
  static const Color cardBorder = border;
  
  // Specific Feature Colors (for future AI features)
  static const Color aiAccent = Color(0xFF6C63FF);          // Purple AI accent
  static const Color quizCorrect = success;                 // Green for correct answers
  static const Color quizIncorrect = error;                 // Red for incorrect answers
  static const Color noteHighlight = Color(0xFFFFF9C4);     // Yellow highlight
}