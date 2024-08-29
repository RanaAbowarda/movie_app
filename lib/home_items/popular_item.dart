import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/cubits/popular_cubit/popular_states.dart';
import 'package:movie_app/cubits/popular_cubit/popular_view_model.dart';
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

          // bloc: PopularViewModel()..getPopular(),
          builder: (context, state) {
        if (state is PopularLoadingState) {
          return const Center(
            child: CircularProgressIndicator(
              color: AppColor.darkYellowColor,
            ),
          );
        }
        if (state is PopularSuccessState) {
          return CarouselSlider.builder(
            itemCount: popularViewModel.resultList.length,
            itemBuilder:
                (BuildContext context, int itemIndex, int pageViewIndex) {
              var resultList = BlocProvider.of<PopularViewModel>(context)
                  .resultList[itemIndex];
              return Stack(
                children: [
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(
                                "https://image.tmdb.org/t/p/w500${resultList.backdropPath}"))),
                    child: Padding(
                      padding: EdgeInsets.only(
                          bottom: height * 0.01, left: width * 0.45),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            resultList.originalTitle!,
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            resultList.releaseDate!,
                            style: Theme.of(context).textTheme.titleSmall,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    top: 150,
                    left: 20,
                    child: Container(
                      width: width * 0.35,
                      height: height * 0.5,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          image: DecorationImage(
                            image: NetworkImage(
                              "https://image.tmdb.org/t/p/w500${resultList.posterPath}",
                            ),
                            fit: BoxFit.cover,
                          )),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Image.network(
                              "https://image.tmdb.org/t/p/w500${resultList.posterPath}"),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            },
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
              onPageChanged: (index, reason) {},
              scrollDirection: Axis.horizontal,
            ),
          );
        }
        return Container();
      }),
    );
  }
}
