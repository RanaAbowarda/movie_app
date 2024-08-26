import 'package:flutter/material.dart';
import 'package:movie_app/theme/app_color.dart';

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
                return Divider(
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

class ItemOfWatchList extends StatelessWidget {
  const ItemOfWatchList({
    super.key,
    required this.widthOfScreen,
    required this.heightOfScreen,
  });

  final double widthOfScreen;
  final double heightOfScreen;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 15,
        left: 5,
      ),
      child: Row(
        children: [
          Container(
            height: heightOfScreen * 0.1,
            width: widthOfScreen * 0.34,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              image: DecorationImage(
                image: AssetImage(
                  'assets/images/fd56e79a492733f92951955aa0ae532f.png',
                ),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    Image.asset(
                      'assets/images/Icon awesome-bookmark.png',
                      color: AppColor.yellowColor,
                    ),
                    Positioned(
                      top: 10,
                      left: 10,
                      child: ImageIcon(
                        AssetImage(
                          'assets/images/Icon awesome-check.png',
                        ),
                        color: Colors.white,
                        size: 11,
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Alita Battle Angel',
                style: Theme.of(context).textTheme.bodyLarge,
                textAlign: TextAlign.left,
              ),
              Text(
                '2019',
                style: Theme.of(context).textTheme.bodyMedium,
                textAlign: TextAlign.left,
              ),
              Text(
                'Rosa Salazar, Christoph Waltz',
                style: Theme.of(context).textTheme.bodyMedium,
                textAlign: TextAlign.left,
              ),
            ],
          )
        ],
      ),
    );
  }
}
