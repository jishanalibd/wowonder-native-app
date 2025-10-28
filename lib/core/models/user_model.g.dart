// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
      userId: json['user_id'] as String,
      username: json['username'] as String,
      email: json['email'] as String,
      firstName: json['first_name'] as String?,
      lastName: json['last_name'] as String?,
      avatar: json['avatar'] as String?,
      cover: json['cover'] as String?,
      about: json['about'] as String?,
      website: json['website'] as String?,
      phoneNumber: json['phone_number'] as String?,
      gender: json['gender'] as String?,
      birthday: json['birthday'] as String?,
      country: json['country'] as String?,
      city: json['city'] as String?,
      address: json['address'] as String?,
      isVerified: json['is_verified'] as int?,
      isPro: json['is_pro'] as int?,
      joined: json['joined'] as String?,
      lastSeen: json['last_seen'] as String?,
    );

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'user_id': instance.userId,
      'username': instance.username,
      'email': instance.email,
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'avatar': instance.avatar,
      'cover': instance.cover,
      'about': instance.about,
      'website': instance.website,
      'phone_number': instance.phoneNumber,
      'gender': instance.gender,
      'birthday': instance.birthday,
      'country': instance.country,
      'city': instance.city,
      'address': instance.address,
      'is_verified': instance.isVerified,
      'is_pro': instance.isPro,
      'joined': instance.joined,
      'last_seen': instance.lastSeen,
    };
