import 'package:flutter/material.dart';
import 'package:movie_app/theme/app_color.dart';
import 'package:movie_app/widgets/item_of_watch_list.dart';

class WatchListScreen extends StatelessWidget {
  const WatchListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final hieghtOfScreen = MediaQuery.of(context).size.height;
    final widthOfScreen = MediaQuery.of(context).size.width;
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
                return const  Divider(
                  height: 35,
                  color: AppColor.grayColor,
                );
              },
              itemBuilder: (context, index) {
                return ItemOfWatchList(
                  widthOfScreen: widthOfScreen,
                  heightOfScreen: hieghtOfScreen,
                );
              },
              itemCount: 5,
            ),
          )
        ],
      ),
    );
  }
}
