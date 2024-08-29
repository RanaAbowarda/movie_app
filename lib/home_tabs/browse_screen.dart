import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/cubits/brows_category_cubit/brows_category_states.dart';
import 'package:movie_app/cubits/brows_category_cubit/brows_category_view_model.dart';
import 'package:movie_app/theme/app_color.dart';

class BrowseScreen extends StatelessWidget {
  const BrowseScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final hieghtOfScreen = MediaQuery.of(context).size.height;
    final widthOfScreen = MediaQuery.of(context).size.width;

    return BlocProvider(
      create: (context) => BrowsCategoryViewModel()..getBrowsCatogry(),
      child: BlocBuilder<BrowsCategoryViewModel, BrowsCategoryStates>(
        builder: (context, state) {
          var genresList =
              BlocProvider.of<BrowsCategoryViewModel>(context).genresList;

          if (state is BrowsCategoryLoadingState) {
            return Center(
              child: CircularProgressIndicator(
                color: AppColor.darkYellowColor,
              ),
            );
          }
          if (state is BrowsCategoryErrorState) {
            return Column(
              children: [
                Text(state.errorMessage),
                ElevatedButton(onPressed: () {}, child: Text('try again'))
              ],
            );
          }
          if (state is BrowsCategorySuccessState) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: widthOfScreen * 0.1),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(
                    height: hieghtOfScreen * 0.1,
                  ),
                  Text(
                    'Browse Category',
                    style: Theme.of(context).textTheme.bodyLarge,
                    textAlign: TextAlign.left,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Expanded(
                      child: GridView.builder(
                    itemCount: genresList.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 40,
                      mainAxisSpacing: 40,
                      childAspectRatio: 1.5,
                    ),
                    itemBuilder: (context, index) {
                      return Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          image: const DecorationImage(
                            image: AssetImage(
                              'assets/images/0e34a5e080e8c915030603ddcdb4eeba.png',
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: Center(
                          child: Text(
                            genresList[index].name!,
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(color: Colors.white),
                          ),
                        ),
                      );
                    },
                  ))
                ],
              ),
            );
          }
          return Container();
        },
      ),
    );
  }
}
