import 'package:flutter/material.dart';
import 'package:minsait_larh/providers/movies_provider.dart';
import 'package:minsait_larh/providers/review_list_provider.dart';
import 'package:minsait_larh/routes.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => MoviesProvider(), lazy: false),
        ChangeNotifierProvider(create: (_) => new ReviewListProvider()),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: Home.route,
        onGenerateRoute: getAppRoutes,
      ),
    );
  }
}
