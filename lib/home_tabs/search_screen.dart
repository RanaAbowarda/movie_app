import 'package:flutter/material.dart';
import 'package:movie_app/cubits/details_cubit/details_view_model.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      child: Center(
        child: ElevatedButton(
            onPressed: () {
              DetailsViewModel().getMovieDetails('533535');
            },
            child: Text('test')),
      ),
    );
  }
}
