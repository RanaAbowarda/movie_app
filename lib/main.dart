import 'package:flutter/material.dart';
import 'package:movie_app/screens/homeScreen.dart';
import 'package:movie_app/screens/movie_details_screen.dart';
import 'package:movie_app/screens/splash_screen.dart';
import 'package:movie_app/theme/my_theme_data.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: MyThemeData.darkTheme,
      initialRoute: SplashScreen.routeName,
      routes: {
        HomeScreen.routeName: (context) => const HomeScreen(),
        SplashScreen.routeName: (context) => const SplashScreen(),
        MovieDetailsScreen.routeName: (context) => const MovieDetailsScreen(),
      },
    );
  }
}
