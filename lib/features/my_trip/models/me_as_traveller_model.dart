class MeAsTravellerModel {
  final bool success;
  final int statusCode;
  final String message;
  final TransportResponse data;

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
      data: TransportResponse.fromJson(json["data"] ?? {}),
    );
  }
}

class TransportResponse {
  final List<TransportData> transportsWithPendingCount;
  final int totalPendingCount;

  TransportResponse({
    required this.transportsWithPendingCount,
    required this.totalPendingCount,
  });

  factory TransportResponse.fromJson(Map<String, dynamic> json) {
    return TransportResponse(
      transportsWithPendingCount: (json["transportsWithPendingCount"] as List?)
              ?.map((e) => TransportData.fromJson(e))
              .toList() ??
          [],
      totalPendingCount: json["totalPendingCount"] ?? 0,
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
  final List<Booking> booking;
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
      booking: (json["booking"] as List?)
              ?.map((e) => Booking.fromJson(e))
              .toList() ??
          [],
      pendingCount: json["pendingCount"] ?? 0,
    );
  }
}

class Booking {
  final String id;
  final String status;

  Booking({
    required this.id,
    required this.status,
  });

  factory Booking.fromJson(Map<String, dynamic> json) {
    return Booking(
      id: json["id"] ?? "",
      status: json["status"] ?? "",
    );
  }
}
