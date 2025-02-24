class SocialSignupModel {
  bool success;
  int statusCode;
  String message;
  LoginData data;

  SocialSignupModel({
    required this.success,
    required this.statusCode,
    required this.message,
    required this.data,
  });

  factory SocialSignupModel.fromJson(Map<String, dynamic> json) {
    return SocialSignupModel(
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
  String accountLink;
  bool onBoarding;
  String customerId;
  String role;
  String accessToken;

  LoginData({
    required this.id,
    required this.email,
    required this.accountLink,
    required this.onBoarding,
    required this.customerId,
    required this.role,
    required this.accessToken,
  });

  factory LoginData.fromJson(Map<String, dynamic> json) {
    return LoginData(
      id: json['id'],
      email: json['email'],
      accountLink: json['accountLink'],
      onBoarding: json['onBoarding'],
      customerId: json['customerId'] ?? "",
      role: json['role'],
      accessToken: json['accessToken'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'accountLink': accountLink,
      'onBoarding': onBoarding,
      'customerId': customerId,
      'role': role,
      'accessToken': accessToken,
    };
  }
}
