import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/screens/homeScreen.dart';
import 'package:movie_app/screens/log_in_screen.dart';
import 'package:movie_app/screens/movie_details_screen.dart';
import 'package:movie_app/screens/sign_up_screen.dart';
import 'package:movie_app/screens/splash_screen.dart';
import 'package:movie_app/theme/my_theme_data.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  WidgetsFlutterBinding.ensureInitialized();

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
        SignInScreen.routeName: (context) => const SignInScreen(),
        SignUpScreen.routeName: (context) => const SignUpScreen(),
      },
    );
  }
}
