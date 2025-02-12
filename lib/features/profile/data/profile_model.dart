import 'dart:convert';

ProfileModel profileModelFromJson(String str) =>
    ProfileModel.fromJson(json.decode(str));
String profileModelToJson(ProfileModel data) => json.encode(data.toJson());

class ProfileModel {
  bool success;
  int statusCode;
  String message;
  Data data;

  ProfileModel({
    required this.success,
    required this.statusCode,
    required this.message,
    required this.data,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) => ProfileModel(
        success: json["success"] ?? false,
        statusCode: json["statusCode"] ?? 0,
        message: json["message"] ?? "",
        data: Data.fromJson(json["data"] ?? {}),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "statusCode": statusCode,
        "message": message,
        "data": data.toJson(),
      };
}

class Data {
  String id;
  String fullName;
  String email;
  String profileImage;
  String phoneNumber;
  bool isVerified;
  String license;
  String passport;
  String nationalId;
  String status;
  DateTime createdAt;
  DateTime updatedAt;
  int averageRating;

  Data({
    required this.id,
    required this.fullName,
    required this.email,
    required this.profileImage,
    required this.phoneNumber,
    required this.isVerified,
    required this.license,
    required this.passport,
    required this.nationalId,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.averageRating,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"] ?? "",
        fullName: json["fullName"] ?? "",
        email: json["email"] ?? "",
        profileImage: json["profileImage"] ?? "",
        phoneNumber: json["phoneNumber"] ?? "N/A",
        isVerified: json["isVerified"] ?? false,
        license: json["license"] ?? "",
        passport: json["passport"] ?? "",
        nationalId: json["nationalId"] ?? "",
        status: json["status"] ?? "",
        createdAt: json["createdAt"] != null
            ? DateTime.parse(json["createdAt"])
            : DateTime.now(),
        updatedAt: json["updatedAt"] != null
            ? DateTime.parse(json["updatedAt"])
            : DateTime.now(),
        averageRating: json["averageRating"] ?? 0,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "fullName": fullName,
        "email": email,
        "profileImage": profileImage,
        "phoneNumber": phoneNumber,
        "isVerified": isVerified,
        "license": license,
        "passport": passport,
        "nationalId": nationalId,
        "status": status,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "averageRating": averageRating,
      };
}
