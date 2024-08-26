import 'package:flutter/material.dart';
import 'package:movie_app/home_items/popular_item.dart';
import 'package:movie_app/screens/movie_details_screen.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return PopularItem();

  }
}
