import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel {
  @JsonKey(name: 'user_id')
  final String userId;
  
  final String username;
  
  final String email;
  
  @JsonKey(name: 'first_name')
  final String? firstName;
  
  @JsonKey(name: 'last_name')
  final String? lastName;
  
  final String? avatar;
  
  final String? cover;
  
  final String? about;
  
  final String? website;
  
  @JsonKey(name: 'phone_number')
  final String? phoneNumber;
  
  final String? gender;
  
  final String? birthday;
  
  final String? country;
  
  final String? city;
  
  final String? address;
  
  @JsonKey(name: 'is_verified')
  final int? isVerified;
  
  @JsonKey(name: 'is_pro')
  final int? isPro;
  
  @JsonKey(name: 'joined')
  final String? joined;
  
  @JsonKey(name: 'last_seen')
  final String? lastSeen;

  UserModel({
    required this.userId,
    required this.username,
    required this.email,
    this.firstName,
    this.lastName,
    this.avatar,
    this.cover,
    this.about,
    this.website,
    this.phoneNumber,
    this.gender,
    this.birthday,
    this.country,
    this.city,
    this.address,
    this.isVerified,
    this.isPro,
    this.joined,
    this.lastSeen,
  });

  String get fullName {
    if (firstName != null && lastName != null) {
      return '$firstName $lastName';
    } else if (firstName != null) {
      return firstName!;
    } else if (lastName != null) {
      return lastName!;
    }
    return username;
  }

  bool get verified => isVerified == 1;
  
  bool get pro => isPro == 1;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
