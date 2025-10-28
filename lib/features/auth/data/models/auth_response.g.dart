// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthResponse _$AuthResponseFromJson(Map<String, dynamic> json) => AuthResponse(
      accessToken: json['access_token'] as String,
      userId: json['user_id'] as String,
      timezone: json['timezone'] as String?,
      userData: json['user_data'] == null
          ? null
          : UserModel.fromJson(json['user_data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AuthResponseToJson(AuthResponse instance) =>
    <String, dynamic>{
      'access_token': instance.accessToken,
      'user_id': instance.userId,
      'timezone': instance.timezone,
      'user_data': instance.userData,
    };
