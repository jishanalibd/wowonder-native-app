/// API Endpoints
/// All WoWonder API endpoints organized by feature
class ApiEndpoints {
  // Base
  static const String base = '/api';
  
  // ==================== AUTHENTICATION ====================
  static const String auth = '$base/auth';
  static const String login = '$auth/login';
  static const String register = '$auth/register';
  static const String logout = '$auth/logout';
  static const String socialLogin = '$auth/social-login';
  static const String verifyToken = '$auth/verify-token';
  static const String forgotPassword = '$auth/forgot-password';
  static const String resetPassword = '$auth/reset-password';
  static const String twoFactorAuth = '$auth/two-factor';
  
  // ==================== USER ====================
  static const String users = '$base/users';
  static String userProfile(String userId) => '$users/$userId';
  static const String updateProfile = '$users/update-profile';
  static const String uploadAvatar = '$users/upload-avatar';
  static const String uploadCover = '$users/upload-cover';
  static const String follow = '$users/follow';
  static const String unfollow = '$users/unfollow';
  static String followers(String userId) => '$users/$userId/followers';
  static String following(String userId) => '$users/$userId/following';
  static const String blockedUsers = '$users/blocked';
  static const String blockUser = '$users/block';
  static const String unblockUser = '$users/unblock';
  static const String privacySettings = '$users/privacy';
  static const String generalSettings = '$users/settings';
  
  // ==================== POSTS ====================
  static const String posts = '$base/posts';
  static const String feed = '$posts/feed';
  static const String createPost = '$posts/create';
  static String getPost(String postId) => '$posts/$postId';
  static String deletePost(String postId) => '$posts/$postId/delete';
  static String editPost(String postId) => '$posts/$postId/edit';
  static String likePost(String postId) => '$posts/$postId/like';
  static String unlikePost(String postId) => '$posts/$postId/unlike';
  static String sharePost(String postId) => '$posts/$postId/share';
  static String reportPost(String postId) => '$posts/$postId/report';
  static String savePost(String postId) => '$posts/$postId/save';
  static String unsavePost(String postId) => '$posts/$postId/unsave';
  static const String savedPosts = '$posts/saved';
  static const String uploadMedia = '$posts/upload-media';
  
  // ==================== COMMENTS ====================
  static const String comments = '$base/comments';
  static String postComments(String postId) => '$posts/$postId/comments';
  static const String createComment = '$comments/create';
  static String deleteComment(String commentId) => '$comments/$commentId/delete';
  static String likeComment(String commentId) => '$comments/$commentId/like';
  static String unlikeComment(String commentId) => '$comments/$commentId/unlike';
  
  // ==================== STORIES ====================
  static const String stories = '$base/stories';
  static const String storiesList = '$stories/list';
  static const String createStory = '$stories/create';
  static const String uploadStory = '$stories/upload';
  static String viewStory(String storyId) => '$stories/$storyId/view';
  static String deleteStory(String storyId) => '$stories/$storyId/delete';
  
  // ==================== MESSAGES ====================
  static const String messages = '$base/messages';
  static const String conversations = '$messages/conversations';
  static String chatMessages(String userId) => '$messages/chat/$userId';
  static const String sendMessage = '$messages/send';
  static const String uploadMessageMedia = '$messages/upload-media';
  static String deleteMessage(String messageId) => '$messages/$messageId/delete';
  static String markAsRead(String conversationId) => '$messages/$conversationId/mark-read';
  
  // ==================== NOTIFICATIONS ====================
  static const String notifications = '$base/notifications';
  static const String notificationsList = '$notifications/list';
  static const String markNotificationRead = '$notifications/mark-read';
  static const String markAllNotificationsRead = '$notifications/mark-all-read';
  static const String notificationSettings = '$notifications/settings';
  static const String unreadCount = '$notifications/count';
  
