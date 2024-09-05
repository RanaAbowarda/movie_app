import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/Model/PopularMovies.dart';

class CarousalWidget extends StatelessWidget {
  CarousalWidget({super.key, required this.result});

  List<Results> result = [];

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: result.length,
      itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) =>
          Column(
        children: [
          const SizedBox(
            height: 50,
          ),
          Container(
            height: 230,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: CachedNetworkImageProvider(
                    "https://image.tmdb.org/t/p/w500${result[itemIndex].backdropPath}"),
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                result[itemIndex].title!.length < 15
                    ? result[itemIndex].title!
                    : result[itemIndex].title!.substring(0, 15),
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                result[itemIndex].releaseDate!,
                style: Theme.of(context).textTheme.titleSmall,
              ),
            ],
          ),
        ],
      ),
      options: CarouselOptions(
        height: 350,
        aspectRatio: 16 / 5,
        viewportFraction: 0.5,
        initialPage: 0,
        enableInfiniteScroll: true,
        reverse: false,
        autoPlay: true,
        autoPlayInterval: const Duration(seconds: 5),
        autoPlayAnimationDuration: const Duration(milliseconds: 800),
        autoPlayCurve: Curves.linear,
        enlargeStrategy: CenterPageEnlargeStrategy.zoom,
        enlargeCenterPage: true,
        enlargeFactor: 0.5,
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}
