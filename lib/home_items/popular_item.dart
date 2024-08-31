import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/cubits/popular_cubit/popular_states.dart';
import 'package:movie_app/cubits/popular_cubit/popular_view_model.dart';
import 'package:movie_app/screens/movie_details_screen.dart';
import 'package:movie_app/theme/app_color.dart';

// ignore: must_be_immutable
class PopularItem extends StatelessWidget {
  PopularItem({
    super.key,
  });

  PopularViewModel popularViewModel = PopularViewModel();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return BlocProvider(
      create: (context) => PopularViewModel()..getPopular(),
      child: BlocBuilder<PopularViewModel, PopularStates>(
          builder: (context, state) {
        var resultList = BlocProvider.of<PopularViewModel>(context).resultList;
        if (state is PopularLoadingState) {
          return Center(
            child: CircularProgressIndicator(
              color: AppColor.darkYellowColor,
            ),
          );
        }
        if (state is PopularErrorState) {
          return Column(
            children: [
              Text(state.errorMessage),
              ElevatedButton(onPressed: () {}, child: Text('try again'))
            ],
          );
        }
        if (state is PopularSuccessState) {
          return CarouselSlider.builder(
            itemCount: 8,
            itemBuilder:
                (BuildContext context, int itemIndex, int pageViewIndex) =>
                    InkWell(
              onTap: () {
                Navigator.pushNamed(
                  context,
                  MovieDetailsScreen.routeName,
                  arguments: resultList[itemIndex],
                );
              },
              child: Container(
                height: height * 0.32,
                width: double.infinity,
                child: Stack(
                  children: [
                    Column(
                      children: [
                        Container(
                          height: height * 0.23,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(
                                  "https://image.tmdb.org/t/p/w500${resultList[itemIndex].backdropPath}"),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              top: height * 0.015, left: width * 0.45),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Text(
                                resultList[itemIndex].title!,
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                resultList[itemIndex].releaseDate!,
                                style: Theme.of(context).textTheme.titleSmall,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Positioned(
                      top: height * 0.1,
                      left: 20,
                      child: Container(
                        width: width * 0.35,
                        height: height * 0.22,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            image: DecorationImage(
                              image: NetworkImage(
                                "https://image.tmdb.org/t/p/w500${resultList[itemIndex].posterPath}",
                              ),
                              fit: BoxFit.cover,
                            )),
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
                    ),
                  ],
                ),
              ),
            ),
            options: CarouselOptions(
              height: 350,
              aspectRatio: 16 / 9,
              viewportFraction: 1,
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
        return Container();
      }),
    );
  }
}
