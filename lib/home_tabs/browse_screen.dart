import 'package:flutter/material.dart';
import 'package:movie_app/Model/genre_model.dart';
import 'package:movie_app/items/browse_item.dart';

class BrowseScreen extends StatelessWidget {
  BrowseScreen({super.key, required this.onItemClick});

  Function onItemClick;
  @override
  Widget build(BuildContext context) {
    final hieghtOfScreen = MediaQuery.of(context).size.height;
    final widthOfScreen = MediaQuery.of(context).size.width;

    var genre = GenreModel.getGenre();
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: widthOfScreen * 0.1),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            height: hieghtOfScreen * 0.1,
          ),
          Text(
            'Browse Category',
            style: Theme.of(context).textTheme.bodyLarge,
            textAlign: TextAlign.left,
          ),
          const SizedBox(
            height: 20,
          ),
          Expanded(
              child: GridView.builder(
            itemCount: genre.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 40,
              mainAxisSpacing: 40,
              childAspectRatio: 1.5,
            ),
            itemBuilder: (context, index) {
              return GestureDetector(
                  onTap: () {
                    onItemClick(genre[index]);
                  },
                  child: BrowseItem(genreModel: genre[index]));
            },
          ))
        ],
      ),
    );
  }
}