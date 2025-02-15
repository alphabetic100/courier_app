class MyBookingsModel {
  final bool success;
  final int statusCode;
  final String message;
  final List<BookingData> data;

  MyBookingsModel({
    required this.success,
    required this.statusCode,
    required this.message,
    required this.data,
  });

  factory MyBookingsModel.fromJson(Map<String, dynamic> json) {
    return MyBookingsModel(
      success: json['success'] ?? false,
      statusCode: json['statusCode'] ?? 0,
      message: json['message'] ?? "",
      data: (json['data'] as List?)
              ?.map((e) => BookingData.fromJson(e))
              .toList() ??
          [],
    );
  }
}

class BookingData {
  final String bookingId;
  final String userId;
  final String transportId;
  final String travelerId;
  final String itemId;
  final double price;
  final String status;
  final double averageRating;
  final String itemName;
  final String itemDescription;
  final double itemWeight;
  final String fullName;
  final String email;
  final String profileImage;
  final bool isVerified;

  BookingData({
    required this.bookingId,
    required this.userId,
    required this.transportId,
    required this.travelerId,
    required this.itemId,
    required this.price,
    required this.status,
    required this.averageRating,
    required this.itemName,
    required this.itemDescription,
    required this.itemWeight,
    required this.fullName,
    required this.email,
    required this.profileImage,
    required this.isVerified,
  });

  factory BookingData.fromJson(Map<String, dynamic> json) {
    return BookingData(
      bookingId: json['bookingId'] ?? "",
      userId: json['userId'] ?? "",
      transportId: json['transportId'] ?? "",
      travelerId: json['travelerId'] ?? "",
      itemId: json['itemId'] ?? "",
      price: (json['price'] ?? 0).toDouble(),
      status: json['status'] ?? "",
      averageRating: (json['averageRating'] ?? 0.0).toDouble(),
      itemName: json['itemName'] ?? "",
      itemDescription: json['itemDescription'] ?? "",
      itemWeight: (json['itemWeight'] ?? 0).toDouble(),
      fullName: json['fullName'] ?? "",
      email: json['email'] ?? "",
      profileImage: json['profileImage'] ?? "",
      isVerified: json['isVerified'] ?? false,
    );
  }
}
