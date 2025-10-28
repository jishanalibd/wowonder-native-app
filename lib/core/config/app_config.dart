/// App Configuration
/// This file contains all the configuration constants for the app
class AppConfig {
  // API Configuration
  static const String baseUrl = 'YOUR_WOWONDER_URL'; // e.g., 'https://yoursite.com/wowonder'
  static const String serverKey = 'YOUR_SERVER_KEY'; // Your WoWonder server key
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
  
  // Socket Configuration
  static const String socketUrl = 'YOUR_SOCKET_URL'; // If using real-time
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