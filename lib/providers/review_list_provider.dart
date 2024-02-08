import 'package:flutter/material.dart';
import 'package:minsait_larh/models/models.dart';
import 'package:minsait_larh/providers/db_provider.dart';

class ReviewListProvider extends ChangeNotifier {
  List<Review> reviews = [];
  String tipoSeleccionado = 'http';

  Future<Review> nuevoReview(String movie, String review) async {
    final nuevoReview = Review(movie: movie, review: review);
    final id = await DBProvider.db.newReview(nuevoReview);
    // Asignar el ID de la base de datos al modelo
    nuevoReview.id = id;

    reviews.add(nuevoReview);

    notifyListeners();
    return nuevoReview;
  }

  cargarReviews() async {
    final Reviews = await DBProvider.db.getAllReviews();
    reviews = Reviews;
    //notifyListeners();
  }
}
