import 'package:dio/dio.dart';
import '../../../../core/api/api_client.dart';
import '../../../../core/api/api_endpoints.dart';
import '../../../../core/config/app_config.dart';
import '../../../../core/models/user_model.dart';
import '../models/auth_response.dart';

class AuthRepository {
  final ApiClient _apiClient = ApiClient();

  /// Login user with username/email and password
  Future<AuthResponse> login({
    required String username,
    required String password,
    String deviceType = 'mobile',
  }) async {
    try {
      final formData = FormData.fromMap({
        'server_key': AppConfig.serverKey,
        'username': username,
        'password': password,
        'device_type': deviceType,
      });

      final response = await _apiClient.post(
        ApiEndpoints.login,
        data: formData,
      );

      if (response.statusCode == 200) {
        final data = response.data;
        
        // WoWonder returns different response formats
        if (data['api_status'] == 200) {
          return AuthResponse.fromJson(data);
        } else {
          throw Exception(data['message'] ?? 'Login failed');
        }
      } else {
        throw Exception('Login failed with status: ${response.statusCode}');
      }
    } on DioException catch (e) {
      if (e.response?.data != null && e.response?.data['errors'] != null) {
        final errors = e.response!.data['errors'] as Map;
        throw Exception(errors.values.first);
      }
      throw Exception(e.message ?? 'Network error occurred');
    } catch (e) {
      throw Exception('Login failed: ${e.toString()}');
    }
  }

  /// Register new user
  Future<AuthResponse> register({
    required String username,
    required String email,
    required String password,
    required String confirmPassword,
    String? firstName,
    String? lastName,
    String? phoneNumber,
    String gender = 'male',
  }) async {
    try {
      final formData = FormData.fromMap({
        'server_key': AppConfig.serverKey,
        'username': username,
        'email': email,
        'password': password,
        'confirm_password': confirmPassword,
        if (firstName != null) 'first_name': firstName,
        if (lastName != null) 'last_name': lastName,
        if (phoneNumber != null) 'phone_number': phoneNumber,
        'gender': gender,
      });

      final response = await _apiClient.post(
        ApiEndpoints.register,
        data: formData,
      );

      if (response.statusCode == 200) {
        final data = response.data;
        
        if (data['api_status'] == 200 || data['api_status'] == 220) {
          // Status 220 means registration successful with email/SMS verification
          return AuthResponse.fromJson(data);
        } else {
          throw Exception(data['message'] ?? 'Registration failed');
        }
      } else {
        throw Exception('Registration failed with status: ${response.statusCode}');
      }
    } on DioException catch (e) {
      if (e.response?.data != null && e.response?.data['errors'] != null) {
        final errors = e.response!.data['errors'] as Map;
        throw Exception(errors.values.first);
      }
      throw Exception(e.message ?? 'Network error occurred');
    } catch (e) {
      throw Exception('Registration failed: ${e.toString()}');
    }
  }

  /// Logout user
  Future<void> logout(String accessToken) async {
    try {
      await _apiClient.post(
        ApiEndpoints.logout,
        queryParameters: {'access_token': accessToken},
      );
    } catch (e) {
      // Ignore logout errors
    }
  }

  /// Get current user data
  Future<UserModel> getCurrentUser(String accessToken) async {
    try {
      final response = await _apiClient.get(
        ApiEndpoints.users,
        queryParameters: {'access_token': accessToken},
      );

      if (response.statusCode == 200) {
        final data = response.data;
        
        if (data['api_status'] == 200 && data['user_data'] != null) {
          return UserModel.fromJson(data['user_data']);
        } else {
          throw Exception('Failed to get user data');
        }
      } else {
        throw Exception('Failed to get user data');
      }
    } catch (e) {
      throw Exception('Failed to get user data: ${e.toString()}');
    }
  }

  /// Verify two-factor authentication code
  Future<AuthResponse> verifyTwoFactor({
    required String userId,
    required String code,
  }) async {
    try {
      final formData = FormData.fromMap({
        'server_key': AppConfig.serverKey,
        'user_id': userId,
        'code': code,
      });

      final response = await _apiClient.post(
        ApiEndpoints.twoFactorAuth,
        data: formData,
      );

      if (response.statusCode == 200 && response.data['api_status'] == 200) {
        return AuthResponse.fromJson(response.data);
      } else {
        throw Exception(response.data['message'] ?? 'Verification failed');
      }
    } catch (e) {
      throw Exception('Verification failed: ${e.toString()}');
    }
  }
}
