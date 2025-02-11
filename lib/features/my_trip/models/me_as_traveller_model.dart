class MeAsTravellerModel {
  final bool success;
  final int statusCode;
  final String message;
  final List<TransportData> data;

  MeAsTravellerModel({
    required this.success,
    required this.statusCode,
    required this.message,
    required this.data,
  });

  factory MeAsTravellerModel.fromJson(Map<String, dynamic> json) {
    return MeAsTravellerModel(
      success: json["success"] ?? false,
      statusCode: json["statusCode"] ?? 0,
      message: json["message"] ?? "",
      data: (json["data"] as List?)
              ?.map((e) => TransportData.fromJson(e))
              .toList() ??
          [],
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
  final List<String> rules;
  final List<String> additional;
  final String createdAt;
  final String updatedAt;
  final List<dynamic> booking;
  final int pendingCount;

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
    required this.rules,
    required this.additional,
    required this.createdAt,
    required this.updatedAt,
    required this.booking,
    required this.pendingCount,
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
      weight: json["weight"] ?? "",
      price: json["price"] ?? 0,
      rules: (json["rulse"] as List?)?.map((e) => e.toString()).toList() ?? [],
      additional:
          (json["additional"] as List?)?.map((e) => e.toString()).toList() ??
              [],
      createdAt: json["createdAt"] ?? "",
      updatedAt: json["updatedAt"] ?? "",
      booking: json["booking"] ?? [],
      pendingCount: json["pendingCount"] ?? 0,
    );
  }
}
