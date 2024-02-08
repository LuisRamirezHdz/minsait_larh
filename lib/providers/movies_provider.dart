import 'dart:async';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:minsait_larh/models/models.dart';

class MoviesProvider extends ChangeNotifier {
  final String _apiKey = '1865f43a0549ca50d341dd9ab8b29f49';
  final _baseUrl = 'api.themoviedb.org';
  final String _language = 'es-ES';

  List<Movie> popularMovies = [];
  List<Movie> topRatedMovies = [];
  List<Movie> upcomingdMovies = [];

  int _popularPage = 0;
  int _topRatedPage = 0;
  int _upcomingPage = 0;

  final StreamController<List<Movie>> _suggestionStreamContoller =
      StreamController.broadcast();
  Stream<List<Movie>> get suggestionStream => _suggestionStreamContoller.stream;

  MoviesProvider() {
    getPopularMovies();
    getTopRatedMovies();
    getUpcomingMovies();
  }

  Future<String> _getJsonData(String endpoint, [int page = 1]) async {
    final url = Uri.https(_baseUrl, endpoint,
        {'api_key': _apiKey, 'language': _language, 'page': '$page'});

    // Await the http get response, then decode the json-formatted response.
    final response = await http.get(url);
    return response.body;
  }

  getPopularMovies() async {
    _popularPage++;

    final jsonData = await _getJsonData('3/movie/popular', _popularPage);
    final popularResponse = PopularResponse.fromJson(jsonData);

    popularMovies = [...popularMovies, ...popularResponse.results];
    notifyListeners();
  }

  getTopRatedMovies() async {
    _topRatedPage++;

    final jsonData = await _getJsonData('3/movie/top_rated', _topRatedPage);
    final topRatedResponse = PopularResponse.fromJson(jsonData);

    topRatedMovies = [...topRatedMovies, ...topRatedResponse.results];
    notifyListeners();
  }

  getUpcomingMovies() async {
    _upcomingPage++;

    final jsonData = await _getJsonData('3/movie/upcoming', _upcomingPage);
    final upcomingResponse = PopularResponse.fromJson(jsonData);

    upcomingdMovies = [...upcomingdMovies, ...upcomingResponse.results];
    notifyListeners();
  }
}
