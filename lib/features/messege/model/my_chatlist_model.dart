class MyChatlistModel {
  final bool success;
  final int statusCode;
  final String message;
  final List<ChatData> data;

  MyChatlistModel({
    required this.success,
    required this.statusCode,
    required this.message,
    required this.data,
  });

  factory MyChatlistModel.fromJson(Map<String, dynamic> json) {
    return MyChatlistModel(
      success: json["success"] ?? false,
      statusCode: json["statusCode"] ?? 0,
      message: json["message"] ?? "",
      data:
          (json["data"] as List?)?.map((e) => ChatData.fromJson(e)).toList() ??
              [],
    );
  }
}

class ChatData {
  final User user;
  final String lastMessage;
  final String lastMessageDate;
  final bool isRead;

  ChatData({
    required this.user,
    required this.lastMessage,
    required this.lastMessageDate,
    required this.isRead,
  });

  factory ChatData.fromJson(Map<String, dynamic> json) {
    return ChatData(
      user: json["user"] != null ? User.fromJson(json["user"]) : User.empty(),
      isRead: json["isRead"] ?? false,
      lastMessage: json["lastMessage"] ?? "",
      lastMessageDate: json["lastMessageDate"] ?? "",
    );
  }
}

class User {
  final String id;
  final String fullName;
  final String email;
  final String profileImage;

  User({
    required this.id,
    required this.fullName,
    required this.email,
    required this.profileImage,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json["id"] ?? "",
      fullName: json["fullName"] ?? "",
      email: json["email"] ?? "",
      profileImage: json["profileImage"] ?? "",
    );
  }

  factory User.empty() {
    return User(id: "", fullName: "", email: "", profileImage: "");
  }
}
