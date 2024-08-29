import 'package:flutter/material.dart';

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
                Image.asset(
                  'assets/images/bookmark.png',
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