  // ==================== GROUPS ====================
  static const String groups = '$base/groups';
  static const String groupsList = '$groups/list';
  static const String myGroups = '$groups/my-groups';
  static const String createGroup = '$groups/create';
  static String groupDetails(String groupId) => '$groups/$groupId';
  static String joinGroup(String groupId) => '$groups/$groupId/join';
  static String leaveGroup(String groupId) => '$groups/$groupId/leave';
  static String groupPosts(String groupId) => '$groups/$groupId/posts';
  static String groupMembers(String groupId) => '$groups/$groupId/members';
  static String inviteToGroup(String groupId) => '$groups/$groupId/invite';
  
  // ==================== PAGES ====================
  static const String pages = '$base/pages';
  static const String pagesList = '$pages/list';
  static const String myPages = '$pages/my-pages';
  static const String createPage = '$pages/create';
  static String pageDetails(String pageId) => '$pages/$pageId';
  static String likePage(String pageId) => '$pages/$pageId/like';
  static String unlikePage(String pageId) => '$pages/$pageId/unlike';
  static String pagePosts(String pageId) => '$pages/$pageId/posts';
  static String pageAnalytics(String pageId) => '$pages/$pageId/analytics';
  
  // ==================== EVENTS ====================
  static const String events = '$base/events';
  static const String eventsList = '$events/list';
  static const String myEvents = '$events/my-events';
  static const String createEvent = '$events/create';
  static String eventDetails(String eventId) => '$events/$eventId';
  static String joinEvent(String eventId) => '$events/$eventId/join';
  static String leaveEvent(String eventId) => '$events/$eventId/leave';
  static String eventMembers(String eventId) => '$events/$eventId/members';
  
  // ==================== MARKETPLACE ====================
  static const String marketplace = '$base/marketplace';
  static const String products = '$marketplace/products';
  static const String myProducts = '$marketplace/my-products';
  static const String createProduct = '$marketplace/create';
  static String productDetails(String productId) => '$marketplace/$productId';
  static String deleteProduct(String productId) => '$marketplace/$productId/delete';
  
  // ==================== VIDEOS ====================
  static const String videos = '$base/videos';
  static const String videosList = '$videos/list';
  static const String uploadVideo = '$videos/upload';
  static String videoDetails(String videoId) => '$videos/$videoId';
  static String deleteVideo(String videoId) => '$videos/$videoId/delete';
  
  // ==================== SEARCH ====================
  static const String search = '$base/search';
  static const String searchUsers = '$search/users';
  static const String searchPosts = '$search/posts';
  static const String searchGroups = '$search/groups';
  static const String searchPages = '$search/pages';
  static const String searchEvents = '$search/events';
  static const String trending = '$search/trending';
  static const String suggestions = '$search/suggestions';
  
  // ==================== WALLET & PAYMENTS ====================
  static const String wallet = '$base/wallet';
  static const String walletBalance = '$wallet/balance';
  static const String transactions = '$wallet/transactions';
  static const String addFunds = '$wallet/add-funds';
  static const String withdraw = '$wallet/withdraw';
  
  // Payment Gateways
  static const String coinpayments = '$base/coinpayments';
  static const String yoomoney = '$base/yoomoney';
  static const String securionpay = '$base/securionpay';
  static const String authorize = '$base/authorize';
  static const String flutterwave = '$base/flutterwave';
  static const String ngenius = '$base/ngenius';
  static const String braintree = '$base/braintree';
  static const String coinbase = '$base/coinbase';
  static const String iyzipay = '$base/iyzipay';
  static const String fortumo = '$base/fortumo';
  
  // ==================== SETTINGS ====================
  static const String settings = '$base/settings';
  static const String appSettings = '$settings/app';
  static const String privacyPolicy = '$settings/privacy-policy';
  static const String termsOfUse = '$settings/terms';
  static const String about = '$settings/about';
  
  // ==================== MISC ====================
  static const String report = '$base/report';
  static const String feedback = '$base/feedback';
  static const String help = '$base/help';
}