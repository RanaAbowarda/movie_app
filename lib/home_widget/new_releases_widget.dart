import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubits/new_released_cubit/new_release_states.dart';
import '../cubits/new_released_cubit/new_release_view_model.dart';
import '../items/custom_widget.dart';
import '../theme/app_color.dart';

class NewReleasesWidget extends StatelessWidget {
  NewReleasesWidget({super.key});

  NewReleasedViewModel newReleasedViewModel = NewReleasedViewModel();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return BlocProvider(
      create: (context) => NewReleasedViewModel()..getNewReleased(),
      child: BlocBuilder<NewReleasedViewModel, NewReleasedState>(
          builder: (context, state) {
        if (state is NewReleasedLoadingState) {
          return const Center(
            child: CircularProgressIndicator(
              color: AppColor.darkYellowColor,
            ),
          );
        }
        if (state is NewReleasedErrorState) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                "Some Thing Went Wrong!!",
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              ElevatedButton(
                onPressed: () {},
                child: Text("Try Again",
                    style: Theme.of(context).textTheme.headlineMedium),
              )
            ],
          );
        }
        if (state is NewReleasedSuccessState) {
          return Container(
            height: height * 0.22,
            padding: const EdgeInsets.only(left: 10, bottom: 10, top: 10),
            color: AppColor.secondaryColor,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Text(
                    "New Releases",
                    style: Theme.of(context).textTheme.titleLarge,
                    textAlign: TextAlign.start,
                  ),
                ),
                SizedBox(
                  height: height * 0.16,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: BlocProvider.of<NewReleasedViewModel>(context)
                          .newResultList
                          .length,
                      itemBuilder: (context, index) {
                        final item =
                            BlocProvider.of<NewReleasedViewModel>(context)
                                .newResultList[index];
                        return Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: CustomScreen(
                            results: item,
                            image:
                                "https://image.tmdb.org/t/p/w500/${item.posterPath!}",
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
