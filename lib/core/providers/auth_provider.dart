import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/user_model.dart';
import '../services/storage_service.dart';
import '../../features/auth/data/repositories/auth_repository.dart';
import '../../features/auth/data/models/auth_response.dart';

// Provider for AuthRepository
final authRepositoryProvider = Provider<AuthRepository>((ref) {
  return AuthRepository();
});

// Provider for StorageService
final storageServiceProvider = Provider<StorageService>((ref) {
  return StorageService();
});

// Auth State Provider
final authStateProvider = StreamProvider<UserModel?>((ref) async* {
  final storage = ref.watch(storageServiceProvider);
  final repository = ref.watch(authRepositoryProvider);
  
  // Check if user is logged in
  final accessToken = await storage.getAccessToken();
  final userId = await storage.getUserId();
  
  if (accessToken != null && userId != null) {
    try {
      final user = await repository.getCurrentUser(accessToken);
      yield user;
    } catch (e) {
      // If failed to get user, clear auth data
      await storage.clearAuthData();
      yield null;
    }
  } else {
    yield null;
  }
});

// Auth Controller for login/logout actions
final authControllerProvider = Provider<AuthController>((ref) {
  return AuthController(ref);
});

class AuthController {
  final Ref ref;
  
  AuthController(this.ref);
  
  Future<void> login({
    required String username,
    required String password,
  }) async {
    final repository = ref.read(authRepositoryProvider);
    final storage = ref.read(storageServiceProvider);
    
    try {
      final authResponse = await repository.login(
        username: username,
        password: password,
      );
      
      // Save tokens and user ID
      await storage.saveAccessToken(authResponse.accessToken);
      await storage.saveUserId(authResponse.userId);
      
      // Refresh auth state
      ref.invalidate(authStateProvider);
    } catch (e) {
      rethrow;
    }
  }
  
  Future<void> register({
    required String username,
    required String email,
    required String password,
    required String confirmPassword,
    String? firstName,
    String? lastName,
    String? phoneNumber,
    String gender = 'male',
  }) async {
    final repository = ref.read(authRepositoryProvider);
    final storage = ref.read(storageServiceProvider);
    
    try {
      final authResponse = await repository.register(
        username: username,
        email: email,
        password: password,
        confirmPassword: confirmPassword,
        firstName: firstName,
        lastName: lastName,
        phoneNumber: phoneNumber,
        gender: gender,
      );
      
      // Save tokens and user ID
      await storage.saveAccessToken(authResponse.accessToken);
      await storage.saveUserId(authResponse.userId);
      
      // Refresh auth state
      ref.invalidate(authStateProvider);
    } catch (e) {
      rethrow;
    }
  }
  
  Future<void> logout() async {
    final repository = ref.read(authRepositoryProvider);
    final storage = ref.read(storageServiceProvider);
    
    try {
      final accessToken = await storage.getAccessToken();
      if (accessToken != null) {
        await repository.logout(accessToken);
      }
    } finally {
      // Always clear local data
      await storage.clearAuthData();
      ref.invalidate(authStateProvider);
    }
  }
}
