import 'dart:convert';

ItemModel itemModelFromJson(String str) => ItemModel.fromJson(json.decode(str));
String itemModelToJson(ItemModel data) => json.encode(data.toJson());

class ItemModel {
  bool success;
  int statusCode;
  String message;
  List<ItemData> data;

  ItemModel({
    required this.success,
    required this.statusCode,
    required this.message,
    required this.data,
  });

  factory ItemModel.fromJson(Map<String, dynamic> json) => ItemModel(
        success: json["success"] ?? false,
        statusCode: json["statusCode"] ?? 0,
        message: json["message"] ?? "",
        data: (json["data"] as List<dynamic>? ?? [])
            .map((item) => ItemData.fromJson(item))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "statusCode": statusCode,
        "message": message,
        "data": data.map((item) => item.toJson()).toList(),
      };
}

class ItemData {
  String id;
  String userId;
  String name;
  String description;
  int weight;
  List<String> image;
  DateTime createdAt;
  DateTime updatedAt;

  ItemData({
    required this.id,
    required this.userId,
    required this.name,
    required this.description,
    required this.weight,
    required this.image,
    required this.createdAt,
    required this.updatedAt,
  });

  factory ItemData.fromJson(Map<String, dynamic> json) => ItemData(
        id: json["id"] ?? "",
        userId: json["userId"] ?? "",
        name: json["name"] ?? "",
        description: json["description"] ?? "",
        weight: json["weight"] ?? 0,
        image: (json["image"] as List<dynamic>? ?? [])
            .map((e) => e.toString())
            .toList(),
        createdAt: json["createdAt"] != null
            ? DateTime.parse(json["createdAt"])
            : DateTime.now(),
        updatedAt: json["updatedAt"] != null
            ? DateTime.parse(json["updatedAt"])
            : DateTime.now(),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "userId": userId,
        "name": name,
        "description": description,
        "weight": weight,
        "image": image,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
      };
}
