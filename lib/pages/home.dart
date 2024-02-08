import 'package:flutter/material.dart';

import 'package:minsait_larh/providers/movies_provider.dart';
import 'package:minsait_larh/widgets/widgets.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  final AsyncSnapshot? data;

  const Home({super.key, this.data});
  static const route = 'Home';

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  dynamic scaffoldKey = GlobalKey<ScaffoldState>();
  dynamic screen;
  dynamic safePadding;

  @override
  Widget build(BuildContext context) {
    screen = MediaQuery.of(context).size;
    safePadding = MediaQuery.of(context).padding;

    final moviesProvider = Provider.of<MoviesProvider>(context);

    return Board(
      title: 'Películas',
      bottomBar: BottomBar(active: ActiveBottomBarIcon.home),
      body: Stack(
        children: [
          SizedBox(
            height: screen.height,
            width: screen.width,
            child: SingleChildScrollView(
              child: Column(children: [
                SizedBox(
                  height: screen.height / 40,
                ),
                MovieSlider(
                  movies: moviesProvider.popularMovies,
                  title: 'Más populares',
                  onNextPage: () => moviesProvider.getPopularMovies(),
                ),
                MovieSlider(
                  movies: moviesProvider.topRatedMovies,
                  title: 'Mejor calificadas',
                  onNextPage: () => moviesProvider.getTopRatedMovies(),
                ),
                MovieSlider(
                  movies: moviesProvider.upcomingdMovies,
                  title: 'Próximamente',
                  onNextPage: () => moviesProvider.getUpcomingMovies(),
                ),
                SizedBox(
                  height: screen.height / 4,
                ),
              ]),
            ),
          ),
        ],
      ),
    );
  }

  Widget errorSearchUsers() {
    return const Center(
        child: Text(
      "Error, try later",
      style: TextStyle(color: Colors.black),
    ));
  }
}
