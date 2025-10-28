import 'package:json_annotation/json_annotation.dart';

part 'api_response.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class ApiResponse<T> {
  @JsonKey(name: 'api_status')
  final int apiStatus;
  
  final String? message;
  
  final T? data;
  
  final Map<String, dynamic>? errors;

  ApiResponse({
    required this.apiStatus,
    this.message,
    this.data,
    this.errors,
  });

  bool get isSuccess => apiStatus == 200;
  
  bool get hasErrors => errors != null && errors!.isNotEmpty;

  factory ApiResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Object? json) fromJsonT,
  ) =>
      _$ApiResponseFromJson(json, fromJsonT);

  Map<String, dynamic> toJson(Object Function(T value) toJsonT) =>
      _$ApiResponseToJson(this, toJsonT);
}
