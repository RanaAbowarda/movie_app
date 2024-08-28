import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/cubits/popular_cubit/popular_states.dart';
import 'package:movie_app/cubits/popular_cubit/popular_view_model.dart';
import 'package:movie_app/theme/app_color.dart';

class PopularItem extends StatelessWidget {
  PopularItem({
    super.key,
  });

  PopularViewModel popularViewModel = PopularViewModel();

  @override
  Widget build(BuildContext context) {
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
            itemCount:
                BlocProvider.of<PopularViewModel>(context).resultList.length,
            itemBuilder:
                (BuildContext context, int itemIndex, int pageViewIndex) {
              final item = BlocProvider.of<PopularViewModel>(context)
                  .resultList[itemIndex];
              return Stack(
                children: [
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            // fit: BoxFit.fill,
                            image: NetworkImage(
                      item.backdropPath!,
                    ))),
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 30.0, left: 148),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            item.originalTitle!,
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          Text(
                            BlocProvider.of<PopularViewModel>(context)
                                .resultList[1]
                                .releaseDate!,
                            style: Theme.of(context).textTheme.titleSmall,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    top: 150,
                    child: Image.asset(
                      item.posterPath!,
                    ),
                  ),
                ],
              );
            },
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
        return Container();
      }),
    );
  }
}
