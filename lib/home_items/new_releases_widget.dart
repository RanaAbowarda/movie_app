import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubits/new_released_cubit/new_release_states.dart';
import '../cubits/new_released_cubit/new_release_view_model.dart';
import '../theme/app_color.dart';
import 'custom_item.dart';

class NewReleasesWidget extends StatelessWidget {
  NewReleasesWidget({super.key});

  NewReleasedViewModel newReleasedViewModel = NewReleasedViewModel();

  @override
  Widget build(BuildContext context) {
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
              const Text("Some Thing Went Wrong!!"),
              ElevatedButton(
                onPressed: () {},
                child: const Text("Try Again"),
              )
            ],
          );
        }
        if (state is NewReleasedSuccessState) {
          return Container(
            height: 127,
            padding: EdgeInsets.all(10),
            color: AppColor.secondaryColor,
            child: Column(
              children: [
                Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "New Releases",
                      style: Theme.of(context).textTheme.titleLarge,
                    )),
                SizedBox(
                  height: 170,
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
                          padding: const EdgeInsets.all(10.0),
                          child: CustomScreen(
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
