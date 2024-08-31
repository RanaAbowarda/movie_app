import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/Model/DetailsMovie.dart';
import 'package:movie_app/Model/PopularMovies.dart';
import 'package:movie_app/cubits/details_cubit/details_states.dart';
import 'package:movie_app/cubits/details_cubit/details_view_model.dart';
import 'package:movie_app/cubits/more_like_cubit/more_like_states.dart';
import 'package:movie_app/cubits/more_like_cubit/more_like_view_model.dart';
import 'package:movie_app/home_items/custom_item.dart';
import 'package:movie_app/theme/app_color.dart';

class MovieDetailsScreen extends StatelessWidget {
  const MovieDetailsScreen({super.key});
  static const routeName = "MovieDetailsScreen";

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    var idModel = ModalRoute.of(context)!.settings.arguments as Results;
    return Column(
      children: [
        BlocProvider(
          create: (context) =>
              DetailsViewModel()..getMovieDetails('${idModel.id}'),
          child: BlocBuilder<DetailsViewModel, DetailsStates>(
            builder: (context, state) {
              DetailsMovie? detailsMovie =
                  BlocProvider.of<DetailsViewModel>(context).detailsMovie;

              List<DetailsGenres> genres =
                  BlocProvider.of<DetailsViewModel>(context).genresList;

              if (state is DetailsLoadingState) {
                return Center(
                  child: CircularProgressIndicator(
                    color: AppColor.darkYellowColor,
                  ),
                );
              }
              if (state is DetailsErrorState) {
                return Column(
                  children: [
                    Text(state.errorMessage),
                    ElevatedButton(onPressed: () {}, child: Text('try again'))
                  ],
                );
              }
              if (state is DetailsSuccessState) {
                return Column(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height * 0.28,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(
                                'https://image.tmdb.org/t/p/w500${detailsMovie!.backdropPath ?? '/wWba3TaojhK7NdycRhoQpsG0FaH.jpg'}'),
                            fit: BoxFit.cover),
                      ),
                      child: const Center(
                          child: ImageIcon(
                        AssetImage('assets/images/play-button-2.png'),
                        color: Colors.white,
                        size: 60,
                      )),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      height: MediaQuery.of(context).size.height * 0.35,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          const Spacer(),
                          Text(
                            detailsMovie.originalTitle!,
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                          const Spacer(),
                          Text(
                            detailsMovie.releaseDate!,
                            style: Theme.of(context).textTheme.titleSmall,
                          ),
                          const Spacer(),
                          Row(children: [
                            CustomScreen(
                              widthMeasure: width * 0.25,
                              heightMeasure: height * 0.15,
                              image:
                                  'https://image.tmdb.org/t/p/w500${detailsMovie.posterPath}',
                            ),
                            const Spacer(),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.30,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Spacer(),
                                  Row(
                                    children: [
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.14,
                                        height: 25,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(4),
                                            border: Border.all(
                                              color: AppColor.grayColor,
                                            )),
                                        child: Center(
                                          child: Text(
                                            'Action',
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleSmall,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.14,
                                        height: 25,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(4),
                                            border: Border.all(
                                              color: AppColor.grayColor,
                                            )),
                                        child: Center(
                                          child: Text(
                                            'Action',
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleSmall,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.14,
                                        height: 25,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(4),
                                            border: Border.all(
                                              color: AppColor.grayColor,
                                            )),
                                        child: Center(
                                          child: Text(
                                            'Action',
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleSmall,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const Spacer(
                                    flex: 1,
                                  ),
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width *
                                        0.58,
                                    child: Text(
                                      detailsMovie.overview!.substring(0, 120) +
                                          ' ...',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium,
                                    ),
                                  ),
                                  const Spacer(
                                    flex: 2,
                                  ),
                                  Row(
                                    children: [
                                      const ImageIcon(
                                        AssetImage('assets/images/star-2.png'),
                                        size: 20,
                                        color: AppColor.yellowColor,
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        detailsMovie.voteAverage
                                            .toString()
                                            .substring(0, 3),
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyLarge,
                                      ),
                                    ],
                                  ),
                                  const Spacer(
                                    flex: 3,
                                  ),
                                ],
                              ),
                            ),
                          ]),
                        ],
                      ),
                    ),
                  ],
                );
              }
              return Container();
            },
          ),
        ),
        BlocProvider(
          create: (context) =>
              MoreLikeViewModel()..getmoreLike(idModel.id.toString()),
          child: BlocBuilder<MoreLikeViewModel, MoreLikeStates>(
              builder: (context, state) {
            List<Results> siMilarResults =
                BlocProvider.of<MoreLikeViewModel>(context).similarResultsList;
            if (state is MoreLikeLoadingState) {
              return Center(
                child: CircularProgressIndicator(
                  color: AppColor.darkYellowColor,
                ),
              );
            }
            if (state is MoreLikeErrorState) {
              return Column(
                children: [
                  Text(state.errorMessage),
                  ElevatedButton(onPressed: () {}, child: Text('try again'))
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
                            itemCount: siMilarResults.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.only(right: 10),
                                child: Card(
                                  surfaceTintColor: AppColor.darkGrayColor,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(4)),
                                  elevation: 0.1,
                                  color: Color(0xFF343534),
                                  shadowColor: Colors.black,
                                  child: SizedBox(
                                    height: height * 0.2,
                                    width: width * 0.25,
                                    child: Column(
                                      children: [
                                        CustomScreen(
                                            image:
                                                "https://image.tmdb.org/t/p/w500${siMilarResults[index].posterPath}",
                                            heightMeasure: height * 0.15,
                                            widthMeasure: width * 0.25),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        SizedBox(
                                          height: height * 0.05,
                                          child: Padding(
                                            padding: EdgeInsets.only(left: 5),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  children: [
                                                    const Icon(
                                                      Icons.star,
                                                      color:
                                                          AppColor.yellowColor,
                                                      size: 12,
                                                    ),
                                                    SizedBox(
                                                      width: 5,
                                                    ),
                                                    Text(
                                                      siMilarResults[index]
                                                          .voteAverage
                                                          .toString()
                                                          .substring(0, 3),
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .headlineSmall,
                                                    ),
                                                  ],
                                                ),
                                                Spacer(),
                                                Text(
                                                  siMilarResults[index]
                                                              .originalTitle!
                                                              .length >
                                                          8
                                                      ? siMilarResults[index]
                                                          .originalTitle!
                                                          .substring(0, 8)
                                                      : siMilarResults[index]
                                                          .originalTitle!,
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .headlineSmall,
                                                ),
                                                Spacer(),
                                                Text(
                                                  siMilarResults[index]
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
        ),
      ],
    );
  }
}
