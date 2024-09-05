import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/cubits/browse_category_cubit/browse_category_states.dart';
import 'package:movie_app/cubits/browse_category_cubit/browse_category_view_model.dart';
import 'package:movie_app/items/custom_widget.dart';

import '../Model/genre_model.dart';
import '../screens/movie_details_screen.dart';
import '../theme/app_color.dart';

class BrowseWidget extends StatelessWidget {
  BrowseWidget({super.key, required this.id});

  BrowseCategoryViewModel browseCategoryViewModel = BrowseCategoryViewModel();
  @override
  int id;
  GenreModel? genreModel;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BrowseCategoryViewModel()..getBrowsCategory(id),
      child: BlocBuilder<BrowseCategoryViewModel, BrowseCategoryStates>(
          builder: (context, state) {
        if (state is BrowseCategoryLoadingState) {
          return const Center(
            child: CircularProgressIndicator(
              color: AppColor.darkYellowColor,
            ),
          );
        }
        if (state is BrowseCategoryErrorState) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                "Some Thing Went Wrong!!",
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              ElevatedButton(
                onPressed: () {
                  BlocProvider.of<BrowseCategoryViewModel>(context)
                      .getBrowsCategory(id);
                },
                child: Text(
                  "Try Again",
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              )
            ],
          );
        }
        if (state is BrowseCategorySuccessState) {
          return Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: GridView.builder(
                itemCount: BlocProvider.of<BrowseCategoryViewModel>(context)
                    .genresList
                    .length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 5,
                  mainAxisSpacing: 5,
                  childAspectRatio: .8,
                ),
                itemBuilder: (context, index) {
                  final item = BlocProvider.of<BrowseCategoryViewModel>(context)
                      .genresList[index];
                  return Padding(
                    padding: const EdgeInsets.only(
                      top: 20,
                      left: 20,
                    ),
                    child: Column(
                      children: [
                        GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(
                                context,
                                MovieDetailsScreen.routeName,
                                arguments: item,
                              );
                            },
                            child: CustomScreen(
                                results: item,
                                image:
                                    "https://image.tmdb.org/t/p/w500/${item.posterPath!}")),
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Icon(
                                    Icons.star,
                                    color: AppColor.yellowColor,
                                  ),
                                  Text(
                                    "${item.voteAverage!}",
                                    style:
                                        Theme.of(context).textTheme.titleMedium,
                                    textAlign: TextAlign.center,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              ),
                              Align(
                                alignment: Alignment.center,
                                child: Text(
                                  item.title!,
                                  style: Theme.of(context).textTheme.titleLarge,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              Align(
                                alignment: Alignment.center,
                                child: Text(
                                  item.releaseDate!,
                                  style: Theme.of(context).textTheme.titleLarge,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  );
                },
              ),
            ),
          );
        }
        return Container();
      }),
    );
  }
}
