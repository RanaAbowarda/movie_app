import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../Model/PopularMovies.dart';
import '../cubits/more_like_cubit/more_like_states.dart';
import '../cubits/more_like_cubit/more_like_view_model.dart';
import '../items/custom_widget.dart';
import '../theme/app_color.dart';

class SimilarWidget extends StatelessWidget {
  const SimilarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    var idModel = ModalRoute.of(context)!.settings.arguments as Results;
    return BlocProvider(
      create: (context) => MoreLikeViewModel()..getMoreLike("${idModel.id}"),
      child: BlocBuilder<MoreLikeViewModel, MoreLikeStates>(
          builder: (context, state) {
        final similarResults =
            BlocProvider.of<MoreLikeViewModel>(context).similarResultsList;
        if (state is MoreLikeLoadingState) {
          return const Center(
            child: CircularProgressIndicator(
              color: AppColor.darkYellowColor,
            ),
          );
        }
        if (state is MoreLikeErrorState) {
          return Column(
            children: [
              Text(state.errorMessage),
              ElevatedButton(
                  onPressed: () {
                    BlocProvider.of<MoreLikeViewModel>(context)
                        .getMoreLike("${idModel.id}");
                  },
                  child: Text('Try Again',
                      style: Theme.of(context).textTheme.headlineMedium))
            ],
          );
        }
        if (state is MoreLikeSuccessState) {
          return Container(
            height: height * 0.27,
            padding: const EdgeInsets.only(top: 10),
            color: AppColor.secondaryColor,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 5, left: 10),
                  child: Text(
                    "More Like This",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: SizedBox(
                    height: height * 0.22,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: similarResults.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: Card(
                              surfaceTintColor: AppColor.darkGrayColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(4),
                              ),
                              elevation: 0.1,
                              color: AppColor.secondaryBlackColor,
                              shadowColor: AppColor.blackColor,
                              child: SizedBox(
                                height: height * 0.2,
                                width: width * 0.25,
                                child: Column(
                                  children: [
                                    CustomPosterItem(
                                        results: similarResults[index],
                                        image:
                                            "https://image.tmdb.org/t/p/w500${similarResults[index].posterPath}",
                                        heightMeasure: height * 0.15,
                                        widthMeasure: width * 0.25),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    SizedBox(
                                      height: height * 0.05,
                                      child: Padding(
                                        padding: const EdgeInsets.only(left: 5),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                const Icon(
                                                  Icons.star,
                                                  color: AppColor.yellowColor,
                                                  size: 12,
                                                ),
                                                const SizedBox(
                                                  width: 5,
                                                ),
                                                Text(
                                                  similarResults[index]
                                                      .voteAverage
                                                      .toString()
                                                      .substring(0, 3),
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .headlineSmall,
                                                ),
                                              ],
                                            ),
                                            const Spacer(),
                                            Text(
                                              similarResults[index]
                                                          .originalTitle!
                                                          .length >
                                                      8
                                                  ? similarResults[index]
                                                      .originalTitle!
                                                      .substring(0, 8)
                                                  : similarResults[index]
                                                      .originalTitle!,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headlineSmall,
                                            ),
                                            const Spacer(),
                                            Text(
                                              similarResults[index]
                                                  .releaseDate!,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodySmall,
                                            )
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          );
                        }),
                  ),
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
