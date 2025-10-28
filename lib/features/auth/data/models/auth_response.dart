import 'package:json_annotation/json_annotation.dart';
import '../../../../core/models/user_model.dart';

part 'auth_response.g.dart';

@JsonSerializable()
class AuthResponse {
  @JsonKey(name: 'access_token')
  final String accessToken;
  
  @JsonKey(name: 'user_id')
  final String userId;
  
  final String? timezone;
  
  @JsonKey(name: 'user_data')
  final UserModel? userData;

  AuthResponse({
    required this.accessToken,
    required this.userId,
    this.timezone,
    this.userData,
  });

  factory AuthResponse.fromJson(Map<String, dynamic> json) =>
      _$AuthResponseFromJson(json);

  Map<String, dynamic> toJson() => _$AuthResponseToJson(this);
}
