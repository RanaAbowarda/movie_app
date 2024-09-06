import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/Model/DetailsMovie.dart';
import 'package:movie_app/Model/PopularMovies.dart';
import 'package:movie_app/cubits/details_cubit/details_states.dart';
import 'package:movie_app/cubits/details_cubit/details_view_model.dart';
import 'package:movie_app/home_widget/similar_widget.dart';
import 'package:movie_app/theme/app_color.dart';

import '../items/custom_widget.dart';

class MovieDetailsScreen extends StatelessWidget {
  const MovieDetailsScreen({super.key});
  static const routeName = "MovieDetailsScreen";

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    var idModel = ModalRoute.of(context)!.settings.arguments as Results;
    return ListView(
      children: [
        Column(
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
                    return SizedBox(
                      height: height * 0.5,
                      child: const Center(
                        child: CircularProgressIndicator(
                          color: AppColor.darkYellowColor,
                        ),
                      ),
                    );
                  }
                  if (state is DetailsErrorState) {
                    return Column(
                      children: [
                        Text(state.errorMessage),
                        ElevatedButton(
                            onPressed: () {}, child: const Text('try again'))
                      ],
                    );
                  }
                  if (state is DetailsSuccessState) {
                    return SingleChildScrollView(
                      child: Column(
                        children: [
                          Container(
                            height: 250,
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
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            height: 300,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                const Spacer(),
                                Text(
                                  detailsMovie.originalTitle!,
                                  style: Theme.of(context).textTheme.bodyLarge,
                                  overflow: TextOverflow.ellipsis,
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
                                    height: 250,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const SizedBox(
                                          height: 8,
                                        ),
                                        SizedBox(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.58,
                                          child: Text(
                                            detailsMovie.overview!.length < 120
                                                ? '${detailsMovie.overview!}...'
                                                : detailsMovie.overview!
                                                    .substring(0, 120),
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyMedium,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 8,
                                        ),
                                        Row(
                                          children: [
                                            const ImageIcon(
                                              AssetImage(
                                                  'assets/images/star-2.png'),
                                              size: 20,
                                              color: AppColor.yellowColor,
                                            ),
                                            const SizedBox(
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
                                        const SizedBox(
                                          height: 8,
                                        ),
                                      ],
                                    ),
                                  ),
                                ]),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  }
                  return Container();
                },
              ),
            ),
            const SimilarWidget()
          ],
        ),
      ],
    );
  }
}
