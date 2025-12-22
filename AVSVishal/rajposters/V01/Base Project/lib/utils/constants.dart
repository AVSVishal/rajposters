class AppConstants {
  // App Information
  static const String APP_NAME = 'Notes to Quiz AI';
  static const String APP_VERSION = '0.2.0';
  static const String COMPANY_NAME = 'AI POWERED LEARNING';
  
  // API Configuration (for future use)
  static const String BASE_URL = 'https://api.notestoquizai.com';
  static const int API_TIMEOUT = 30; // seconds
  static const int CACHE_HOURS = 3; // hours
  
  // Database Configuration
  static const String DATABASE_NAME = 'notes_to_quiz_ai.db';
  static const int DATABASE_VERSION = 1;
  
  // Shared Preferences Keys
  static const String PREF_FIRST_LAUNCH = 'first_launch';
  static const String PREF_USER_SETTINGS = 'user_settings';
  static const String PREF_THEME_MODE = 'theme_mode';
  
  // Animation Durations
  static const int SPLASH_DURATION = 3000; // milliseconds
  static const int ANIMATION_DURATION = 300; // milliseconds
  static const int LOADING_ANIMATION_DURATION = 2000; // milliseconds
  
  // UI Constants
  static const double DEFAULT_PADDING = 16.0;
  static const double CARD_BORDER_RADIUS = 12.0;
  static const double BUTTON_BORDER_RADIUS = 8.0;
  static const double ICON_SIZE = 24.0;
  static const double LARGE_ICON_SIZE = 64.0;
  
  // Text Sizes
  static const double TITLE_FONT_SIZE = 32.0;
  static const double SUBTITLE_FONT_SIZE = 18.0;
  static const double BODY_FONT_SIZE = 14.0;
  static const double CAPTION_FONT_SIZE = 12.0;
  
  // Error Messages
  static const String ERROR_NO_INTERNET = 'No internet connection available';
  static const String ERROR_GENERAL = 'Something went wrong. Please try again.';
  static const String ERROR_SERVER = 'Server error. Please try again later.';
  static const String ERROR_TIMEOUT = 'Request timeout. Please check your connection.';
  
  // Success Messages
  static const String SUCCESS_SAVED = 'Successfully saved!';
  static const String SUCCESS_UPDATED = 'Successfully updated!';
  static const String SUCCESS_DELETED = 'Successfully deleted!';
  
  // Feature Flags (for future development)
  static const bool ENABLE_OFFLINE_MODE = true;
  static const bool ENABLE_DARK_THEME = false; // Currently using light theme
  static const bool ENABLE_ANALYTICS = false;
  static const bool ENABLE_CRASH_REPORTING = false;
}