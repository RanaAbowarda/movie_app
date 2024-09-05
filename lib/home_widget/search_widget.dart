import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app/cubits/search_cubit/search__view_model.dart';
import 'package:movie_app/cubits/search_cubit/search_state.dart';
import 'package:movie_app/items/custom_widget.dart';

import '../screens/movie_details_screen.dart';
import '../theme/app_color.dart';

class SearchTab extends SearchDelegate {
  @override
  ThemeData appBarTheme(BuildContext context) {
    return ThemeData(
      iconTheme: const IconThemeData(color: AppColor.grayColor),
      appBarTheme: const AppBarTheme(
        toolbarHeight: 145,
        color: AppColor.primaryColor, // affects AppBar's background color
      ),
      inputDecorationTheme: InputDecorationTheme(
        hintStyle: const TextStyle(color: AppColor.grayColor),
        filled: true,
        fillColor: AppColor.darkGrayColor,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: const BorderSide(color: AppColor.grayColor),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: const BorderSide(color: AppColor.grayColor),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 20),
      ),
      scaffoldBackgroundColor: AppColor.primaryColor,
    );
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    return null;
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return null;
  }

  @override
  Widget buildResults(BuildContext context) {
    if (query == "") {
      return SizedBox(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("assets/images/movie_icon.png"),
              Text(
                "No Movies",
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ],
          ),
        ),
      );
    } else {
      return buildSearchData(query);
    }
  }

  Widget buildSearchData(String query) {
    return BlocProvider(
      create: (context) => SearchViewModel()..getSearch(query),
      child:
          BlocBuilder<SearchViewModel, SearchStates>(builder: (context, state) {
        if (state is SearchLoadingState) {
          return const Center(
            child: CircularProgressIndicator(
              color: AppColor.darkYellowColor,
            ),
          );
        }
        if (state is SearchErrorState) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text("Some Thing Went Wrong!!",
                  style: Theme.of(context).textTheme.headlineMedium),
              ElevatedButton(
                onPressed: () {
                  BlocProvider.of<SearchViewModel>(context).getSearch(query);
                },
                child: Text("Try Again",
                    style: Theme.of(context).textTheme.headlineMedium),
              )
            ],
          );
        }
        if (state is SearchSuccessState) {
          return ListView.separated(
            itemCount:
                BlocProvider.of<SearchViewModel>(context).searchList.length,
            itemBuilder: (context, index) {
              final item =
                  BlocProvider.of<SearchViewModel>(context).searchList[index];
              return Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    InkWell(
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
                              "https://image.tmdb.org/t/p/w500/${item.posterPath ?? ""}"),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
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
                              style: GoogleFonts.inter(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: AppColor.whiteColor),
                              textAlign: TextAlign.center,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: Text(
                            item.title!,
                            style: GoogleFonts.inter(
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                                color: AppColor.whiteColor),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: Text(
                            item.releaseDate!,
                            style: GoogleFonts.inter(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: AppColor.whiteColor),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return const Divider(
                indent: 30,
                endIndent: 30,
              );
            },
          );
        }
        return Container();
      }),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query == "") {
      return SizedBox(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("assets/images/movie_icon.png"),
              Text(
                "No Movies",
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ],
          ),
        ),
      );
    } else {
      return buildSearchData(query);
    }
  }
}
