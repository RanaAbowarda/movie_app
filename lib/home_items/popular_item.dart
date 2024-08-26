



import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';


class PopularItem extends StatelessWidget {
 const  PopularItem({super.key,});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          CarouselSlider.builder(
              itemCount:8,
              itemBuilder:
                  (BuildContext context, int itemIndex, int pageViewIndex) =>
                     Container(
                       child:Image.asset("assets/images/Image.png"),
                     ),
              options: CarouselOptions(
                height: 289,
                aspectRatio: 16/9,
                viewportFraction: 0.8,
                initialPage: 0,
                enableInfiniteScroll: true,
                reverse: false,
                autoPlay: true,
                autoPlayInterval:const Duration(seconds: 5),
                autoPlayAnimationDuration:const Duration(milliseconds: 800),
                autoPlayCurve: Curves.fastOutSlowIn,
                enlargeCenterPage: true,
                enlargeFactor: 0.3,
                scrollDirection: Axis.horizontal,
              ),
          ),
          Row(
            children: [

              Column(
                children: [
                  Text("Dora and the lost city of gold",style: Theme.of(context).textTheme.titleMedium,),
                  Text("2019  PG-13  2h 7m",style:Theme.of(context).textTheme.titleSmall ,),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
