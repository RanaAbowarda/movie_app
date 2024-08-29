import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/cubits/recommended_cubit/recommended_states.dart';
import 'package:movie_app/cubits/recommended_cubit/recommended_view_model.dart';
import 'package:movie_app/theme/app_color.dart';

import 'custom_item.dart';

class RecommendedWidget extends StatelessWidget {
  RecommendedWidget({super.key});

  RecommendedViewModel recommendedViewModel = RecommendedViewModel();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RecommendedViewModel()..getRecommended(),
      child: BlocBuilder<RecommendedViewModel, RecommendedState>(
          builder: (context, state) {
        if (state is RecommendedLoadingState) {
          return const Center(
            child: CircularProgressIndicator(
              color: AppColor.darkYellowColor,
            ),
          );
        }
        if (state is RecommendedErrorState) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text("Some Thing Went Wrong!!"),
              ElevatedButton(
                onPressed: () {},
                child: const Text("Try Again"),
              )
            ],
          );
        }
        if (state is RecommendedSuccessState) {
          return Container(
            height: 127,
            margin: EdgeInsets.symmetric(vertical: 12),
            padding: const EdgeInsets.symmetric(vertical: 10),
            color: AppColor.secondaryColor,
            child: Column(
              children: [
                Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Recommend",
                      style: Theme.of(context).textTheme.titleLarge,
                    )),
                SizedBox(
                  height: 150,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: BlocProvider.of<RecommendedViewModel>(context)
                          .recommendList
                          .length,
                      itemBuilder: (context, index) {
                        final item =
                            BlocProvider.of<RecommendedViewModel>(context)
                                .recommendList[index];
                        return Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Card(
                            child: Column(
                              children: [
                                CustomScreen(
                                  image:
                                      "https://image.tmdb.org/t/p/w500/${item.posterPath!}",
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    const Icon(
                                      Icons.star,
                                      color: AppColor.yellowColor,
                                    ),
                                    Text("${item.voteAverage!}"),
                                  ],
                                ),
                                Text(item.title!),
                                Text(item.releaseDate!)
                              ],
                            ),
                          ),
                        );
                      }),
                ),
              ],
            ),
          );
        }
        return Container();
      }),
    );
  }
}
