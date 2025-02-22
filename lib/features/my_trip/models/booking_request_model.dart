class BookingRequestModel {
  final bool success;
  final int statusCode;
  final String message;
  final BookingRequestData data;

  BookingRequestModel({
    required this.success,
    required this.statusCode,
    required this.message,
    required this.data,
  });

  factory BookingRequestModel.fromJson(Map<String, dynamic> json) {
    return BookingRequestModel(
      success: json["success"] ?? false,
      statusCode: json["statusCode"] ?? 0,
      message: json["message"] ?? "",
      data: BookingRequestData.fromJson(json["data"] ?? {}),
    );
  }
}

class BookingRequestData {
  final String id;
  final String userId;
  final String transportId;
  final String travelerId;
  final String itemId;
  final int price;
  final String status;
  final User user;
  final Transport transport;
  final Item item;
  final String message1;

  BookingRequestData({
    required this.id,
    required this.userId,
    required this.transportId,
    required this.travelerId,
    required this.itemId,
    required this.price,
    required this.status,
    required this.user,
    required this.transport,
    required this.item,
    required this.message1,
  });

  factory BookingRequestData.fromJson(Map<String, dynamic> json) {
    return BookingRequestData(
      id: json["id"] ?? "",
      userId: json["userId"] ?? "",
      transportId: json["transportId"] ?? "",
      travelerId: json["travelerId"] ?? "",
      message1: json["message"] ?? "",
      itemId: json["itemId"] ?? "",
      price: json["price"] ?? 0,
      status: json["status"] ?? "",
      user: User.fromJson(json["user"] ?? {}),
      transport: Transport.fromJson(json["transport"] ?? {}),
      item: Item.fromJson(json["item"] ?? {}),
    );
  }
}

class User {
  final String id;
  final String fullName;
  final String? profileImage;
  final bool isVerified;

  User({
    required this.id,
    required this.fullName,
    this.profileImage,
    required this.isVerified,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json["id"] ?? "",
      fullName: json["fullName"] ?? "",
      profileImage: json["profileImage"],
      isVerified: json["isVerified"] ?? false,
    );
  }
}

class Transport {
  final String id;
  final String transportType;
  final String transportNumber;
  final String date;
  final String from;
  final String to;
  final double lat1;
  final double lon1;
  final double lat2;
  final double lon2;
  final int price;
  final String weight;

  Transport({
    required this.id,
    required this.transportType,
    required this.transportNumber,
    required this.date,
    required this.from,
    required this.to,
    required this.lat1,
    required this.lon1,
    required this.lat2,
    required this.lon2,
    required this.price,
    required this.weight,
  });

  factory Transport.fromJson(Map<String, dynamic> json) {
    return Transport(
      id: json["id"] ?? "",
      transportType: json["transportType"] ?? "",
      transportNumber: json["transportNumber"] ?? "",
      date: json["date"] ?? "",
      from: json["from"]?.trim() ?? "",
      to: json["to"]?.trim() ?? "",
      lat1: json["lat1"]?.toDouble() ?? 0.0,
      lon1: json["lon1"]?.toDouble() ?? 0.0,
      lat2: json["lat2"]?.toDouble() ?? 0.0,
      lon2: json["lon2"]?.toDouble() ?? 0.0,
      price: json["price"] ?? 0,
      weight: json["weight"] ?? "",
    );
  }
}

class Item {
  final String id;
  final String name;
  final String description;
  final double weight;
  final List<String> image;

  Item({
    required this.id,
    required this.name,
    required this.description,
    required this.weight,
    required this.image,
  });

  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(
      id: json["id"] ?? "",
      name: json["name"] ?? "",
      description: json["description"] ?? "",
      weight: (json["weight"] ?? 0).toDouble(),
      image: List<String>.from(json["image"] ?? []),
    );
  }
}
