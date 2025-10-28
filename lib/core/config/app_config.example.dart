/// App Configuration Example
/// Copy this file to app_config.dart and update with your WoWonder credentials
/// 
/// To get started:
/// 1. Copy this file: cp app_config.example.dart app_config.dart
/// 2. Update baseUrl with your WoWonder installation URL
/// 3. Update serverKey with your WoWonder server key (found in admin panel)
/// 4. Never commit app_config.dart to version control (it's in .gitignore)

class AppConfig {
  // API Configuration
  // Example: 'https://demo.wowonder.com' or 'https://yoursite.com'
  static const String baseUrl = 'YOUR_WOWONDER_URL';
  
  // Get this from WoWonder Admin Panel -> Settings -> Server Key
  static const String serverKey = 'YOUR_SERVER_KEY';
  
  static const String apiVersion = 'v1';
  
  // App Configuration
  static const String appName = 'WoWonder';
  static const String packageName = 'com.yourcompany.wowonder';
  
  // API Endpoints Base
  static String get apiBaseUrl => '$baseUrl/api';
  
  // Pagination
  static const int defaultPageSize = 20;
  static const int maxPageSize = 50;
  
  // Media
  static const int maxImageSize = 5 * 1024 * 1024; // 5MB
  static const int maxVideoSize = 50 * 1024 * 1024; // 50MB
  
  // Cache
  static const Duration cacheExpiry = Duration(hours: 24);
  
  // Socket Configuration (Optional - for real-time features)
  static const String socketUrl = 'YOUR_SOCKET_URL';
  static const Duration socketTimeout = Duration(seconds: 30);
  
  // Features Flags
  static const bool enableStories = true;
  static const bool enableGroups = true;
  static const bool enablePages = true;
  static const bool enableMarketplace = true;
  static const bool enableEvents = true;
  static const bool enableVideos = true;
  
  // Debug
  static const bool isDebugMode = true;
  static const bool enableApiLogging = true;
}
