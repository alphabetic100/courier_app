class TravellerProfileModel {
  final bool success;
  final int statusCode;
  final String message;
  final TravelerData data;

  TravellerProfileModel({
    required this.success,
    required this.statusCode,
    required this.message,
    required this.data,
  });

  factory TravellerProfileModel.fromJson(Map<String, dynamic> json) {
    return TravellerProfileModel(
      success: json['success'] ?? false,
      statusCode: json['statusCode'] ?? 0,
      message: json['message'] ?? "",
      data: TravelerData.fromJson(json['data'] ?? {}),
    );
  }
}

class TravelerData {
  final String id;
  final String fullName;
  final String profileImage;
  final bool isVerified;
  final String createdAt;
  final String updatedAt;
  final List<Review> review;
  final double averageRating;
  final int totalTrips;
  final int totalReviewsWithComments;

  TravelerData({
    required this.id,
    required this.fullName,
    required this.profileImage,
    required this.isVerified,
    required this.createdAt,
    required this.updatedAt,
    required this.review,
    required this.averageRating,
    required this.totalTrips,
    required this.totalReviewsWithComments,
  });

  factory TravelerData.fromJson(Map<String, dynamic> json) {
    return TravelerData(
      id: json['id'] ?? "",
      fullName: json['fullName'] ?? "",
      profileImage: json['profileImage'] ?? "",
      isVerified: json['isVerified'] ?? false,
      createdAt: json['createdAt'] ?? "",
      updatedAt: json['updatedAt'] ?? "",
      review:
          (json['review'] as List?)?.map((e) => Review.fromJson(e)).toList() ??
              [],
      averageRating: (json['averageRating'] ?? 0).toDouble(),
      totalTrips: json['totalTrips'] ?? 0,
      totalReviewsWithComments: json['totalReviewsWithComments'] ?? 0,
    );
  }
}

class Review {
  final String id;
  final int rating;
  final String comment;
  final ReviewUser user;

  Review({
    required this.id,
    required this.rating,
    required this.comment,
    required this.user,
  });

  factory Review.fromJson(Map<String, dynamic> json) {
    return Review(
      id: json['id'] ?? "",
      rating: json['rating'] ?? 0,
      comment: json['comment'] ?? "",
      user: ReviewUser.fromJson(json['user'] ?? {}),
    );
  }
}

class ReviewUser {
  final String id;
  final String fullName;
  final String profileImage;

  ReviewUser({
    required this.id,
    required this.fullName,
    required this.profileImage,
  });

  factory ReviewUser.fromJson(Map<String, dynamic> json) {
    return ReviewUser(
      id: json['id'] ?? "",
      fullName: json['fullName'] ?? "",
      profileImage: json['profileImage'] ?? "",
    );
  }
}
