class SocialLoginModel {
  bool success;
  int statusCode;
  String message;
  LoginData data;

  SocialLoginModel({
    required this.success,
    required this.statusCode,
    required this.message,
    required this.data,
  });

  factory SocialLoginModel.fromJson(Map<String, dynamic> json) {
    return SocialLoginModel(
      success: json['success'],
      statusCode: json['statusCode'],
      message: json['message'],
      data: LoginData.fromJson(json['data']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'success': success,
      'statusCode': statusCode,
      'message': message,
      'data': data.toJson(),
    };
  }
}

class LoginData {
  String id;
  String email;
  bool onBoarding;
  String role;
  String accessToken;
  String customerId;

  LoginData({
    required this.id,
    required this.email,
    required this.onBoarding,
    required this.role,
    required this.accessToken,
    required this.customerId,
  });

  factory LoginData.fromJson(Map<String, dynamic> json) {
    return LoginData(
      id: json['id'],
      email: json['email'],
      onBoarding: json['onBoarding'],
      role: json['role'],
      accessToken: json['accessToken'],
      customerId: json["customerId"] ?? "",
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'onBoarding': onBoarding,
      'role': role,
      'accessToken': accessToken,
    };
  }
}
