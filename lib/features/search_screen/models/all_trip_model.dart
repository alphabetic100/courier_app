class AllTripModel {
  final bool success;
  final int statusCode;
  final String message;
  final List<TransportData> data;

  AllTripModel({
    required this.success,
    required this.statusCode,
    required this.message,
    required this.data,
  });

  factory AllTripModel.fromJson(Map<String, dynamic> json) {
    return AllTripModel(
      success: json['success'] ?? false,
      statusCode: json['statusCode'] ?? 0,
      message: json['message'] ?? '',
      data: (json['data'] as List?)
              ?.map((e) => TransportData.fromJson(e))
              .toList() ??
          [],
    );
  }
}

class TransportData {
  final String id;
  final String transportType;
  final String transportNumber;
  final String date;
  final String from;
  final String to;
  final String weight;
  final int price;
  final List<String> rulse;
  final List<String> additional;
  final User user;

  TransportData({
    required this.id,
    required this.transportType,
    required this.transportNumber,
    required this.date,
    required this.from,
    required this.to,
    required this.weight,
    required this.price,
    required this.rulse,
    required this.additional,
    required this.user,
  });

  factory TransportData.fromJson(Map<String, dynamic> json) {
    return TransportData(
      id: json['id'] ?? '',
      transportType: json['transportType'] ?? '',
      transportNumber: json['transportNumber'] ?? '',
      date: json['date'] ?? '',
      from: json['from'] ?? '',
      to: json['to'] ?? '',
      weight: json['weight'] ?? '',
      price: json['price'] ?? 0,
      rulse: (json['rulse'] as List?)?.map((e) => e.toString()).toList() ?? [],
      additional:
          (json['additional'] as List?)?.map((e) => e.toString()).toList() ??
              [],
      user: User.fromJson(json['user'] ?? {}),
    );
  }
}

class User {
  final String id;
  final String fullName;
  final String profileImage;
  final bool isVerified;
  final int averageRating;

  User({
    required this.id,
    required this.fullName,
    required this.profileImage,
    required this.isVerified,
    required this.averageRating,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] ?? '',
      fullName: json['fullName'] ?? '',
      profileImage: json['profileImage'] ?? '',
      isVerified: json['isVerified'] ?? false,
      averageRating: json['averageRating'] ?? 0,
    );
  }
}
