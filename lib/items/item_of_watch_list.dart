import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:movie_app/Model/PopularMovies.dart';
import 'package:movie_app/Model/firebase_function.dart';
import 'package:movie_app/Model/movie_model.dart';
import 'package:movie_app/theme/app_color.dart';

class ItemOfWatchList extends StatelessWidget {
  ItemOfWatchList(
      {super.key,
      required this.widthOfScreen,
      required this.heightOfScreen,
      required this.movie});

  Movie movie;
  Results? results;
  final double widthOfScreen;
  final double heightOfScreen;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.all(15),
        child: Slidable(
          startActionPane: ActionPane(
            motion: const DrawerMotion(),
            children: [
              SlidableAction(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(15),
                      bottomLeft: Radius.circular(15)),
                  backgroundColor: AppColor.primaryColor,
                  icon: Icons.delete,
                  label: 'Delete',
                  spacing: 8,
                  onPressed: (context) {
                    FirebaseFunction.deleteMovie(movie.title);
                  }),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.only(
              top: 15,
              left: 5,
            ),
            child: Row(
              children: [
                Container(
                  height: 90,
                  width: widthOfScreen * 0.34,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    image: DecorationImage(
                      image: CachedNetworkImageProvider(
                          "https://image.tmdb.org/t/p/w500${movie.image}"),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image.asset(
                        'assets/images/bookmark.png',
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      movie.title.length < 13
                          ? movie.title
                          : movie.title.substring(0, 13),
                      style: Theme.of(context).textTheme.bodyLarge,
                      textAlign: TextAlign.left,
                    ),
                    Text(
                      movie.releasedDate,
                      style: Theme.of(context).textTheme.bodyMedium,
                      textAlign: TextAlign.left,
                    ),
                    Text(
                      movie.originalTitle,
                      style: Theme.of(context).textTheme.bodyMedium,
                      textAlign: TextAlign.left,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
