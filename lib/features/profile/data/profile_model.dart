
import 'dart:convert';

ProfileModel profileModelFromJson(String str) => ProfileModel.fromJson(json.decode(str));

String profileModelToJson(ProfileModel data) => json.encode(data.toJson());

class ProfileModel {
  bool? success;
  int? statusCode;
  String? message;
  Data? data;

  ProfileModel({
    this.success,
    this.statusCode,
    this.message,
    this.data,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) => ProfileModel(
    success: json["success"],
    statusCode: json["statusCode"],
    message: json["message"],
    data: json["data"] == null ? null : Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "statusCode": statusCode,
    "message": message,
    "data": data?.toJson(),
  };
}

class Data {
  String? id;
  String? fullName;
  String? email;
  dynamic profileImage;
  String? phoneNumber;
  bool? isVerified;
  String? license;
  String? passport;
  String? nationalId;
  String? status;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? averageRating;

  Data({
    this.id,
    this.fullName,
    this.email,
    this.profileImage,
    this.phoneNumber,
    this.isVerified,
    this.license,
    this.passport,
    this.nationalId,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.averageRating,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"],
    fullName: json["fullName"],
    email: json["email"],
    profileImage: json["profileImage"],
    phoneNumber: json["phoneNumber"],
    isVerified: json["isVerified"],
    license: json["license"],
    passport: json["passport"],
    nationalId: json["nationalId"],
    status: json["status"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    averageRating: json["averageRating"],
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
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "averageRating": averageRating,
  };
}
