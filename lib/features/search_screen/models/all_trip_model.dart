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
  final List<String> rules;
  final List<String> additional;
  final double lon1;
  final double lat1;
  final double lon2;
  final double lat2;
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
    required this.rules,
    required this.additional,
    required this.lon1,
    required this.lat1,
    required this.lon2,
    required this.lat2,
    required this.user,
  });

  factory TransportData.fromJson(Map<String, dynamic> json) {
    return TransportData(
      id: json['id'] ?? '',
      transportType: json['transportType'] ?? '',
      transportNumber: json['transportNumber'] ?? '',
      date: json['date'] ?? '',
      from: json['from']?.trim() ?? '',
      to: json['to']?.trim() ?? '',
      weight: json['weight']?.toString() ?? '0',
      price: json['price'] ?? 0,
      rules: (json['rulse'] as List?)?.map((e) => e.toString()).toList() ?? [],
      additional:
          (json['additional'] as List?)?.map((e) => e.toString()).toList() ??
              [],
      lon1: json['lon1']?.toDouble() ?? 0.0,
      lat1: json['lat1']?.toDouble() ?? 0.0,
      lon2: json['lon2']?.toDouble() ?? 0.0,
      lat2: json['lat2']?.toDouble() ?? 0.0,
      user: User.fromJson(json['user'] ?? {}),
    );
  }
}

class User {
  final String id;
  final String fullName;
  final String profileImage;
  final bool isVerified;
  final double averageRating;
  final String accountId;

  User({
    required this.id,
    required this.fullName,
    required this.profileImage,
    required this.isVerified,
    required this.averageRating,
    required this.accountId,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] ?? '',
      fullName: json['fullName'] ?? '',
      profileImage: json['profileImage'] ?? '',
      isVerified: json['isVerified'] ?? false,
      averageRating: (json['averageRating'] ?? 0).toDouble(),
      accountId: json['accountId'] ?? '',
    );
  }
}
