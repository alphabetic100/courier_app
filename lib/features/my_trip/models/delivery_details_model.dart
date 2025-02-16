class DeliveryDetailsModel {
  final bool success;
  final int statusCode;
  final String message;
  final List<BookingData> data;

  DeliveryDetailsModel({
    required this.success,
    required this.statusCode,
    required this.message,
    required this.data,
  });

  factory DeliveryDetailsModel.fromJson(Map<String, dynamic> json) {
    return DeliveryDetailsModel(
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
  final String transportNumber;
  final String transportType;
  final String transportDate;
  final String transportFrom;
  final String transportTo;
  final double transportPrice;
  final String itemName;
  final String itemDescription;
  final double itemWeight;
  final List<String> itemImage;
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
    required this.transportNumber,
    required this.transportType,
    required this.transportDate,
    required this.transportFrom,
    required this.transportTo,
    required this.transportPrice,
    required this.itemName,
    required this.itemDescription,
    required this.itemWeight,
    required this.itemImage,
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
      averageRating: (json['averageRating'] ?? 0).toDouble(),
      transportNumber: json['transportNumber'] ?? "",
      transportType: json['transportType'] ?? "",
      transportDate: json['transportDate'] ?? "",
      transportFrom: json['transportFrom'] ?? "",
      transportTo: json['transportTo'] ?? "",
      transportPrice: (json['transportPrice'] ?? 0).toDouble(),
      itemName: json['itemName'] ?? "",
      itemDescription: json['itemDescription'] ?? "",
      itemWeight: (json['itemWeight'] ?? 0).toDouble(),
      itemImage: (json['itemImage'] as List?)
              ?.map((e) => e.toString())
              .toList() ??
          [],
      fullName: json['fullName'] ?? "",
      email: json['email'] ?? "",
      profileImage: json['profileImage'] ?? "",
      isVerified: json['isVerified'] ?? false,
    );
  }
}
