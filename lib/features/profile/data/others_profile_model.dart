class OthersProfileModel {
  final bool success;
  final int statusCode;
  final String message;
  final UserData data;

  OthersProfileModel({
    required this.success,
    required this.statusCode,
    required this.message,
    required this.data,
  });

  factory OthersProfileModel.fromJson(Map<String, dynamic> json) {
    return OthersProfileModel(
      success: json["success"] ?? false,
      statusCode: json["statusCode"] ?? 0,
      message: json["message"] ?? "",
      data: UserData.fromJson(json["data"] ?? {}),
    );
  }
}

class UserData {
  final String id;
  final String fullName;
  final String phoneNumber;
  final String email;
  final String profileImage;
  final String license;
  final String passport;
  final bool isVerified;
  final String nationalId;
  final String role;
  final String status;
  final String createdAt;
  final String updatedAt;
  final double averageRating;

  UserData({
    required this.id,
    required this.fullName,
    required this.phoneNumber,
    required this.email,
    required this.profileImage,
    required this.license,
    required this.passport,
    required this.isVerified,
    required this.nationalId,
    required this.role,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.averageRating,
  });

  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
      id: json["id"] ?? "",
      fullName: json["fullName"] ?? "",
      phoneNumber: json["phoneNumber"] ?? "",
      email: json["email"] ?? "",
      profileImage: json["profileImage"] ?? "",
      license: json["license"] ?? "",
      passport: json["passport"] ?? "",
      isVerified: json["isVerified"] ?? false,
      nationalId: json["nationalId"] ?? "",
      role: json["role"] ?? "",
      status: json["status"] ?? "",
      createdAt: json["createdAt"] ?? "",
      updatedAt: json["updatedAt"] ?? "",
      averageRating: (json["averageRating"] ?? 0).toDouble(),
    );
  }
}
