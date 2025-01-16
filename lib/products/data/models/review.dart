import 'package:intl/intl.dart';

class Review {
  final int? rating;
  final String? comment;
  // final DateTime date;
  final String? reviewName;
  final String? reviewerEmail;

  const Review({
    required this.rating,
    required this.comment,
    // required this.date,
    required this.reviewName,
    required this.reviewerEmail,
  });


  factory Review.fromJson(Map<String, dynamic> reviewData) {

    // // Helper function to parse date string into valid datetime object
    // DateTime parseDate(String dateString) {
    //   // convert string date into DateTime
    //   final dateTime = DateTime.parse(dateString);
    //
    //   // format date to yyyy-MM-dd string
    //   final formatter = DateFormat('yMd');
    //
    //   // again convert that formatted string date into DateTime
    //   final formattedDate = formatter.format(dateTime);
    //   return DateTime.parse(formattedDate);
    // }

    return Review(
      rating: reviewData['rating'] ?? 0.0,
      comment: reviewData['comment'] ?? '',
      // date: parseDate(reviewData['data'] ?? DateTime.now()),
      reviewName: reviewData['reviewName'] ?? 'Unavailable',
      reviewerEmail: reviewData['reviewerEmail'] ?? 'Unavailable',
    );
  }
}
