import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/Model/genre_model.dart';

class BrowseItem extends StatelessWidget {
  BrowseItem({super.key, required this.genreModel});

  GenreModel genreModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        image: DecorationImage(
          image: AssetImage(
            genreModel.image,
          ),
          fit: BoxFit.cover,
        ),
      ),
      child: Center(
        child: Text(
          genreModel.name,
          style: Theme.of(context)
              .textTheme
              .bodyMedium!
              .copyWith(color: Colors.white),
        ),
      ),
    );
  }
}
