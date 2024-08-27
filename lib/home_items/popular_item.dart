import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class PopularItem extends StatelessWidget {
  const PopularItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
        itemCount: 8,
        itemBuilder: (BuildContext context, int itemIndex,
                int pageViewIndex) =>
            Stack(
              children: [
                Container(

                    width: double.infinity,
                    decoration: const BoxDecoration(

                        image: DecorationImage(
                            // fit: BoxFit.fill,
                            image: AssetImage("assets/images/background.png"))),
                  child:  Padding(
                    padding: const EdgeInsets.only(bottom: 30.0,left: 148),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          "Dora and the lost city of gold",
                          style: Theme.of(context).textTheme.titleMedium,

                        ),
                        Text(
                          "2019  PG-13  2h 7m",
                          style: Theme.of(context).textTheme.titleSmall,

                        ),
                      ],
                    ),
                  )
                  ,
                   ),
                Positioned(
                  top: 150,
                  child: Image.asset("assets/images/Image.png",),



                ),

              ],
            ),
        options: CarouselOptions(
          height: 350,
          aspectRatio: 16 / 9,
          viewportFraction: 0.9,
          initialPage: 0,
          enableInfiniteScroll: true,
          reverse: false,
          autoPlay: true,
          autoPlayInterval: const Duration(seconds: 5),
          autoPlayAnimationDuration: const Duration(milliseconds: 800),
          autoPlayCurve: Curves.linear,
          enlargeStrategy: CenterPageEnlargeStrategy.zoom,
          enlargeCenterPage: true,
          enlargeFactor: 0.20,
          scrollDirection: Axis.horizontal,
        ),
      );
  }
}
