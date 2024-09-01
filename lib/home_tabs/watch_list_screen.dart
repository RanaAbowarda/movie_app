import 'package:flutter/material.dart';
import 'package:movie_app/Model/firebase_function.dart';
import 'package:movie_app/theme/app_color.dart';

import '../items/item_of_watch_list.dart';

class WatchListScreen extends StatelessWidget {
  const WatchListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final hieghtOfScreen = MediaQuery.of(context).size.height;
    final widthOfScreen = MediaQuery.of(context).size.width;
    return StreamBuilder(
      stream: FirebaseFunction.getMovie(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        }
        if (snapshot.hasError) {
          return Center(
            child: Column(
              children: [
                Text(
                  "Some Thing Wrong",
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                ElevatedButton(
                    onPressed: () {
                      FirebaseFunction.getMovie();
                    },
                    child: Text(
                      "Try Again",
                      style: Theme.of(context).textTheme.headlineMedium,
                    ))
              ],
            ),
          );
        }
        var movies = snapshot.data!.docs.map((doc) => doc.data()).toList();
        if (movies.isEmpty) {
          return Center(
              child: Text(
            "NO Movies",
            style: Theme.of(context).textTheme.headlineMedium,
          ));
        }
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: widthOfScreen * 0.068),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                height: hieghtOfScreen * 0.1,
              ),
              Text(
                'Watchlist',
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.left,
              ),
              Expanded(
                child: ListView.separated(
                  separatorBuilder: (context, index) {
                    return const Divider(
                      height: 35,
                      color: AppColor.grayColor,
                    );
                  },
                  itemBuilder: (context, index) {
                    return ItemOfWatchList(
                      movie: movies[index],
                      widthOfScreen: widthOfScreen,
                      heightOfScreen: hieghtOfScreen,
                    );
                  },
                  itemCount: movies.length,
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
