import 'package:dio/dio.dart';
import '../services/storage_service.dart';
import '../config/app_config.dart';

class AuthInterceptor extends Interceptor {
  final StorageService _storageService = StorageService();

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    // Add server key to all requests
    if (options.data is FormData) {
      (options.data as FormData).fields.add(
        MapEntry('server_key', AppConfig.serverKey),
      );
    } else if (options.data is Map) {
      options.data['server_key'] = AppConfig.serverKey;
    }

    // Add access token if available
    final accessToken = await _storageService.getAccessToken();
    if (accessToken != null) {
      options.queryParameters['access_token'] = accessToken;
    }

    handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    // Handle 401 Unauthorized - token expired or invalid
    if (err.response?.statusCode == 401) {
      // Try to refresh token
      final refreshed = await _refreshToken(err.requestOptions.dio);
      
      if (refreshed) {
        // Retry the original request
        try {
          final response = await _retry(err.requestOptions);
          handler.resolve(response);
          return;
        } catch (e) {
          // If retry fails, continue with error
        }
      } else {
        // If refresh fails, clear auth data and redirect to login
        await _storageService.clearAuthData();
      }
    }

    handler.next(err);
  }

  Future<bool> _refreshToken(Dio dio) async {
    try {
      final refreshToken = await _storageService.getRefreshToken();
      if (refreshToken == null) return false;

      // Call refresh token endpoint (adjust according to WoWonder API)
      final response = await dio.post(
        '/api/auth/refresh',
        data: {
          'server_key': AppConfig.serverKey,
          'refresh_token': refreshToken,
        },
      );

      if (response.statusCode == 200 && response.data['access_token'] != null) {
        // Save new tokens
        await _storageService.saveAccessToken(response.data['access_token']);
        if (response.data['refresh_token'] != null) {
          await _storageService.saveRefreshToken(response.data['refresh_token']);
        }
        return true;
      }
      
      return false;
    } catch (e) {
      return false;
    }
  }

  Future<Response<dynamic>> _retry(RequestOptions requestOptions) async {
    final options = Options(
      method: requestOptions.method,
      headers: requestOptions.headers,
    );

    final accessToken = await _storageService.getAccessToken();
    if (accessToken != null) {
      requestOptions.queryParameters['access_token'] = accessToken;
    }

    return Dio().request<dynamic>(
      requestOptions.path,
      data: requestOptions.data,
      queryParameters: requestOptions.queryParameters,
      options: options,
    );
  }
}
