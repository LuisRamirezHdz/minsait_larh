part of 'models.dart';

class Review {
  Review({
    this.id,
    this.movie = "",
    this.review = "",
  });

  int? id;
  String movie;
  String review;

  factory Review.fromJson(Map<String, dynamic> json) => Review(
        id: json["id"],
        movie: json["movie"],
        review: json["review"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "movie": movie,
        "review": review,
      };
}
