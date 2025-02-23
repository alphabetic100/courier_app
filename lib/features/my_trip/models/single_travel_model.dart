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
  final double lat1; // Latitude of the from location
  final double lon1; // Longitude of the from location
  final double lat2; // Latitude of the to location
  final double lon2; // Longitude of the to location

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
    required this.lat1,
    required this.lon1,
    required this.lat2,
    required this.lon2,
  });

  factory TransportData.fromJson(Map<String, dynamic> json) {
    return TransportData(
      id: json["id"] ?? "",
      userId: json["userId"] ?? "",
      transportType: json["transportType"] ?? "",
      transportNumber: json["transportNumber"] ?? "",
      date: json["date"] ?? "",
      from: json["from"]?.trim() ??
          "", // Trim to remove any leading/trailing spaces
      to: json["to"]?.trim() ??
          "", // Trim to remove any leading/trailing spaces
      weight: json["weight"]?.toString() ?? "",
      price: json["price"] ?? 0,
      rulse: List<String>.from(json["rulse"] ?? []),
      additional: List<String>.from(json["additional"] ?? []),
      createdAt: json["createdAt"] ?? "",
      updatedAt: json["updatedAt"] ?? "",
      booking: (json["booking"] as List?)
              ?.map((e) => Booking.fromJson(e))
              .toList() ??
          [],
      lat1: json["lat1"]?.toDouble() ?? 0.0, // Ensure lat1 is double
      lon1: json["lon1"]?.toDouble() ?? 0.0, // Ensure lon1 is double
      lat2: json["lat2"]?.toDouble() ?? 0.0, // Ensure lat2 is double
      lon2: json["lon2"]?.toDouble() ?? 0.0, // Ensure lon2 is double
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
  final double avgRating;
  final int totalTrips;
  final String itemName; // Item name being transported
  final double itemWeight; // Item weight
  final bool isVerified;

  Booking({
    required this.bookingId,
    required this.userId,
    required this.price,
    required this.message,
    required this.status,
    required this.fullName,
    required this.profileImage,
    required this.avgRating,
    required this.totalTrips,
    required this.itemName,
    required this.itemWeight,
    required this.isVerified,
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
      avgRating: (json["avgRating"] ?? 0).toDouble(),
      totalTrips: json["totalTrips"] ?? 0,
      itemName: json["itemName"] ?? "", // Item name being transported
      itemWeight: (json["itemWeight"] ?? 0).toDouble(), // Item weight
      isVerified: json["isVerified"]?? false,
    );
  }
}
