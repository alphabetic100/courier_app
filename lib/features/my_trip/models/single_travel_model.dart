class SingleTravelModel {
  final bool success;
  final int statusCode;
  final String message;
  final TransportData data;

  SingleTravelModel({
    required this.success,
    required this.statusCode,
    required this.message,
    required this.data,
  });

  factory SingleTravelModel.fromJson(Map<String, dynamic> json) {
    return SingleTravelModel(
      success: json["success"] ?? false,
      statusCode: json["statusCode"] ?? 0,
      message: json["message"] ?? "",
      data: TransportData.fromJson(json["data"] ?? {}),
    );
  }
}

class TransportData {
  final String id;
  final String userId;
  final String transportType;
  final String transportNumber;
  final String date;
  final String from;
  final String to;
  final String weight;
  final int price;
  final List<String> rulse;
  final List<String> additional;
  final String createdAt;
  final String updatedAt;
  final List<Booking> booking;

  TransportData({
    required this.id,
    required this.userId,
    required this.transportType,
    required this.transportNumber,
    required this.date,
    required this.from,
    required this.to,
    required this.weight,
    required this.price,
    required this.rulse,
    required this.additional,
    required this.createdAt,
    required this.updatedAt,
    required this.booking,
  });

  factory TransportData.fromJson(Map<String, dynamic> json) {
    return TransportData(
      id: json["id"] ?? "",
      userId: json["userId"] ?? "",
      transportType: json["transportType"] ?? "",
      transportNumber: json["transportNumber"] ?? "",
      date: json["date"] ?? "",
      from: json["from"] ?? "",
      to: json["to"] ?? "",
      weight: json["weight"]?.toString() ?? "",
      price: json["price"] ?? 0,
      rulse: List<String>.from(json["rulse"] ?? []),
      additional: List<String>.from(json["additional"] ?? []),
      createdAt: json["createdAt"] ?? "",
      updatedAt: json["updatedAt"] ?? "",
      booking: (json["booking"] as List?)?.map((e) => Booking.fromJson(e)).toList() ?? [],
    );
  }
}

class Booking {
  final String bookingId;
  final String userId;
  final int price;
  final String message;
  final String status;
  final String fullName;
  final String profileImage;

  Booking({
    required this.bookingId,
    required this.userId,
    required this.price,
    required this.message,
    required this.status,
    required this.fullName,
    required this.profileImage,
  });

  factory Booking.fromJson(Map<String, dynamic> json) {
    return Booking(
      bookingId: json["bookingId"] ?? "",
      userId: json["userId"] ?? "",
      price: json["price"] ?? 0,
      message: json["message"] ?? "",
      status: json["status"] ?? "",
      fullName: json["fullName"] ?? "",
      profileImage: json["profileImage"] ?? "",
    );
  }
}
